# Metrics

## ShiftCover's HEART Framework Link

[HEART Framework](https://docs.google.com/presentation/d/14IjMt2WgoP-ft09WT0uNze7tItp1O0Umyrae79a5vgI/edit?slide=id.gc8216bd24_20_0#slide=id.gc8216bd24_20_0)

## Data Collection Methodology

- *Adoption (New User Signups per Week)*: Use Firebase Authentication to track the creation of new ShiftCover accounts. Firebase automatically records when each account is created, allowing us to count the number of new registered users each week. FlutterFlow can also log the sign_up event through Firebase Analytics.
<!-- Kevin's bullet goes here -->
<!-- Mark's bullet goes here -->
- *NPS (Net Promoter Score):* After a user completes the Golden Path (their shift is claimed and approved, or they pick up a shift), show a one-question survey in a FlutterFlow bottom sheet: "How likely are you to recommend ShiftCover to a coworker? (0-10)." Save the answer to the Firestore nps_responses collection with user_id, score, role, and timestamp, and log a Firebase Analytics custom event nps_submitted with the score as a parameter. Each user is asked at most once every 30 days. NPS = % of promoters (9-10) minus % of detractors (0-6).
- *Retention*: Use the Firebase Analytics retention report to measure how many users return within the first seven days after initially opening ShiftCover. Firebase's automatically collected first_open and engagement events support this measurement.
- *Request Coverage CTR*: Use FlutterFlow's automatically logged screen_view event for the shift details page and add one custom Firebase Analytics event, request_coverage_clicked, to the Request Coverage button. Calculate CTR by dividing button clicks by qualifying shift details page views, multiplied by 100.
- *Coverage Requests Created per Week*: Count new coverage request documents created in Cloud Firestore each week using their creation timestamps. This uses data already necessary for ShiftCover's Golden Path.
