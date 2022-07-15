import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:whatsapp_clone_flutter/common/utils/utils.dart';
import 'package:whatsapp_clone_flutter/features/auth/screens/otp_screen.dart';

class AuthRespository{
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  AuthRespository({required this.firebaseAuth,required this.firebaseFirestore});

  //SignInPhone Number  Fucntion
  void signInPhoneNumber(String phoneNumber,BuildContext context) async{
    try{
      await firebaseAuth.verifyPhoneNumber(phoneNumber: phoneNumber, verificationCompleted: (PhoneAuthCredential credential) async{
         await firebaseAuth.signInWithCredential(credential);
      }, verificationFailed: (e){
        throw Exception(e.message);
      }, codeSent: ((String verificationId, int? resendToken )async{
        Navigator.pushNamed(context, OTPScreen.routeName,arguments: verificationId );
      }), codeAutoRetrievalTimeout: (String verificationId) async{

      });
    } on FirebaseAuthException catch(e) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}