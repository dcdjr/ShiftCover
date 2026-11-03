# Metrics

## ShiftCover's HEART Framework Link

[HEART Framework](https://docs.google.com/presentation/d/14IjMt2WgoP-ft09WT0uNze7tItp1O0Umyrae79a5vgI/edit?slide=id.gc8216bd24_20_0#slide=id.gc8216bd24_20_0)

## Data Collection Methodology

- *Adoption (New User Signups per Week)*: Use Firebase Authentication to track the creation of new ShiftCover accounts. Firebase automatically records when each account is created, allowing us to count the number of new registered users each week. FlutterFlow can also log the sign_up event through Firebase Analytics.
- *Daily Active Users (DAU)*: Enable Google Analytics in FlutterFlow and use the Firebase Analytics dashboard to track the number of unique users who actively use ShiftCover each day. Firebase automatically collects events such as session_start and user_engagement, allowing us to measure daily activity without implementing additional tracking.
- *NPS (Net Promoter Score):* Signed-in users can select **Rate ShiftCover** on the Profile screen to open a one-question 0–10 recommendation survey. Submitting a score creates or updates that user's latest response in Firestore at `nps_responses/{uid}` with `user_id`, `score`, `role`, and `timestamp`. After a successful save, the app logs the `nps_submitted` Firebase Analytics event with the score. The survey is user-initiated, with no automatic Golden Path trigger or 30-day cooldown. NPS = % of promoters (9–10) minus % of detractors (0–6), calculated from each user's latest saved response.
- *Retention*: Use the Firebase Analytics retention report to measure how many users return within the first seven days after initially opening ShiftCover. Firebase's automatically collected first_open and engagement events support this measurement.
- *Request Coverage CTR*: On the MyShifts screen, FlutterFlow logs `screen_view` with `screen_name = MyShifts`. When a user selects **Request** from MyShifts, the app logs `request_coverage_clicked` with `entry_screen = MyShifts`. Calculate CTR as 100 × the number of these filtered clicks divided by MyShifts screen views over the same reporting period. Exclude any other uses of the click event, such as form-submission interactions, from this entry CTR.
- *Coverage Requests Created per Week*: Count new coverage request documents created in Cloud Firestore each week using their creation timestamps. This uses data already necessary for ShiftCover's Golden Path.
