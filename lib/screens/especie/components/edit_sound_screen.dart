import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:biotapajos_audio/common/color.dart';
import 'package:biotapajos_audio/models/especie/especie.dart';
import 'package:biotapajos_audio/models/especie/subespecie.dart';
import 'package:biotapajos_audio/store/edit_audio_store.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class EditSoundScreen extends StatefulWidget {

  EditSoundScreen(this.especie, this.subEspecie);

  final Especie especie;
  final SubEspecie subEspecie;

  @override
  _EditSoundScreenState createState() => _EditSoundScreenState(this.subEspecie);
}

class _EditSoundScreenState extends State<EditSoundScreen> {

  _EditSoundScreenState(SubEspecie subEspecie)
      : editing = subEspecie != null,
        store = EditAudioStore(subEspecie: subEspecie);

  final EditAudioStore store;

  bool editing;
  String _absolutePathOfAudio;
  String _nameAudio;
  AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    if(store.sound != ''){
      File file = File(store.sound);
      _absolutePathOfAudio = file.path;
      _nameAudio = widget.subEspecie.specie;
    }
    when((_) => store.saveSub, () {
      if (editing) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'Salvo com sucesso!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: PRIMARY,
        ));
      }
    });
  }

  void openAudioPicker() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    var path = result.files.single.path;
    var nameAudio = result.files.single.name;
    setState(() {
      _absolutePathOfAudio = path;
      _nameAudio = nameAudio;
    });
    store.setSound(_absolutePathOfAudio);
    store.setSoundName(_nameAudio);
  }

  void playMusic() async {
    await audioPlayer.play(_absolutePathOfAudio, isLocal: true);
  }

  void stopMusic() async {
    await audioPlayer.stop();
  }

  void resumeMusic() async {
    await audioPlayer.resume();
  }

  @override
  Widget build(BuildContext context) {

    store.setGroupId(widget.especie.id);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY,
        title: Text(widget.subEspecie.specie, style: TextStyle(fontSize: 16)),
        centerTitle: true,
        actions: [
          Observer(builder: (_){
            return TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white
              ),
              onPressed: store.sendPressed,
              child: Text('Salvar')
            );
          })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: _absolutePathOfAudio == null ? PRIMARY : Colors.red
                  ),
                  child: Text(
                    _absolutePathOfAudio == null ? "Selecionar audio" : "Remover audio",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if(_absolutePathOfAudio == null){
                      openAudioPicker();
                    } else {
                      setState(() {
                        _absolutePathOfAudio = null;
                        _nameAudio = null;
                      });
                      store.setSound('');
                      store.setSoundName(_nameAudio);
                    }
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: _absolutePathOfAudio));},
                child: _nameAudio == null
                    ? Container()
                    : Text(_nameAudio, textAlign: TextAlign.center),
              ),
            ),
            if(_absolutePathOfAudio != null)...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _absolutePathOfAudio == null
                      ? Container()
                      : ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                    child: Text(
                      "Play",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: playMusic,
                  ),
                  _absolutePathOfAudio == null
                      ? Container()
                      : ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    child: Text(
                      "Stop",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: stopMusic,
                  )
                ],
              )
            ],
          ],
        ),
      ),
    );
  }
}
