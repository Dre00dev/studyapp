// authentication stream
//all logic
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthService {
//we are using this stream to listen to any changes to the user
  final userStream = FirebaseAuth.instance.authStateChanges();  //sets userStream to a stream of the current user --stream
  final user = FirebaseAuth.instance.currentUser;  //if you want to check the user's state once this it -- future

/// ---------Anonymous Firebase login----------
  Future<void> anonLogin() async {  //all need to be async so u dont need to worry about it.  
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } 
    on FirebaseAuthException {
      // handle error one day
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
/// ------Google Firebase Login----------      //johanes mike + etechviral source tutorial
  Future<void>googleLogin() async {
    try {
      final googleUser = await GoogleSignIn().signIn();   //google user just refers to sign in window will get user account

      if(googleUser == null) {
        return;  //if no user gets logged in then return.
      }
      final googleAuth = await googleUser.authentication;  //use for credential
      final authCredential = GoogleAuthProvider.credential(  //credential is created with access and Id token
        accessToken: googleAuth.accessToken,  //takes 
        idToken: googleAuth.idToken,
      );
    await FirebaseAuth.instance.signInWithCredential(authCredential);//passes access and id token to signinwith credentials method
    }
    on FirebaseAuthException {
      //handle error someday but not today....
    }
  }
  //this might be an L....
  //doesn't work as expected will try 
  getProfileImage() {
    var user = AuthService().user;
    if(user != null){
      return NetworkImage(user.photoURL!);
    }
    else{
      return Icon(Icons.abc, size: 100,);
    }
  }


/// --------------------Apple Firebase Login-----------------
/// this is currently an L.  
/// It requires the apple developer account which is 100 bucks so that shit is tough.
/// Planning on implementing this once the app is near completion.  

}



