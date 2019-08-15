import 'package:flutter/foundation.dart';
import 'package:provider_arc/core/models/user.dart';
import 'package:provider_arc/core/viewmodels/ibase.dart';
/// The VM interfaces have to extend ChangeNotifier, since they are required
/// for ChangeNotifier Providers. 
abstract class ILogin extends ChangeNotifier with IBase{
  User user;
  Future<User> loginAsync(String userId);
}