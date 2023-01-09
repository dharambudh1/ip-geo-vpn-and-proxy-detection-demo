import "package:flutter/material.dart";
import "package:ipify_demo/screen/home_screen.dart";
import "package:ipify_demo/singleton/dio_singleton.dart";

/*
      Account credential:
      Website: https://geo.ipify.org/login
      Username: temp.dharam.001@gmail.com
      Password: D*******3
      Docs: https://geo.ipify.org/docs
      API Type: 3
      API Features: Country + City + VPN detection
*/

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioSingleton().addPrettyDioLoggerInterceptor();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "IP Geolocation Demo",
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
