import 'package:flutter/material.dart';
import 'package:it_zone_task/src/features/home/home_scree_binding.dart';
import 'package:it_zone_task/src/features/home/home_screen.dart';
import 'package:it_zone_task/src/features/splash/splash_screen.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      {
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      }
    case HomeScreen.routeName:
      {
        return MaterialPageRoute(builder: (context) {
          HomeScreenBinding().dependencies();
          return const HomeScreen();
        });
      }
    default:
      {
        return MaterialPageRoute(builder: (context) => const ErrorRoute());
      }
  }
}

class ErrorRoute extends StatelessWidget {
  const ErrorRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('You should not be here...'),
      ),
    );
  }
}
