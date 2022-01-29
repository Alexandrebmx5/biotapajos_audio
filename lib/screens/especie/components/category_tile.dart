import 'package:biotapajos_audio/models/especie/especie.dart';
import 'package:biotapajos_audio/screens/especie/components/subespecie_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final Especie especie;

  CategoryTile(this.especie);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Card(
        elevation: 8,
        child: ListTile(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SubEspecieScreen(especie)));
          },
          leading: CircleAvatar(
            child: CachedNetworkImage(
              imageUrl: especie.img.first,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            backgroundColor: Colors.transparent,
          ),
          title: Text(
            especie.pt,
            style: TextStyle(color: Colors.grey[850], fontWeight: FontWeight.w500),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
        ),
      ),
    );
  }
}
