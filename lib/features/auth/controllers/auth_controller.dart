import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone_flutter/features/auth/respository/auth_respository.dart';

final AuthControllerProvider = Provider(((ref) {
  final authRespository = ref.watch(AuthRespositoryProvider);
  return AuthController(authRespository: authRespository); 
}));

class AuthController{
  final AuthRespository authRespository;
  AuthController({
    required this.authRespository
  });

  void signInWithPhone(BuildContext context,String phoneNumber){
    authRespository.signInPhoneNumber(phoneNumber, context);
  }
}