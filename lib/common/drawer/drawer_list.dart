import 'package:biotapajos_audio/common/drawer/drawer_header.dart';
import 'package:biotapajos_audio/common/drawer/drawer_tile.dart';
import 'package:biotapajos_audio/store/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../main.dart';

class PageSection extends StatelessWidget {
  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(50)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Drawer(
          child: ListView(children: [
            CustomHeaderDrawer(),
            DrawerTile(title: 'Catálago de Espécies', iconData: Icons.list, page: 0),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                userManagerStore.logout();
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => MyApp()),
                        (Route<dynamic> route) => false);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Row(
                  children: [
                    Icon(
                      Icons.exit_to_app,
                      size: 25,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Sair',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'v. 1.0.0',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Pricipal',
                          fontSize: 16),
                    )
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}