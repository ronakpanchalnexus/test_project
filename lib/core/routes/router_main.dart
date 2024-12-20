part of 'router.dart';

Route<dynamic> generateRoute(RouteSettings settings,
    {bool reverseAnimation = false}) {
  switch (settings.name) {
    case RouteConstants.login:
      final isLogin = Prefs.getBool(key: Constants.isLogin);
      return _pageBuilder(
        (_) => isLogin ? DashboardScreen() : LoginScreen(),
        settings: settings,
        reverseAnimation: reverseAnimation,
      );
    case RouteConstants.dashboard:
      return _pageBuilder(
        (_) => DashboardScreen(),
        settings: settings,
        reverseAnimation: reverseAnimation,
      );
    case RouteConstants.editProfile:
      return _pageBuilder(
        (_) => EditProfileScreen(),
        settings: settings,
        reverseAnimation: reverseAnimation,
      );
    default:
      return _pageBuilder(
        (_) => const Placeholder(),
        settings: settings,
        reverseAnimation: reverseAnimation,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(Widget Function(BuildContext) page,
    {required RouteSettings settings, required bool reverseAnimation}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, secondaryAnimation, child) {
      final begin =
          reverseAnimation ? const Offset(-1.5, 0.0) : const Offset(1.5, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) => page(context),
  );
}

Future<void> navigateTo({
  required BuildContext context,
  required String route,
  String? routeUntil,
  Object? arguments,
  bool finish = false,
  bool finishAll = false,
  bool finishUntil = false,
  bool reverseAnimation = false,
  Function(dynamic)? then,
}) async {
  mContext = context;
  if (finish) {
    Navigator.pushReplacement(
      context,
      generateRoute(
        RouteSettings(
          name: route,
          arguments: arguments,
        ),
        reverseAnimation: reverseAnimation,
      ),
    );
  } else if (finishAll) {
    Navigator.pushAndRemoveUntil(
      context,
      generateRoute(
        RouteSettings(
          name: route,
          arguments: arguments,
        ),
        reverseAnimation: reverseAnimation,
      ),
      (kRoute) => false,
    );
  } else if (finishUntil) {
    Navigator.pushAndRemoveUntil(
      context,
      generateRoute(
        RouteSettings(
          name: route,
          arguments: arguments,
        ),
        reverseAnimation: reverseAnimation,
      ),
      ModalRoute.withName(routeUntil ?? route),
    );
  } else {
    Navigator.push(
      context,
      generateRoute(
        RouteSettings(
          name: route,
          arguments: arguments,
        ),
        reverseAnimation: reverseAnimation,
      ),
    ).then((value) {
      mContext = context;
      if (then != null) {
        then(value);
      } else {
        () {};
      }
    });
  }
}
