// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_audio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditAudioStore on _EditAudioStore, Store {
  Computed<Function> _$sendPressedComputed;

  @override
  Function get sendPressed =>
      (_$sendPressedComputed ??= Computed<Function>(() => super.sendPressed,
              name: '_EditAudioStore.sendPressed'))
          .value;

  final _$groupIdAtom = Atom(name: '_EditAudioStore.groupId');

  @override
  String get groupId {
    _$groupIdAtom.reportRead();
    return super.groupId;
  }

  @override
  set groupId(String value) {
    _$groupIdAtom.reportWrite(value, super.groupId, () {
      super.groupId = value;
    });
  }

  final _$soundAtom = Atom(name: '_EditAudioStore.sound');

  @override
  String get sound {
    _$soundAtom.reportRead();
    return super.sound;
  }

  @override
  set sound(String value) {
    _$soundAtom.reportWrite(value, super.sound, () {
      super.sound = value;
    });
  }

  final _$soundNameAtom = Atom(name: '_EditAudioStore.soundName');

  @override
  String get soundName {
    _$soundNameAtom.reportRead();
    return super.soundName;
  }

  @override
  set soundName(String value) {
    _$soundNameAtom.reportWrite(value, super.soundName, () {
      super.soundName = value;
    });
  }

  final _$errorAtom = Atom(name: '_EditAudioStore.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$loadingAtom = Atom(name: '_EditAudioStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$saveSubAtom = Atom(name: '_EditAudioStore.saveSub');

  @override
  bool get saveSub {
    _$saveSubAtom.reportRead();
    return super.saveSub;
  }

  @override
  set saveSub(bool value) {
    _$saveSubAtom.reportWrite(value, super.saveSub, () {
      super.saveSub = value;
    });
  }

  final _$_sendAsyncAction = AsyncAction('_EditAudioStore._send');

  @override
  Future<void> _send() {
    return _$_sendAsyncAction.run(() => super._send());
  }

  final _$_EditAudioStoreActionController =
      ActionController(name: '_EditAudioStore');

  @override
  void setGroupId(String value) {
    final _$actionInfo = _$_EditAudioStoreActionController.startAction(
        name: '_EditAudioStore.setGroupId');
    try {
      return super.setGroupId(value);
    } finally {
      _$_EditAudioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSound(String value) {
    final _$actionInfo = _$_EditAudioStoreActionController.startAction(
        name: '_EditAudioStore.setSound');
    try {
      return super.setSound(value);
    } finally {
      _$_EditAudioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSoundName(String value) {
    final _$actionInfo = _$_EditAudioStoreActionController.startAction(
        name: '_EditAudioStore.setSoundName');
    try {
      return super.setSoundName(value);
    } finally {
      _$_EditAudioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
groupId: ${groupId},
sound: ${sound},
soundName: ${soundName},
error: ${error},
loading: ${loading},
saveSub: ${saveSub},
sendPressed: ${sendPressed}
    ''';
  }
}
