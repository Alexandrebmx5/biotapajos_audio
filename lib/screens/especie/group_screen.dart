import 'package:biotapajos_audio/common/color.dart';
import 'package:biotapajos_audio/common/drawer/drawer_list.dart';
import 'package:biotapajos_audio/models/especie/especie_manager.dart';
import 'package:biotapajos_audio/screens/especie/components/category_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupScreen extends StatefulWidget {
  @override
  _GroupScreenState createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: PageSection(),
      appBar: AppBar(
        backgroundColor: PRIMARY,
        title: Text('Grupos de espécies', style: TextStyle(fontSize: 16)),
        centerTitle: true,
      ),
      body: Consumer<EspecieManager>(
          builder: (_, especieManager, __) {
        final especies = especieManager.allEspecies;
        if (especies.isEmpty)
          return Center(
              child: Text(
                'Nenhuma grupo de espécie encontrada!',
                style: TextStyle(color: Colors.black),
              ));
        return ListView.builder(
            itemCount: especies.length,
            itemBuilder: (_, index) {
              return CategoryTile(especies[index]);
            });
      }),
    );
  }
}
