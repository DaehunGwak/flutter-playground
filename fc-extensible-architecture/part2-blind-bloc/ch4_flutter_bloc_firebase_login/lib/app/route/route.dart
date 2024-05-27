
import 'package:ch4_flutter_bloc_firebase_login/app/bloc/app_bloc.dart';
import 'package:ch4_flutter_bloc_firebase_login/home/view/home_page.dart';
import 'package:ch4_flutter_bloc_firebase_login/login/view/login_page.dart';
import 'package:flutter/widgets.dart';


List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
