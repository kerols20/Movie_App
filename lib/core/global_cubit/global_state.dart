import 'dart:ui';

sealed class GlobalState {}
class GlobalInitial extends GlobalState {}


class LoadedRedirectedScreen extends GlobalState {
  final String redirectedScreen;
  LoadedRedirectedScreen({required this.redirectedScreen});
}
final class LanguageChangedState extends GlobalState {
  final Locale locale;
  LanguageChangedState(this.locale);
}

