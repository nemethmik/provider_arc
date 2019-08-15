import 'package:flutter/foundation.dart';
import 'package:provider_arc/core/models/user.dart';
import 'package:provider_arc/core/services/authentication_service.dart';
import 'package:provider_arc/core/viewmodels/base_vm.dart';
import 'ilogin.dart';

class LoginVM extends ChangeNotifier with BaseVM implements ILogin{
  final AuthenticationService authenticationService;
  LoginVM({@required this.authenticationService});
  @override User user;
  @override Future<User> loginAsync(String userId) async {
    try{
      startWaiting();
      user = await authenticationService.login(int.parse(userId));
      return user;
    } finally {stopWaiting();}    
  }
}