# FirebaseAuthWithSwiftUI

Firebase Authentication with SwiftUI
This project demonstrates how to integrate Google Firebase Authentication and store user data in Firestore using SwiftUI. It also covers routing techniques, sharing environment variables across multiple views, and implementing the MVVM architecture for a clean, scalable codebase.

# Features
. Firebase Authentication: Securely authenticate users using Firebase.
. Firestore Integration: Store and retrieve user data seamlessly from Firestore.
. SwiftUI Routing: Navigate through views with clean, SwiftUI-friendly routing techniques.
. Environment Variables: Share environment variables across multiple views.
. MVVM Architecture: Organize code for separation of concerns and maintainability.
# Getting Started
# Prerequisites
. Xcode: Ensure you have the latest version of Xcode.
. Firebase Account: Create a Firebase project at Firebase Console.
. Swift Package Manager (SPM): Firebase dependencies are integrated via SPM.
Installation
1. Clone the Repository

git clone https://github.com/ShafiqUllah/FirebaseAuthWithSwiftUI.git
cd FirebaseAuthWithSwiftUI
2. Set Up Firebase:

. Go to the Firebase Console.
. Create a new project or use an existing one.
. Add an iOS app to the project with the iOS bundle identifier.
. Download the GoogleService-Info.plist file.
. Place GoogleService-Info.plist in the root directory of the Xcode project.
3. Install Firebase SDK:

. Open the project in Xcode.
/ Go to File > Add Packages... and add Firebase Swift packages for Authentication and Firestore:

https://github.com/firebase/firebase-ios-sdk
Run the Project: Press Cmd + R in Xcode to build and run the app on the simulator or a connected device.

# Code Structure
# MVVM Architecture
The project follows the MVVM (Model-View-ViewModel) architecture to ensure separation of concerns.

. Model: Defines the data structures and interacts with Firestore.
. View: SwiftUI views for the user interface.
. ViewModel: Manages the app's state, handles Firebase authentication, and fetches/stores data in Firestore.
 # Environment Variables
Environment variables are used to share data across views, making it easy to pass data without tight coupling.

# Usage
1. Authentication: Sign up, log in, and log out using Firebase authentication.
2. Data Persistence: Store user-related data in Firestore, which is automatically linked to their authentication ID.
3. Smooth Navigation: SwiftUI routing techniques make it easy to navigate between different screens.
4. State Management: ViewModels handle all business logic, ensuring a clear separation between UI and data.

# Acknowledgments
Big thanks to Yoges Patel for guidance on MVVM best practices.

# Contributions
Contributions are welcome! Feel free to submit a pull request to improve the project.

# License
This project is licensed under the MIT License - see the LICENSE file for details.

Contact
For questions or feedback, feel free to reach out or open an issue. Enjoy exploring Firebase with SwiftUI!
