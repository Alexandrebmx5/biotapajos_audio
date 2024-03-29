import 'package:biotapajos_audio/models/page/page_manager.dart';
import 'package:biotapajos_audio/screens/especie/group_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          GroupScreen(),
        ],
      ),
    );
  }
}