// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart' as media;

bool _shiftCoverBusy = false;

Future<void> shiftCoverAuthFlow(
    BuildContext context,
    String? operation,
    String? email,
    String? password,
    String? confirmation,
    String? displayName,
    String? jobRole) async {
  if (_shiftCoverBusy || !context.mounted) return;
  operation ??= '';
  email ??= '';
  password ??= '';
  confirmation ??= '';
  displayName ??= '';
  jobRole ??= '';
  final auth = FirebaseAuth.instance;
  String? message;
  String? destination;
  final address = email.trim();
  final name = displayName.trim();
  final title = jobRole.trim();
  final isGate =
      operation == 'home' || operation == 'profile' || operation == 'setup';
  void notify(String text) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
  }

  if (operation == 'signup' || operation == 'login' || operation == 'reset') {
    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(address)) {
      notify('Please enter a valid email address.');
      return;
    }
    if (operation != 'reset' && password.isEmpty) {
      notify('Please enter your password.');
      return;
    }
    if (operation == 'signup') {
      if (password.length < 8 || !RegExp(r'[0-9]').hasMatch(password)) {
        notify('Use at least 8 characters, including a number.');
        return;
      }
      if (password != confirmation) {
        notify('Passwords do not match.');
        return;
      }
    }
  }
  if (operation == 'saveSetup' || operation == 'saveProfile') {
    if (name.isEmpty || name.length > 80) {
      notify('Enter a display name between 1 and 80 characters.');
      return;
    }
    if (title.isEmpty || title.length > 60) {
      notify('Enter a job title between 1 and 60 characters.');
      return;
    }
  }
  media.XFile? photo;
  if (operation == 'photo') {
    if (auth.currentUser == null) {
      context.goNamed('Login');
      return;
    }
    _shiftCoverBusy = true;
    try {
      photo = await media.ImagePicker().pickImage(
          source: media.ImageSource.gallery,
          maxWidth: 1600,
          maxHeight: 1600,
          imageQuality: 85);
    } catch (_) {
      notify('The photo could not be opened. Please try again.');
    } finally {
      _shiftCoverBusy = false;
    }
    if (!context.mounted || photo == null) return;
    try {
      if (await photo.length() > 5 * 1024 * 1024) {
        notify('Choose a photo smaller than 5 MB.');
        return;
      }
    } catch (_) {
      notify('The selected photo could not be read.');
      return;
    }
  }
  _shiftCoverBusy = true;
  final navigator = Navigator.of(context, rootNavigator: true);
  final progress = DialogRoute<void>(
    context: context,
    barrierDismissible: false,
    builder: (_) => PopScope(
        canPop: false,
        child: AlertDialog(
          content: Row(children: [
            const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2)),
            const SizedBox(width: 16),
            Flexible(
                child: Text(isGate ? 'Loading your profile…' : 'Please wait…')),
          ]),
        )),
  );
  unawaited(navigator.push(progress));
  try {
    if (operation == 'logout') {
      GoRouter.of(context).prepareAuthEvent();
      await auth.signOut();
      currentUserDocument = null;
      GoRouter.of(context).clearRedirectLocation();
      destination = 'Login';
    } else if (operation == 'reset') {
      await auth.sendPasswordResetEmail(email: address);
      message =
          'If an account exists for that email, a password reset link has been sent.';
    } else {
      if (operation == 'signup' || operation == 'login') {
        GoRouter.of(context).prepareAuthEvent();
        if (operation == 'signup') {
          await auth.createUserWithEmailAndPassword(
              email: address, password: password);
        } else {
          await auth.signInWithEmailAndPassword(
              email: address, password: password);
        }
      }
      final user = auth.currentUser;
      if (user == null) {
        destination = 'Login';
      } else {
        final ref =
            FirebaseFirestore.instance.collection('users').doc(user.uid);
        final snapshot = await ref
            .get(const GetOptions(source: Source.server))
            .timeout(const Duration(seconds: 15));
        var data = snapshot.data() ?? <String, dynamic>{};
        if (!snapshot.exists) {
          data = <String, dynamic>{
            'uid': user.uid,
            'email': user.email ?? address,
            'displayName': '',
            'photoURL': '',
            'role': 'employee',
            'jobRole': '',
            'profileComplete': false,
            'created_time': FieldValue.serverTimestamp(),
          };
          await ref.set(data).timeout(const Duration(seconds: 15));
          // Re-read to resolve the server timestamp before typed deserialization.
          data = (await ref
                  .get(const GetOptions(source: Source.server))
                  .timeout(const Duration(seconds: 15)))
              .data()!;
        }
        // A job title is descriptive only. Never write the access-role,
        // companyID, workplaceConnection, uid or email when editing a profile.
        if (operation == 'photo') {
          final bytes = await photo!.readAsBytes();
          final extension = photo.name.toLowerCase().split('.').last;
          if (!['jpg', 'jpeg', 'png', 'gif', 'webp'].contains(extension)) {
            throw StateError('Unsupported photo format');
          }
          final storage = FirebaseStorage.instance.ref().child(
              'users/${user.uid}/uploads/profile_${DateTime.now().microsecondsSinceEpoch}.$extension');
          await storage
              .putData(
                  bytes,
                  SettableMetadata(
                      contentType: extension == 'jpg' || extension == 'jpeg'
                          ? 'image/jpeg'
                          : 'image/$extension'))
              .timeout(const Duration(seconds: 30));
          final url = await storage
              .getDownloadURL()
              .timeout(const Duration(seconds: 15));
          await ref.set({'photoURL': url}, SetOptions(merge: true)).timeout(
              const Duration(seconds: 15));
          data = {...data, 'photoURL': url};
          message = 'Profile photo updated.';
        }
        if (operation == 'saveSetup' || operation == 'saveProfile') {
          final changes = <String, dynamic>{
            'displayName': name,
            'jobRole': title,
            'profileComplete': true,
          };
          await ref
              .set(changes, SetOptions(merge: true))
              .timeout(const Duration(seconds: 15));
          data = {...data, ...changes};
          message = 'Profile saved.';
        }
        currentUserDocument = UsersRecord.getDocumentFromData(data, ref);
        final savedName = (data['displayName'] as String? ?? '').trim();
        final savedTitle =
            (data['jobRole'] as String? ?? data['role'] as String? ?? '')
                .trim();
        // Legacy profiles with real names and job titles remain valid. New
        // profiles have an explicit false marker and must complete setup.
        final complete = savedName.isNotEmpty &&
            savedTitle.isNotEmpty &&
            (data['profileComplete'] == true ||
                !data.containsKey('profileComplete'));
        if (complete && !data.containsKey('profileComplete')) {
          await ref.set({'profileComplete': true, 'jobRole': savedTitle},
              SetOptions(merge: true)).timeout(const Duration(seconds: 15));
          data = {...data, 'profileComplete': true, 'jobRole': savedTitle};
          currentUserDocument = UsersRecord.getDocumentFromData(data, ref);
        }
        if (operation == 'saveSetup') {
          destination = 'HomePage';
        } else if (operation == 'signup' || operation == 'login') {
          destination = complete ? 'HomePage' : 'ProfileSetup';
        } else if (operation == 'home' || operation == 'profile') {
          if (!complete) destination = 'ProfileSetup';
        }
      }
    }
  } on FirebaseAuthException catch (e) {
    message = switch (e.code) {
      'email-already-in-use' =>
        'An account already uses this email. Log in or reset your password.',
      'invalid-email' => 'Please enter a valid email address.',
      'weak-password' =>
        'Use a stronger password with at least 8 characters and a number.',
      'invalid-credential' ||
      'wrong-password' ||
      'user-not-found' ||
      'INVALID_LOGIN_CREDENTIALS' =>
        operation == 'reset'
            ? 'If an account exists for that email, a password reset link has been sent.'
            : 'The email or password is incorrect.',
      'user-disabled' =>
        'This account has been disabled. Contact your administrator.',
      'too-many-requests' => 'Too many attempts. Please wait and try again.',
      'network-request-failed' =>
        'Check your internet connection and try again.',
      'operation-not-allowed' =>
        'Email/password sign-in is not enabled. Contact your administrator.',
      _ => 'Authentication could not be completed. Please try again.',
    };
  } on TimeoutException {
    message =
        'The server did not confirm the request. Check your connection and try again. '
        'If you just registered, use Log In to continue with the same account.';
  } on FirebaseException catch (e) {
    message = e.code == 'permission-denied'
        ? 'Your profile could not be accessed. Check Firestore permissions and try again.'
        : 'Your profile could not be loaded or saved. Check your connection and try again.';
  } catch (_) {
    message = 'Something went wrong. Please try again.';
  } finally {
    if (progress.isActive) navigator.removeRoute(progress);
    _shiftCoverBusy = false;
    AppStateNotifier.instance.updateNotifyOnAuthChange(true);
  }
  if (!context.mounted) return;
  if (destination != null) {
    GoRouter.of(context).clearRedirectLocation();
    context.goNamed(destination!);
  }
  if (message != null) notify(message!);
}
