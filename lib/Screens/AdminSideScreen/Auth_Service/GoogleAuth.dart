import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    try {
      // Start the Google Sign-In process
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      // If the Google Sign-In process is successful, authenticate with Firebase
      if (googleSignInAccount != null) {
        // Obtain the authentication credentials
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        // Create a new credential
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        // Sign in to Firebase with the credential
        final UserCredential userCredential = await _auth.signInWithCredential(credential);

        // Return the authenticated user
        return userCredential.user;
      } else {
        // Google Sign-In was canceled by the user
        print('Google Sign-In canceled');
        return null;
      }
    } catch (error) {
      // Handle any errors
      print('Google Sign-In error: $error');
      return null;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
