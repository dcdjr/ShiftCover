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

### A/B Test 2: Sign Up Button Wording

**A/B Test Name:** Create Account vs. Sign Up Button Wording

**User Story Number:** US1 - Account Creation

**Metrics:** Adoption (New User Signups per Week)

**Hypothesis:**

New users may be less likely to complete registration if the signup button does not clearly communicate its purpose. We hypothesize that using the more familiar wording "Sign Up" instead of "Create Account" will encourage more users to register for ShiftCover.

**Experiment:**

Using Firebase A/B Testing and Remote Config, we will randomly divide new users into two equal groups. Group A will see a button labeled "Create Account," while Group B will see "Sign Up."
Firebase Analytics will track registration page views using the screen_view event and successful account creation using the sign_up event. We will compare the number of successful registrations and registration completion rates between the two groups.

**Variations:**

- **Variation A (Control):** The registration button displays "Create Account."
- **Variation B (Test):** The registration button displays "Sign Up."
Both variations will use the same button size, color, placement, and registration functionality. Only the button text will change.

**Mockup:**

```text
Variation A             Variation B

┌──────────────────┐    ┌──────────────────┐
│  Create Account  │    │      Sign Up     │
└──────────────────┘    └──────────────────┘
```

We expect Variation B to increase adoption because the wording is shorter and more familiar to users.

A/B Test 3: Password Requirements Hint

A/B Test Name: Displaying Password Requirements During Registration

User Story Number: US1 - Account Creation

Metrics: Adoption (New User Signups per Week)

Hypothesis:
Users may encounter errors during registration because they are unaware of password requirements until they attempt to create an account. We hypothesize that displaying password requirements directly below the password field will reduce confusion and increase successful registrations.

Experiment:
Using Firebase A/B Testing and Remote Config, we will randomly divide new users into two equal groups. Group A will see the registration form without an upfront password requirements hint, while Group B will see a short message below the password field explaining the minimum password length.
Firebase Analytics will track registration page views using screen_view and successful registrations using sign_up. We will compare registration completion rates between the two groups to determine whether displaying password requirements improves adoption.

Variations:

Variation A (Control): The password field does not display password requirements beforehand.

Variation B (Test): The password field displays "Password must be at least 8 characters" directly underneath it.

Both variations will enforce the same password requirements. Only the visibility of the password hint will change.

Mockup:

Variation A:

Password: [ ******** ]

Variation B:

Password: [ ******** ]

Password must be at least 8 characters.

We expect Variation B to improve adoption by helping users avoid registration errors.



### A/B Test 4: Request Coverage Button Style

**A/B Test Name:** Filled vs. Outlined Request Coverage Button

**User Story Number:** US4 - Golden Path: Shift Coverage

**Metrics:** Request Coverage Click-Through Rate (CTR), Number of Coverage Requests Created per Week

**Hypothesis:**

Employees may overlook the Request Coverage button if it does not stand out from the other elements on the shift details screen. We hypothesize that using a filled button instead of an outlined button will make the action more noticeable and increase the number of employees who request shift coverage.

**Experiment:**

Using Firebase A/B Testing and Remote Config, we will randomly divide eligible users into two equal groups. Group A will see an outlined Request Coverage button, while Group B will see a filled version of the same button.

Firebase Analytics will track visits to the shift details screen using screen_view and button clicks using the custom request_coverage_clicked event. We will also count successfully created coverage requests in Firestore.

We will compare CTR and the number of coverage requests between the two groups to determine which button style is more effective.

**Variations:**

- **Variation A (Control):** An outlined Request Coverage button with a transparent background.
- **Variation B (Test):** A filled Request Coverage button using the application's primary color.

Both variations will use identical text, size, placement, and functionality. Only the button's visual style will change.

**Mockup:**

```text
Variation A             Variation B

┌──────────────────┐    ████████████████████    
│ Request Coverage │    █ Request Coverage █
└──────────────────┘    ████████████████████
```

We expect Variation B to produce a higher CTR because the filled button is more visually prominent.
