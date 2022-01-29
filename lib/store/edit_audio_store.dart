import 'package:biotapajos_audio/common/EasyLoading.dart';
import 'package:biotapajos_audio/models/especie/subespecie.dart';
import 'package:mobx/mobx.dart';

part 'edit_audio_store.g.dart';

class EditAudioStore = _EditAudioStore with _$EditAudioStore;

abstract class _EditAudioStore with Store {

  _EditAudioStore({this.subEspecie}) {
    sound = subEspecie.sound == '' ? null : subEspecie.sound;
  }

  final SubEspecie subEspecie;

  @observable
  String groupId;

  @action
  void setGroupId(String value) => groupId = value;

  @observable
  String sound;

  @action
  void setSound(String value) => sound = value;

  @computed
  bool get soundValid => sound != null;

  @observable
  String soundName;

  @action
  void setSoundName(String value) => soundName = value;

  @computed
  bool get soundNameValid => soundName != null;

  @computed
  bool get formValid =>
          soundValid &&
          soundNameValid;
  @computed
  Function get sendPressed => formValid ? _send : null;

  @observable
  bool showErrors = false;

  @action
  void invalidSendPressed() => showErrors = true;

  @observable
  String error;

  @observable
  bool loading = false;

  @observable
  bool saveSub = false;

  @action
  Future<void> _send() async {
    loading = true;
    easyLoading();

    subEspecie.sound = sound;
    subEspecie.soundName = soundName;
    subEspecie.groupId = groupId;

    try {
      await SubEspecie().save(subEspecie);
      saveSub = true;
    } catch (e){
      error = e;
    }

    dismiss();
    loading = false;
  }

}