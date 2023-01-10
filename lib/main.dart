import "package:flutter/material.dart";
import "package:ipify_demo/screen/home_screen.dart";
import "package:ipify_demo/singleton/dio_singleton.dart";

/*    Account credential:
      Website: https://vpnapi.io/
      Username: temp.dharam.001@gmail.com
      Password: D*******3    */

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
      title: "IP, Geo, VPN & Proxy Detection",
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
