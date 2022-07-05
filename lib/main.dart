import 'package:flutter/material.dart';
import 'package:kegiatan1ab/getVaccine.dart';
import 'package:kegiatan1ab/homePage.dart';
import 'package:kegiatan1ab/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kegiatan1ab/notification_handler.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import '../providers/vaccine_provider.dart';
import 'service/api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeNotification();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ApiService().getBeritaModel().then((value) => print("value: $value"));
    // ApiService().getBeritaModel().then(
    //   (value) {
    //     print("value: $value");
    //   },
    // );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => VaccineProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'kegiatan1ab',
        home: loginPage(),
      ),
    );
    // return const MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'kegiatan1ab',
    //   home: loginPage(),
    // );
  }
}
