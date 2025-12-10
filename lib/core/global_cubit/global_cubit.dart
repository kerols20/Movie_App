
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:injectable/injectable.dart';

import '../app_routs/routes_name.dart';
import 'global_intent.dart';
import 'global_state.dart';
@injectable
class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());
  void doIntent(GlobalIntent intent, BuildContext context) async {
    switch (intent) {
      case GlobalInitializationIntent _ :
        await _initializeApp();
        break;
      case ChangeLanguageIntent _:
        _changeLanguage(context, ( intent).index);
        break;
    }
  }
  Future<void> _initializeApp() async{
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
    emit(LoadedRedirectedScreen(redirectedScreen: RoutesName.onBoardingScreen));

  }
  void _changeLanguage(BuildContext context, int index) {
    final newLocale = index == 1 ? const Locale('ar') : const Locale('en');
    context.setLocale(newLocale);
    emit(LanguageChangedState(newLocale));
  }
}
