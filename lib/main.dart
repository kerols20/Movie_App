import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/app_routs/routes_name.dart';
import 'core/app_routs/routs_app.dart';
import 'core/bloc_observer/bloc_observer.dart';
import 'core/constant_app/colors_app.dart';
import 'core/dip/dip.dart';
import 'core/global_cubit/global_cubit.dart';
import 'core/global_cubit/global_intent.dart';
import 'core/global_cubit/global_state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'dart:ui' as ui;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final WidgetsBinding widgetsBinding =
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await configureDependencies();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translation',
      fallbackLocale: const Locale('en'),
      child: DevicePreview(
        enabled: false,
        builder: (context) =>
            BlocProvider(
                create: (context) => getIt<GlobalCubit>()..doIntent(GlobalInitializationIntent(), context),
              child: BlocBuilder<GlobalCubit, GlobalState>(
                builder: (context, state) {
                  String initialRoute = RoutesName.onBoardingScreen;
                  if (state is LoadedRedirectedScreen) {
                    initialRoute = state.redirectedScreen;
                  }
                  if (state is LanguageChangedState) {
                    context.setLocale(state.locale);
                  }
                  return ScreenUtilInit(
                    designSize: const Size(375, 812),
                    minTextAdapt: true,
                    splitScreenMode: true,
                    child: MaterialApp(
                      builder: (context, child) {
                        return Directionality(
                          textDirection: context.locale.languageCode == 'ar'
                              ? ui.TextDirection.rtl
                              : ui.TextDirection.ltr,
                          child: child!,
                        );
                      },
                      theme: CustomTeme.darkTheme,
                      initialRoute: initialRoute,
                      onGenerateRoute: AppRoutes.onGenerateRoute,
                      locale: context.locale,
                      supportedLocales: context.supportedLocales,
                      localizationsDelegates: context.localizationDelegates,
                      debugShowCheckedModeBanner: false,
                    )
                  );
                },
              )
            ),
      ),
    ),
  );
}

