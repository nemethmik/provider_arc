import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc/core/models/user.dart';
import 'package:provider_arc/core/services/authentication_service.dart';
import 'package:provider_arc/core/viewmodels/ilogin.dart';
import 'package:provider_arc/ui/shared/app_colors.dart';
import 'package:provider_arc/ui/shared/text_styles.dart';
import 'package:provider_arc/ui/widgets/postinglist.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Demo Home'),
      ),
      backgroundColor: backgroundColor,
      body: Column(children: <Widget>[
        Text("Welcome ${Provider.of<ILogin>(context).user.name}",style: headerStyle,),
        //Text("Welcome ${Provider.of<User>(context).name}",style: headerStyle,),
        Expanded(child: PostingList(),),
        // This doesn't want to work
        // StreamProvider<User>(
        //   builder: (context)=> Provider.of<AuthenticationService>(context).user,
        //   child: Consumer<User>(
        //     builder: (context,user,child) => Text("Welcome ${user?.name}"),
        //   ),
        // ),
      ])
    );
  }
}
