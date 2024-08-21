import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:projeto_matricula_application/view/login/login_page.dart';

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class NavigationService {
  final _appRoutes = {
    Routes.app: (_) => LoginPage(),
  };

  final Set<String> _fullScreenRoutes = {};

  final Set<String> _cupertinoRoutes = {};

  Future<dynamic> navigateTo(
    String routeName, [
    Object? arguments,
    bool replace = false,
  ]) async {
    if (_appRoutes[routeName] != null) {
      return replace
          ? appNavigatorKey.currentState
              ?.pushReplacementNamed(routeName, arguments: arguments)
          : appNavigatorKey.currentState
              ?.pushNamed(routeName, arguments: arguments);
    }
  }

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return _appRoutes[settings.name!] != null
        ? _cupertinoRoutes.contains(settings.name)
            ? CupertinoPageRoute(
                settings: settings,
                builder: (_) => _appRoutes[settings.name]!(settings.arguments),
                fullscreenDialog: _fullScreenRoutes.contains(settings.name),
              )
            : MaterialPageRoute(
                settings: settings,
                builder: (_) => _appRoutes[settings.name]!(settings.arguments),
                fullscreenDialog: _fullScreenRoutes.contains(settings.name),
              )
        : MaterialPageRoute(builder: (_) => LoginPage());
  }

  Future<dynamic> push(Widget page) async {
    return await Navigator.push(
      appNavigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  Future<dynamic> pushAndRemoveAll(
    String routeName, [
    Object? arguments,
  ]) async {
    return appNavigatorKey.currentState
        ?.pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  Future<dynamic> pushPageAndRemoveAll(Widget page) async {
    await Navigator.pushAndRemoveUntil(appNavigatorKey.currentContext!,
        MaterialPageRoute<void>(builder: (context) => page), (route) => false);
  }

  static NavigationService of(BuildContext context) =>
      RepositoryProvider.of<NavigationService>(context);
}

class Routes {
  static const app = 'home';
}

class NavDestinationModel {
  final Widget? screen;
  final String? label;
  final Widget? icon;
  final Widget? selectedIcon;
  final Widget? child;

  NavDestinationModel({
    this.screen,
    this.label,
    this.icon,
    this.selectedIcon,
    this.child,
  });

  static List<NavDestinationModel> destinations = [
    NavDestinationModel(
      label: 'Um',
      icon: const HeroIcon(HeroIcons.chatBubbleBottomCenter,
          color: Colors.blue, size: 30, style: HeroIconStyle.outline),
      selectedIcon: const HeroIcon(HeroIcons.chatBubbleBottomCenterText,
          color: Colors.purple, size: 30, style: HeroIconStyle.solid),
      screen: Container(),
    ),
    NavDestinationModel(
      label: 'Dois',
      icon: const HeroIcon(HeroIcons.users,
          color: Colors.blue, size: 30, style: HeroIconStyle.outline),
      selectedIcon: const HeroIcon(HeroIcons.users,
          color: Colors.purple, size: 30, style: HeroIconStyle.solid),
      screen: Container(),
    ),
    NavDestinationModel(
        label: 'Tres',
        icon: const HeroIcon(HeroIcons.cog8Tooth,
            color: Colors.blue, size: 30, style: HeroIconStyle.outline),
        selectedIcon: const HeroIcon(HeroIcons.cog8Tooth,
            color: Colors.purple, size: 30, style: HeroIconStyle.solid),
        screen: Container()),
  ];

  List<NavDestinationModel> getDestinations() {
    return destinations;
  }
}
