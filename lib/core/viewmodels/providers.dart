import 'package:provider/provider.dart';
import 'package:provider_arc/core/models/user.dart';
import 'package:provider_arc/core/services/api.dart';
import 'package:provider_arc/core/services/authentication_service.dart';
import 'package:provider_arc/core/viewmodels/iposts.dart';
import 'package:provider_arc/core/viewmodels/login_vm.dart';
import 'package:provider_arc/core/viewmodels/posts_vm.dart';
import 'ilogin.dart';
/// A list of SingleChildCloneableWidget is required for a MultiProvider
final providers = <SingleChildCloneableWidget>[
  Provider.value(value: Api(),),
  ProxyProvider<Api,AuthenticationService>(builder: (context,api,authenticationService)
    => AuthenticationService(api: api)),
  ChangeNotifierProxyProvider<AuthenticationService,ILogin>(
    builder: (context,authenticatioService,vm) => LoginVM(authenticationService: authenticatioService),
  ),
  // ChangeNotifierProxyProvider<Api,IPosts>(
  //   builder: (context,api,vm) => PostsVM(api: api),
  // ),
  //The listen must be set to false for the Stream Provider here, otherwise we get an exception
  //The AuthenticationService object is used by LoginVM, and when the user logged in 
  StreamProvider<User>(builder: (context) => Provider.of<AuthenticationService>(context,listen: false).user,),
];