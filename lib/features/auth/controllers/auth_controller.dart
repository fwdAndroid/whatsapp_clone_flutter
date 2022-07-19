import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone_flutter/features/auth/respository/auth_respository.dart';

final AuthControllerProvider = Provider(((ref) {
  final authRespository = ref.watch(AuthRespositoryProvider);
  return AuthController(authRespository: authRespository,ref: ref); 
}));

class AuthController{
  final AuthRespository authRespository;
    final ProviderRef ref;

  AuthController({
    required this.ref,
    required this.authRespository
  });

  void signInWithPhone(BuildContext context,String phoneNumber){
    authRespository.signInPhoneNumber(phoneNumber, context);
  }

  void verifyOTP(BuildContext context, String verificationId, String userOTP) {
    authRespository.verifyOTP(
      context: context,
      verificationId: verificationId,
      userOTP: userOTP,
    );
  }

  void saveUserDataToFirebase(
      BuildContext context, String name, File? profilePic) {
    authRespository.saveUserDataToFirebase(
      name: name,
      profilePic: profilePic,
      ref: ref,
      context: context,
    );
  }
}