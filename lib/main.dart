import 'package:covid/components/dashboard/add-dependent.dart';
import 'package:covid/components/dashboard/dependent.dart';
import 'package:covid/components/dashboard/vaccination.dart';
import 'package:covid/pages/auth/forget.dart';
import 'package:covid/pages/auth/login.dart';
import 'package:covid/pages/auth/profile/step2.dart';
import 'package:covid/pages/auth/profile/step3.dart';
import 'package:covid/pages/auth/profile/success.dart';
import 'package:covid/pages/auth/register.dart';
import 'package:covid/pages/auth/start.dart';
import 'package:covid/pages/checkin/history.dart';
import 'package:covid/pages/home.dart';
import 'package:covid/pages/question.dart';
import 'package:covid/providers/authProvider.dart';
import 'package:covid/providers/dataProvider.dart';
import 'package:covid/splash.dart';
import 'package:covid/status.dart';
import 'package:covid/utils/palett.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => DataProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID',
      theme: ThemeData(
        primarySwatch: Palette.kToDark,
        scaffoldBackgroundColor: const Color(0xFFEBEBEB),
      ),
      home: HomePage(),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/start': (context) => GetStarted(),
        '/login': (context) => LogIn(),
        '/register': (context) => Register(),
        '/reset': (context) => ForgetPassword(),
        '/setupProfile2': (context) => SetupProfile2(),
        '/setupProfile3': (context) => SetupProfile3(),
        '/profileSuccess': (context) => ProfileSuccess(),
        '/status': (context) => StatusPage(),
        '/question': (context) => QuesetionPage(),
        '/home': (context) => HomePage(),
        '/vaccination': (context) => VaccinationWidget(),
        '/dependents': (context) => ManageDependent(),
        '/addDependents': (context) => AddDependent(),
        '/checkInHistory': (context) => CheckInHistoryPage(),
      },
    );
  }
}
