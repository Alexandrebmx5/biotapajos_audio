import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SubEspecie {

  String id;
  String specieSimilar;
  String specieSimilarEn;
  String color;
  String colorEn;
  String howKnow;
  String howKnowEn;
  List img = [];
  String locations;
  String locationsEn;
  String nome;
  String nomeEn;
  String reproduction;
  String reproductionEn;
  String family;
  String familyEn;
  String sound;
  String soundName;
  String groupId;
  String group;
  String groupEn;
  String specie;
  String specieEn;
  String youKnow;
  String youKnowEn;
  String activityEn;
  String activity;
  String whereLive;
  String whereLiveEn;
  String venom;
  String venomEn;
  String diet;
  String dietEn;
  String creditImage;
  String creditImageEn;

  SubEspecie(
      {this.id,
      this.specieSimilar,
      this.specieSimilarEn,
      this.color,
      this.colorEn,
      this.howKnow,
      this.howKnowEn,
      this.img,
      this.locations,
      this.locationsEn,
      this.nome,
      this.nomeEn,
      this.reproduction,
      this.reproductionEn,
      this.family,
      this.familyEn,
      this.sound,
      this.soundName,
      this.groupId,
      this.group,
      this.groupEn,
      this.specie,
      this.specieEn,
      this.youKnow,
      this.youKnowEn,
      this.activity,
      this.activityEn,
      this.whereLive,
      this.whereLiveEn});

  SubEspecie.fromDocument(DocumentSnapshot doc){
    id = doc.id;
    specieSimilar = doc.get('specie_similar');
    specieSimilarEn = doc.get('specie_similar_en');
    color = doc.get('color');
    colorEn = doc.get('color_en');
    howKnow = doc.get('howKnow');
    howKnowEn = doc.get('howKnow_en');
    img = List<String>.from(doc.get('img') as List<dynamic>);
    locations = doc.get('locations');
    locationsEn = doc.get('locations_en');
    nome = doc.get('nome');
    nomeEn = doc.get('nome_en');
    reproduction = doc.get('reproduction');
    reproductionEn = doc.get('reproduction_en');
    family = doc.get('family');
    familyEn = doc.get('family_en');
    sound = doc.get('sound');
    group = doc.get('group');
    groupEn = doc.get('group_en');
    specie = doc.get('specie');
    specieEn = doc.get('specie_en');
    youKnow = doc.get('youKnow');
    youKnowEn = doc.get('youKnow_en');
    activity = doc.get('activity');
    activityEn = doc.get('activity_en');
    whereLive = doc.get('where_live');
    whereLiveEn = doc.get('where_live_en');
    if(doc.data().containsKey('venom')){
      venom = doc.get('venom');
      venomEn = doc.get('venom_en');
    }
    if(doc.data().containsKey('diet')){
      diet = doc.get('diet');
      dietEn = doc.get('diet_en');
    }
    if(doc.data().containsKey('credit_image')){
      creditImage = doc.get('credit_image');
      creditImageEn = doc.get('credit_image_en');
    }
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final FirebaseStorage storage = FirebaseStorage.instance;

  Reference get storageRef =>
      storage.ref('gs://appbiotapajos-3d160.appspot.com/species/');

  Future<void> save(SubEspecie subEspecie) async {
    if (subEspecie.id != null) {
      String soundUrl = '';
      if (subEspecie.soundName != null) {
            File audio = File(subEspecie.sound);
            UploadTask uploadTask = FirebaseStorage.instance.ref(
                'sounds/${subEspecie.soundName}').
            putFile(audio);
            TaskSnapshot s = await uploadTask;
            String downloadUrl = await s.ref.getDownloadURL();
            soundUrl = downloadUrl;
          } else if (subEspecie.sound != '' && subEspecie.sound.contains(subEspecie.sound)) {
            soundUrl = subEspecie.sound.toString();
          } else if (subEspecie.sound == '') {
            soundUrl = '';
      }

        DocumentReference firestoreRef =
        firestore.collection('species')
            .doc(subEspecie.groupId)
            .collection('subspecies')
            .doc(subEspecie.id);

        await firestoreRef.update({'sound': soundUrl});
      }
    }

  @override
  String toString() {
    return 'SubEspecie{id: $id, specieSimilar: $specieSimilar, specieSimilarEn: $specieSimilarEn, color: $color, colorEn: $colorEn, howKnow: $howKnow, howKnowEn: $howKnowEn, img: $img, locations: $locations, locationsEn: $locationsEn, nome: $nome, nomeEn: $nomeEn, reproduction: $reproduction, reproductionEn: $reproductionEn, family: $family, familyEn: $familyEn, sound: $sound, soundName: $soundName, group: $group, groupEn: $groupEn, specie: $specie, specieEn: $specieEn, youKnow: $youKnow, youKnowEn: $youKnowEn, activityEn: $activityEn, activity: $activity, whereLive: $whereLive, whereLiveEn: $whereLiveEn}';
  }
}