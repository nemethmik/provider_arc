import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc/core/constants/app_contstants.dart';
//import 'package:provider_arc/core/services/authentication_service.dart';
import 'package:provider_arc/core/viewmodels/ilogin.dart';
import 'package:provider_arc/ui/shared/app_colors.dart';
import 'package:provider_arc/ui/widgets/login_header.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _userIdField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // This is the proper way
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Demo Login'),
      ),
      backgroundColor: backgroundColor,
      body: Column(
        children: <Widget>[
          LoginHeader(controller: _userIdField,),
          Consumer<ILogin>(
            builder: (context, model, child) => 
            model.isWaiting ? CircularProgressIndicator() :
            FlatButton(color: Colors.white,
              child: Text("Login User ${model?.user?.name}",style: TextStyle(color: Colors.black),),
              onPressed: () async {
                if((await model.loginAsync(_userIdField.text))?.id != null) {
                  Navigator.pushNamed(context, RoutePaths.Home);
                }
              },
            ),
          ),
        ], 
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return ChangeNotifierProxyProvider<AuthenticationService,LoginVM>(
  //       builder: (context,authenticatioService,vm) => LoginVM(authenticationService: authenticatioService),
  //       child: Consumer<LoginVM>(
  //       builder: (context, model, child) => Scaffold(
  //       backgroundColor: backgroundColor,
  //       body: Column(
  //         children: <Widget>[
  //           LoginHeader(controller: _userIdField,),
  //           model.isWaiting ? CircularProgressIndicator() :
  //           FlatButton(color: Colors.white,
  //             child: Text("Login",style: TextStyle(color: Colors.black),),
  //             onPressed: () async {
  //               if(await model.loginAsync(_userIdField.text)) {
  //                 Navigator.pushNamed(context, RoutePaths.Home);
  //               }
  //             },
  //           )
  //         ] 
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
