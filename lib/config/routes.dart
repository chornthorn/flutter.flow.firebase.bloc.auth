import 'package:flutter/widgets.dart';
import 'package:flutter_authentication_flow_builder_bloc/screens/thorn_screen.dart';

import '/blocs/blocs.dart';
import '/screens/screens.dart';

List<Page> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomeScreen.page()];
    case AppStatus.unauthenticated:
      return [LoginScreen.page()];
  }
}
