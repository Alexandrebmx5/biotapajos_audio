import 'package:biotapajos_audio/screens/base/base_screen.dart';
import 'package:biotapajos_audio/screens/login/login_screen.dart';
import 'package:biotapajos_audio/store/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';


class InitialScreen extends StatefulWidget {

  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 4)).then((_){
      if(userManagerStore.isLoggedIn){
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>BaseScreen()));
      } else {
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(color: Colors.white),
        Center(
            child: Container(
              width: 150,
              height: 150,
              child: Hero(
                  tag: 'charizard',
                  transitionOnUserGestures: true,
                  child: Image.asset('assets/images/logo_2.png')),
            )
        ),
      ],
    );
  }
}
