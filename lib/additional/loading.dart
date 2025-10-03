import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../widgets/global.dart';
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //late int cropIndex = 0;
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    cropIndex = args['index'];
  }
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 2,),(){
      Navigator.pushNamed(context, '/crop_info');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: Center(
        child: SpinKitPouringHourGlassRefined(
          color: Colors.blue,
          size: 200,
        ),
      ),
    );
  }
}

