import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  pushNamed(String route, {Object? args}) {
    return navigatorKey.currentState?.pushNamed(route, arguments: args);
  }

  pushReplacedNamed(String route, {Object? args}) {
    return navigatorKey.currentState
        ?.pushReplacementNamed(route, arguments: args);
  }

  pushNamedAndRemoveUtil(String route, {Object? args}) {
    return navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(route, (r) => false, arguments: args);
  }

  goBack() {
    return navigatorKey.currentState?.pop();
  }
}