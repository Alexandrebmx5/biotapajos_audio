import 'package:biotapajos_audio/common/color.dart';
import 'package:biotapajos_audio/models/page/page_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerTile extends StatelessWidget {

  const DrawerTile({this.iconData, this.title, this.page});

  final IconData iconData;
  final String title;
  final int page;

  @override
  Widget build(BuildContext context) {
    final int curPage = context.watch<PageManager>().page;
    final Color primaryColor = Theme.of(context).primaryColor;
    return InkWell(
      onTap: (){
        context.read<PageManager>().setPage(page);
      },
      child: SizedBox(
        height: 55,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Icon(
                iconData,
                size: 25,
                color: curPage == page ? PRIMARY : Colors.grey[700],
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: curPage == page ? PRIMARY : Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}