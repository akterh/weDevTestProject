import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_project/screens/home.dart';
import 'package:test_project/screens/login.dart';



 main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);




  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
  ));




  runApp(

      MyApp(),

  );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {


    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: "Test project",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Colors.red,
      ),
      home:Login(),
      //home: Main(),
    );
  }
}
