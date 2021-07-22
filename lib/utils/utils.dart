import 'package:coinhe/common/app_session.dart';
import 'package:coinhe/data/model/language_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Locale getLocaleByCountry(String country) {
  if (country == null || country.isEmpty) {
    return Locale('en', '');
  }
  for (var item in AppSession().languageList) {
    if (item.countryName == country) {
      return item.locale;
    }
  }
  return Locale('en', '');
}

Language getLocaleByCode(String code) {
  if (code == null || code.isEmpty) {
    return AppSession().languageList[0];
  }
  for (var item in AppSession().languageList) {
    if (item.locale.languageCode == code) {
      return item;
    }
  }
  return AppSession().languageList[0];
}

String formatNumberDisplay(num number, int fraction, bool isDisplayFraction) {
  var f = new NumberFormat("#,###", "en_US");
  if (!isDisplayFraction && number.truncateToDouble() == number) {
    fraction = 0;
  }
  f.maximumFractionDigits = fraction;
  f.minimumFractionDigits = fraction;
  f.minimumIntegerDigits = 1;
  return f.format(number);
}
