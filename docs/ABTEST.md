# A/B Tests

### A/B Test 1: Request Coverage Button Wording

**User Story Number:** US4 - Golden Path: Shift Coverage

**Metrics:** Request Coverage Click-Through Rate (CTR), Number of Coverage Requests Created per Week

**Hypothesis:**

Employees may be less likely to select the "Request Coverage" button because its wording does not clearly communicate what the action accomplishes. We hypothesize that changing the button text to "Find Coverage" will increase the percentage of employees who select the button and submit coverage requests.

**Experiment:**

Using Firebase A/B Testing and Remote Config, we will randomly divide eligible users into two equal groups. Group A will see the original "Request Coverage" button, while Group B will see "Find Coverage."

Firebase Analytics will track views of the shift details screen using the `screen_view` event and clicks on the button using a custom `request_coverage_clicked` event. We will compare the CTR and number of successfully created coverage requests between the two groups to determine which wording performs better.

**Variations:**

- **Variation A (Control):** The button displays "Request Coverage."
- **Variation B (Test):** The button displays "Find Coverage."

Both variations will use the same button size, color, and placement. Only the text will change.

**Mockup:**

```text
Variation A             Variation B

┌──────────────────┐    ┌──────────────────┐
│ Request Coverage │    │  Find Coverage   │
└──────────────────┘    └──────────────────┘
```

We expect Variation B to produce a higher CTR because it communicates the user's goal more directly.
