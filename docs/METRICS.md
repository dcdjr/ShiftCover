# Metrics

## ShiftCover's HEART Framework Link

[HEART Framework](https://docs.google.com/presentation/d/14IjMt2WgoP-ft09WT0uNze7tItp1O0Umyrae79a5vgI/edit?slide=id.gc8216bd24_20_0#slide=id.gc8216bd24_20_0)

## Data Collection Methodology

<!-- Teagan's bullet goes here -->
<!-- Kevin's bullet goes here -->
<!-- Mark's bullet goes here -->
- *Retention*: Use the Firebase Analytics retention report to measure how many users return within the first seven days after initially opening ShiftCover. Firebase's automatically collected first_open and engagement events support this measurement.
- *Request Coverage CTR*: Use FlutterFlow's automatically logged screen_view event for the shift details page and add one custom Firebase Analytics event, request_coverage_clicked, to the Request Coverage button. Calculate CTR by dividing button clicks by qualifying shift details page views, multiplied by 100.
- *Coverage Requests Created per Week*: Count new coverage request documents created in Cloud Firestore each week using their creation timestamps. This uses data already necessary for ShiftCover's Golden Path.
