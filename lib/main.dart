import 'package:farmer_voice_assistant/Detail/all_fruits.dart';
import 'package:farmer_voice_assistant/Navigator_bar.dart';
import 'package:farmer_voice_assistant/additional/loading.dart';
import 'package:farmer_voice_assistant/design/choose_crop.dart';
import 'package:farmer_voice_assistant/screens/home_screen.dart';
import 'package:farmer_voice_assistant/screens/all_crops.dart';
import 'package:farmer_voice_assistant/screens/all_schemes.dart';
import 'package:farmer_voice_assistant/screens/information.dart';
import 'package:farmer_voice_assistant/widgets/assistant.dart';
import 'package:farmer_voice_assistant/widgets/crop_info.dart';
import 'package:farmer_voice_assistant/widgets/scheme_detail.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/navigato_bar',
      routes:{
        '/navigato_bar':  (context)=>NavigatorBar(),
        '/home_screen':  (context) => HomeScreen(),
        '/crop_info'  :  (context)=>CropInfo(),
        '/all_crops'  :  (context)=>AllCrops(),
        '/all_schemes':  (context)=>AllSchemes(),
        '/assistant'  :  (context)=>Assistant(),
        '/schemeDetails':(context)=>SchemeDetail(),
        '/information':  (context)=>Information(),
        '/loading'    :  (context)=>Loading(),
        '/choose_crop':  (context)=>ChooseCrop(),
        '/all_fruits'     :  (context)=>AllFruits(),
      },
    );
  }
}