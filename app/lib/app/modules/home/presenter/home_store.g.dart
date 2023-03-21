// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$isFullScreenAtom =
      Atom(name: '_HomeStoreBase.isFullScreen', context: context);

  @override
  bool get isFullScreen {
    _$isFullScreenAtom.reportRead();
    return super.isFullScreen;
  }

  @override
  set isFullScreen(bool value) {
    _$isFullScreenAtom.reportWrite(value, super.isFullScreen, () {
      super.isFullScreen = value;
    });
  }

  late final _$controllerAtom =
      Atom(name: '_HomeStoreBase.controller', context: context);

  @override
  VideoPlayerController? get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(VideoPlayerController? value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  late final _$controllerPageViewAtom =
      Atom(name: '_HomeStoreBase.controllerPageView', context: context);

  @override
  PageController get controllerPageView {
    _$controllerPageViewAtom.reportRead();
    return super.controllerPageView;
  }

  @override
  set controllerPageView(PageController value) {
    _$controllerPageViewAtom.reportWrite(value, super.controllerPageView, () {
      super.controllerPageView = value;
    });
  }

  late final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase', context: context);

  @override
  dynamic setIsFullScreen() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setIsFullScreen');
    try {
      return super.setIsFullScreen();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFullScreen: ${isFullScreen},
controller: ${controller},
controllerPageView: ${controllerPageView}
    ''';
  }
}
