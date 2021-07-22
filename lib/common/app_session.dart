import 'package:coinhe/constant/preference_key.dart';
import 'package:coinhe/data/model/language_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class AppSession {

  String token;
  String languageSelect;
  String userAgent;
  GlobalKey<NavigatorState> navigationKey = GlobalKey();

  List<Language> languageList = [
    Language("English", Locale('en', '')),
    Language("Tiếng Việt", Locale('vi', '')),
    Language("한국어", Locale('ko', '')),
    Language("日本語", Locale('jp', '')),
    Language("繁體中文", Locale('zh', '')),
    Language("Русский", Locale('ru', '')),
    Language("Español", Locale('es', '')),
    Language("Française", Locale('fr', '')),
    Language("Deutsch", Locale('de', '')),
    Language("Türkçe", Locale('tr', '')),
    Language("Nederland", Locale('nl', '')),
    Language("Português", Locale('pt', '')),
    Language("Italilano", Locale('it', '')),
    Language("Poski", Locale('pl', '')),
    Language("Indonesian", Locale('id', '')),
  ];

  static final AppSession _shared = new AppSession._internal();

  factory AppSession() {
    return _shared;
  }
  AppSession._internal();

  Box box;

  Future init() async {
    await openBox();
    token = box.get(PreferenceKey.TOKEN);
    if (box.containsKey(PreferenceKey.LANGUAGE)) {
      languageSelect = box.get(PreferenceKey.LANGUAGE);
    }
    if (box.containsKey(PreferenceKey.TOKEN)) {
      token = box.get(PreferenceKey.TOKEN);
    }
  }

  openBox() async {
    var path = await getApplicationDocumentsDirectory();
    print('path: $path');
    if (!Hive.isBoxOpen(PreferenceKey.BOX_HIVE)) {
      Hive.init(path.path);
    }
    box = await Hive.openBox(PreferenceKey.BOX_HIVE);
  }

  closeBox() {
    Hive.close();
  }

  logout() async{
    token = null;
    languageSelect = null;
    if (box.containsKey(PreferenceKey.LANGUAGE)) {
      languageSelect = box.get(PreferenceKey.LANGUAGE);
    }
    await box.clear();
    if (languageSelect != null && languageSelect.isNotEmpty) {
      await box.put(PreferenceKey.LANGUAGE, languageSelect);
    }
  }

}