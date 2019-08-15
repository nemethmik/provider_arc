import 'dart:async';
import 'package:meta/meta.dart';
import 'package:provider_arc/core/models/user.dart';
import 'package:provider_arc/core/services/api.dart';

class AuthenticationService {
  final Api _api;

  AuthenticationService({@required  Api api}) : _api = api;

  StreamController<User> _userController = StreamController<User>.broadcast();

  Stream<User> get user => _userController.stream;

  Future<User> login(int userId) async {
    var fetchedUser = await _api.getUserProfile(userId);
    //The Api returns an non-null, but empty(all-fields-null) object when the id is bigger than 10.
    var hasUser = fetchedUser?.id != null;
    if (hasUser) {
      _userController.add(fetchedUser);
    }
    return fetchedUser;
  }
}
