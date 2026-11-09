# Metrics

## ShiftCover's HEART Framework Link

[HEART Framework](https://docs.google.com/presentation/d/14IjMt2WgoP-ft09WT0uNze7tItp1O0Umyrae79a5vgI/edit?slide=id.gc8216bd24_20_0#slide=id.gc8216bd24_20_0)

## Data Collection Methodology

- *Adoption (New User Signups per Week)*: Use Firebase Authentication to track the creation of new ShiftCover accounts. Firebase automatically records when each account is created, allowing us to count the number of new registered users each week. FlutterFlow can also log the sign_up event through Firebase Analytics.
- *Daily Active Users (DAU)*: Enable Google Analytics in FlutterFlow and use the Firebase Analytics dashboard to track the number of unique users who actively use ShiftCover each day. Firebase automatically collects events such as session_start and user_engagement, allowing us to measure daily activity without implementing additional tracking.
- *NPS (Net Promoter Score):* Signed-in users can select **Rate ShiftCover** on the Profile screen to open a one-question 0–10 recommendation survey. Submitting a score creates or updates that user's latest response in Firestore at `nps_responses/{uid}` with `user_id`, `score`, `role`, and `timestamp`. After a successful save, the app logs the `nps_submitted` Firebase Analytics event with the score. The survey is user-initiated, with no automatic Golden Path trigger or 30-day cooldown. NPS = % of promoters (9–10) minus % of detractors (0–6), calculated from each user's latest saved response.
- *Retention*: Use the Firebase Analytics retention report to measure how many users return within the first seven days after initially opening ShiftCover. Firebase's automatically collected first_open and engagement events support this measurement.
- *Request Coverage CTR*: Measure clicks on **Post Shift Request** inside `RequestCoverage` → `CoverageRequestForm`. The button logs `coverage_requested` with `screen_name = RequestCoverage` and `button_name = post_shift_request`; the page logs `screen_view` with `screen_name = RequestCoverage`. CTR (%) = 100 × filtered button-click event count / filtered page-view event count, using the same dates and platform/app stream. Clicks include attempts that fail form validation; this measures button engagement, not successfully created requests. Exclude MyShifts navigation and the Request Coverage page close-icon event. If there are zero page views, CTR is undefined.
- *Coverage Requests Created per Week*: Count new coverage request documents created in Cloud Firestore each week using their creation timestamps. This uses data already necessary for ShiftCover's Golden Path.
