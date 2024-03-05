import 'package:facebook_clone_flutter/config/auth/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = Provider((reft){
  return AuthService();
});

