import 'package:biotapajos_audio/common/color.dart';
import 'package:biotapajos_audio/store/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


class CustomHeaderDrawer extends StatelessWidget {

  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @override
  Widget build(BuildContext context) {
      return Container(
        color: PRIMARY,
        width: double.infinity,
        height: 100,
        padding: EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              userManagerStore.user.nameUser,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              userManagerStore.user.email,
              style: TextStyle(color: Colors.grey[200], fontSize: 14),
            )
          ],
        ),
      );
  }
}