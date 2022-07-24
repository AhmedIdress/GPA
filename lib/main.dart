import 'package:gpacalculate/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:gpacalculate/logic/main_logic.dart';
import 'package:gpacalculate/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>MainLogic(),),
    ],
    child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GPA',
      theme: ThemeData(
        primarySwatch: MaterialColor(
          int.parse(
            'FF009788',
            radix: 16,
          ),
          {
            50: primaryColor.withOpacity(.1),
            100: primaryColor.withOpacity(.2),
            200: primaryColor.withOpacity(.3),
            300: primaryColor.withOpacity(.4),
            400: primaryColor.withOpacity(.5),
            500: primaryColor.withOpacity(.6),
            600: primaryColor.withOpacity(.7),
            700: primaryColor.withOpacity(.8),
            800: primaryColor.withOpacity(.9),
            900: primaryColor.withOpacity(1),
          },
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
