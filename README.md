# InsightMed

InsightMed is a robust mobile application developed with Flutter, designed to optimize medical workflows for both patients and healthcare providers. It offers a secure and intuitive platform for managing appointments, submitting medical imaging, and maintaining comprehensive patient records.

## Key Features

*   **Authentication & Authorization:** Secure user registration, login, and password reset functionalities, ensuring data privacy and access control.
*   **Appointment Management:** A streamlined system for patients to book, view, and manage their medical appointments, and for providers to oversee their schedules.
*   **Medical Imaging Submission & Viewing:** Facilitates the secure submission of patient ray images (e.g., X-rays, scans). Upon submission, an integrated AI analyzes the image and provides a summary, confidence level, and differential diagnosis, which are then displayed for review by healthcare professionals.
*   **Patient Notes:** A comprehensive and organized system for healthcare providers to create, edit, and view patient-specific notes, ensuring continuity of care.
*   **User Profile Management:** Allows users to securely view and update their personal and medical profile information.
*   **Intuitive Onboarding Experience:** Guides new users through the application's core functionalities with an engaging and informative introduction.
*   **Centralized Dashboard:** A user-friendly home screen providing quick access to key features and an overview of relevant information.
*   **Detailed Patient Information Management:** Tools for managing and accessing comprehensive patient details.

## Getting Started

These instructions will guide you through setting up and running the InsightMed application on your local development environment.

### Prerequisites

Ensure you have the following installed on your system:

*   **Flutter SDK:** [Install Flutter](https://flutter.dev/docs/get-started/install)
*   **Android Studio or VS Code:** Recommended IDEs with the Flutter and Dart plugins installed for optimal development experience.

### Installation

1.  **Clone the repository:**

    ```bash
    git clone <repository_url>
    cd insight_med
    ```

2.  **Fetch dependencies:**

    Navigate to the project root and run:

    ```bash
    flutter pub get
    ```

3.  **Run the application:**

    Connect a physical device or start an emulator/simulator. Then, execute:

    ```bash
    flutter run
    ```

    To build a release version for a specific platform:

    *   **Android (APK):**

        ```bash
        flutter build apk --release
        ```

    *   **iOS (IPA - requires macOS and Xcode):**

        ```bash
        flutter build ipa --release
        ```

## User Guide

This section provides a brief overview of how to navigate and utilize the core features of the InsightMed application.

### 1. Onboarding
Upon first launch, you will be guided through an onboarding process. Follow the on-screen instructions to understand the app's main functionalities.

### 2. Authentication
*   **Sign Up:** If you are a new user, tap on 'Sign Up' and provide the required details to create your account.
*   **Login:** Existing users can enter their credentials on the login screen to access their dashboard.
*   **Forgot Password:** If you forget your password, use the 'Forgot Password' option to reset it via your registered email.

### 3. Dashboard / Home Screen
After logging in, you will land on the home screen, which provides quick access to:
*   **Appointments:** View upcoming and past appointments.
*   **Ray Submissions:** Access your submitted medical images.
*   **Notes:** Manage your patient notes.
*   **Profile:** Update your personal information.

### 4. Managing Appointments
Navigate to the 'Appointments' section from the dashboard. Here you can:
*   **Book New Appointment:** Select a date, time, and doctor to schedule a new appointment.
*   **View Details:** Tap on an existing appointment to see its details.
*   **Reschedule/Cancel:** Options to modify or cancel your appointments (if enabled).

### 5. Submitting Medical Images (Rays)
In the 'Ray Submissions' section:
*   **Upload New Ray:** Follow the prompts to upload new medical images from your device.
*   **View Past Submissions:** Browse through your previously submitted ray images.

### 6. Patient Notes
For healthcare providers, the 'Notes' section allows you to:
*   **Create New Note:** Add new clinical notes for a specific patient.
*   **Edit/View Notes:** Access and modify existing patient notes.

### 7. User Profile
Access your profile from the dashboard to:
*   **View Information:** See your registered personal and contact details.
*   **Update Profile:** Modify your information as needed.

### 8. Doctor Experience
InsightMed provides a tailored experience for healthcare professionals. If you are logged in as a doctor, you will notice the following differences:
*   **Adapted Navigation:** The bottom navigation bar may present different options relevant to a doctor's workflow.
*   **Patient Management:** The doctor can view a comprehensive list of all patients, access their detailed profiles, and update their status.
*   **Notes Management:** Doctor can add, edit, and view detailed notes for each patient.
*   **Ray Review:** Doctor have access to all patient ray submissions, allowing for thorough review and analysis.
*   **Appointment Overview:** Doctor can view all patient appointments, facilitating schedule management and patient care coordination.
*   **Feature Availability:** Certain features, such as the "Upload Medical Ray" floating action button on the home screen, will be hidden as they are specific to patient functionalities.

## Project Structure

```
insight_med/
├── android/             # Android specific files and configurations
├── assets/              # Application assets (images, fonts, etc.)
├── lib/                 # Main application source code
│   ├── core/            # Core functionalities, utilities, constants, services, and shared widgets
│   │   ├── constants/   # Application-wide constants and configurations
│   │   ├── entities/    # Core data entities/models
│   │   ├── enums/       # Enumerations used across the application
│   │   ├── extensions/  # Dart extension methods for enhanced functionality
│   │   ├── helpers/     # Helper functions and utility classes
│   │   ├── models/      # Data models for API interactions and local storage
│   │   ├── network/     # Network related configurations and interceptors (e.g., Dio setup)
│   │   ├── repos/       # Repository interfaces and their implementations for data abstraction
│   │   ├── services/    # Application services (e.g., API clients, database services, state management setup)
│   │   └── utls/        # General utilities, theming, and asset management
│   └── features/        # Feature-specific modules, each encapsulating its own logic, UI, and state management
│       ├── appointments/          # Appointment booking and management
│       ├── auth/                  # User authentication (login, registration, password reset)
│       ├── home/                  # Main application dashboard/home screen
│       ├── notes/                 # Patient notes creation and management
│       ├── onboarding/            # First-time user onboarding experience
│       ├── patient_details/       # Detailed patient information management
│       ├── patient_rays_submission/ # Submission and viewing of medical ray images
│       ├── pofile/                # User profile management (likely a typo for 'profile')
│       ├── rays/                  # Related to medical ray image viewing/management
│       └── reset_password/        # Password reset functionality
├── test/                
├── pubspec.yaml       
└── README.md    
```