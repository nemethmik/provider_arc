# provider_arc

A Flutter project for experimenting with Provider 3.0 ProxyProvider.
The project is based on 
[FilledStacks youtube video](https://www.youtube.com/watch?v=VgrK_LlQRJ4&t=1s) 
and [initial project](https://github.com/FilledStacks/flutter-tutorials/tree/master/014-provider-v3-updates)

The [provider package](https://pub.dev/packages/provider) is the only officially documented state-management approach [data-and-backend/state-mgmt/simple](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple) on Flutter Dev.
Provider is maintained by the Flutter team, while no BloC implementation is available from Google. Provider is a bit simpler, but BloC has a big advantage, it is based on a generic infrastructure: streams. Most BloC users however use rxdart, too.
The guy, [Dane Mackier](https://medium.com/flutter-community/flutter-provider-sharing-data-between-multiple-models-using-services-29d279578c55) behind FilledStacks, however, prefers provider vs bloc,and he doesn't like ProxyProvider's at all vs get_it.

The Api uses https://jsonplaceholder.typicode.com/users/1 to get a user profile.
 
# Comments to the Video
Dane Mackier at 7:11 is not using interfaces at all, the correct way would be something like
```dart
ProxyProvider<IApi,IAuthenticationService>(
    builder: (context,api,auth) => AuthenticationService(api:api),
)
``` 
where the AuthenticationService is only one implementation of the number of possible ones. Dane is not using abstraction at all, he just uses concrete classes, dependency injection is pretty meaningless without interface declarations.

This is not Dane's fault at 10:24, unless he doesn't use the pattern correctly, that when building a UI component, the instantiation of a View Model class has to be included.
He should have used the ChangeNotifierProxyProvider at 10:02 rather than the clumsy way he provided the Login VM object, like so
```dart
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider<AuthenticationService,LoginVM>(
        builder: (context,authenticatioService,vm) => LoginVM(authenticationService: authenticatioService),
        child: Consumer<LoginVM>(
            ...
        ),
    );
  }

```
What is not really nice here is that, the UI is interested in the LoginVM, or actually an object providing the interface ILogin, the UI is not interested in the implementation details of LoginVM. If you create complex multi-dependent objects in the UI, you have to import all packages either, which definitely clutter and mess the UI files.
```dart
import 'package:provider_arc/core/services/authentication_service.dart';
```
So far the mistakes Dane made:
- Not using interfaces, 
- Not using ChangeNotifierProxyProvider,
- Cluttering UI files with implementation details of a VM class 

