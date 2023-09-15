// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:eleven_labs/model/model.dart' as _i6;
import 'package:eleven_labs/model/voice.dart' as _i7;
import 'package:eleven_labs/ui/views/home/home_view.dart' as _i2;
import 'package:eleven_labs/ui/views/startup/startup_view.dart' as _i3;
import 'package:eleven_labs/ui/views/voice_list/voice_list_view.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i8;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const voiceListView = '/voice-list-view';

  static const all = <String>{
    homeView,
    startupView,
    voiceListView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.voiceListView,
      page: _i4.VoiceListView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(nullOk: false);
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.HomeView(
            key: args.key, models: args.models, voices: args.voices),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.VoiceListView: (data) {
      final args = data.getArgs<VoiceListViewArguments>(nullOk: false);
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.VoiceListView(
            key: args.key, voices: args.voices, onSelected: args.onSelected),
        settings: data,
        fullscreenDialog: true,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class HomeViewArguments {
  const HomeViewArguments({
    this.key,
    required this.models,
    required this.voices,
  });

  final _i5.Key? key;

  final List<_i6.Model> models;

  final List<_i7.Voice> voices;

  @override
  String toString() {
    return '{"key": "$key", "models": "$models", "voices": "$voices"}';
  }

  @override
  bool operator ==(covariant HomeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.models == models && other.voices == voices;
  }

  @override
  int get hashCode {
    return key.hashCode ^ models.hashCode ^ voices.hashCode;
  }
}

class VoiceListViewArguments {
  const VoiceListViewArguments({
    this.key,
    required this.voices,
    required this.onSelected,
  });

  final _i5.Key? key;

  final List<_i7.Voice> voices;

  final void Function(_i7.Voice) onSelected;

  @override
  String toString() {
    return '{"key": "$key", "voices": "$voices", "onSelected": "$onSelected"}';
  }

  @override
  bool operator ==(covariant VoiceListViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.voices == voices &&
        other.onSelected == onSelected;
  }

  @override
  int get hashCode {
    return key.hashCode ^ voices.hashCode ^ onSelected.hashCode;
  }
}

extension NavigatorStateExtension on _i8.NavigationService {
  Future<dynamic> navigateToHomeView({
    _i5.Key? key,
    required List<_i6.Model> models,
    required List<_i7.Voice> voices,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key, models: models, voices: voices),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVoiceListView({
    _i5.Key? key,
    required List<_i7.Voice> voices,
    required void Function(_i7.Voice) onSelected,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.voiceListView,
        arguments: VoiceListViewArguments(
            key: key, voices: voices, onSelected: onSelected),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView({
    _i5.Key? key,
    required List<_i6.Model> models,
    required List<_i7.Voice> voices,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key, models: models, voices: voices),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVoiceListView({
    _i5.Key? key,
    required List<_i7.Voice> voices,
    required void Function(_i7.Voice) onSelected,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.voiceListView,
        arguments: VoiceListViewArguments(
            key: key, voices: voices, onSelected: onSelected),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
