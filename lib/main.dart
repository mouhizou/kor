import 'package:flutter/material.dart';
import 'package:korane/pages/home_page.dart';
import 'package:korane/theme/theme_prov.dart';

import 'package:provider/provider.dart';

import 'audio/audio_prov.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>theme_prov(),),
          ChangeNotifierProvider(create: (context)=>audio_prov(context),),
        ],
        child: const MyApp(),
      )

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<theme_prov>(context).themedata,
      home: homepage(),
    );
  }
}