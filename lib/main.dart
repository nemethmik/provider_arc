import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc/ui/router.dart';
import 'core/constants/app_contstants.dart';
import 'core/viewmodels/providers.dart' as vm;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: vm.providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutePaths.Login,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
