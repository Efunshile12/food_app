import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

// a simple sialog to be visible everytime some error occurs
showErrDialog(BuildContext context, String err) {
  // to hide the keyboard, if it is still p
  FocusScope.of(context).requestFocus(FocusNode());
  return showDialog(
    builder: (context) => AlertDialog(
      title: const Text("Error"),
      content: Text(err),
      actions: <Widget>[
        OutlineButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Ok"),
        ),
      ],
    ),
    context: context,
  );
}

// many unhandled google error exist
// will push them soon

Future<User?> signInWithGoogle({required BuildContext context}) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  if (kIsWeb) {
    GoogleAuthProvider authProvider = GoogleAuthProvider();

    try {
      final UserCredential userCredential =
          await auth.signInWithPopup(authProvider);
      user = userCredential.user;
    } catch (e) {
      print(e);
    }
  } else {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-credential') {}
      } catch (e) {
//..
      }
    }
  }
  return user;
}

Future<void> signOutFromGoogle() async {
  await _googleSignIn.signOut();
  await _auth.signOut();
}

class AuthMethods {
  // Firebase auth, will use to get user info and registration and signing
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Firebase Database, will use to get reference.
  static final FirebaseDatabase _database = FirebaseDatabase.instance;
  static final DatabaseReference _userReference =
      _database.reference().child("Users");

  // current user getter
  Future<User> getCurrentUser() async {
    User currentUser;
    currentUser = await _auth.currentUser!;
    return currentUser;
  }

  // gets auth state of user through out the life cycle of the app
  // Stream<User> get onAuthStateChanged {
  //   return _auth.onAuthStateChanged;
  // }

  //sign in current user with email and password

  Future<User> handleSignInEmail(String email, String password) async {
    final User user = (await _auth.signInWithEmailAndPassword(
        email: email, password: password)) as User;

    assert(user != null);
    assert(await user.getIdToken() != null);
    final User currentUser = await _auth.currentUser!;
    assert(user.uid == currentUser.uid);

    print('signInEmail succeeded: $user');

    return user;
  }

  // register new user with phone email password details
  // Future<User> handleSignUp(phone, email, password) async {
  //   final User user = (await _auth.createUserWithEmailAndPassword(
  //       email: email, password: password)) as User;
  //   assert(user != null);
  //   assert(await user.getIdToken() != null);
  //   await addDataToDb(user, email, phone, password);
  //   return user;
  // }

  // after sign up, add user data to firebase realtime database
  // Future<void> addDataToDb(
  //     User currentUser, String username, String phone, String password) async {
  //   User user = User(
  //       uid: currentUser.uid,
  //       email: currentUser.email,
  //       phone: phone,
  //       password: password);

  //   _userReference.child(currentUser.uid).set(user.toMap(user));
  // }

  // Logs out current user from the application
  Future<void> logout() async {
    await _auth.signOut();
  }
}
