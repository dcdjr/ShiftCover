import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import '/flutter_flow/ff_builtin_enums.dart';
import '/auth/firebase_auth/auth_util.dart';

String? signupError(
  String? email,
  String? password,
  String? confirmPassword,
) {
  final e = (email ?? '').trim();
  final p = password ?? '';
  final c = confirmPassword ?? '';
  if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(e)) {
    return 'Please enter a valid email address';
  }
  if (p.length < 8) return 'Password must be at least 8 characters';
  if (!RegExp(r'[0-9]').hasMatch(p)) return 'Password must include a number';
  if (p != c) return 'Passwords do not match';
  return null;
}
