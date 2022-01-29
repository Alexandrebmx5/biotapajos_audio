import 'package:biotapajos_audio/common/color.dart';
import 'package:biotapajos_audio/models/especie/especie.dart';
import 'package:biotapajos_audio/models/especie/subespecie.dart';
import 'package:biotapajos_audio/screens/especie/components/edit_sound_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SubEspecieScreen extends StatefulWidget {

  SubEspecieScreen(this.especie);

  final Especie especie;

  @override
  _SubEspecieScreenState createState() => _SubEspecieScreenState();
}

class _SubEspecieScreenState extends State<SubEspecieScreen> {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  List<SubEspecie> subEspecies = [];
  Stream _stream = null;

  Stream _getEspecie({String id}) {
    Stream result = _db
        .collection('species')
        .doc(widget.especie.id)
        .collection('subspecies')
        .snapshots();
    return result;
  }

  @override
  void initState() {
    super.initState();
    _stream = _getEspecie(id: widget.especie.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('${widget.especie.pt}', style: TextStyle(fontSize: 16)),
        centerTitle: true,
        backgroundColor: PRIMARY,
      ),
      body: body(id: widget.especie.id));
  }

  Widget body({@required String id}) {
    print(id);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
            height: MediaQuery.of(context).size.height,
            child: StreamBuilder(
                stream: _stream,
                builder: (context, snapshot) {
                  if (ConnectionState.waiting == snapshot.connectionState) {
                    return SizedBox();
                  } else {
                    List<QueryDocumentSnapshot> docs = [];
                    docs.clear();
                    subEspecies.clear();
                    docs = snapshot.data.docs;
                    docs.forEach((element) {
                      subEspecies = docs
                          .map((e) => SubEspecie.fromDocument(e))
                          .toList();

                    });
                    if (subEspecies.isEmpty) {
                      return Center(
                        child: Text(
                          'nenhuma espécie encontrada!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.blue
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                          shrinkWrap: false,
                          physics: ScrollPhysics(),
                          itemCount: subEspecies.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                              child: Card(
                                color: Colors.white,
                                elevation: 8,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(10),
                                          width: 50,
                                          child: subEspecies[index].img.isNotEmpty ? CachedNetworkImage(
                                            imageUrl: subEspecies[index].img.first,
                                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                CircularProgressIndicator(value: downloadProgress.progress),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                          ) : Image.asset('assets/images/logo.png'),
                                        ),
                                        Expanded(
                                          child: Text(
                                            subEspecies[index].specie,
                                            style: TextStyle(color: Colors.grey[850], fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: 120,
                                          child: ElevatedButton(
                                            onPressed: (){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>EditSoundScreen(widget.especie, subEspecies[index])));
                                            },
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.blue
                                            ),
                                            child: Text('Editar'),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  }
                }));
      },
    );
  }
}
