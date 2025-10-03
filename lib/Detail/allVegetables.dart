import 'package:farmer_voice_assistant/Detail/vegetables.dart';
import 'package:flutter/material.dart';

import '../design/text_layouts.dart';
import '../widgets/card.dart';

class Allvegetables extends StatefulWidget {
  const Allvegetables({super.key});

  @override
  State<Allvegetables> createState() => _AllvegetablesState();
}

class _AllvegetablesState extends State<Allvegetables> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("सभी फसलें",
          style: AppTextStyles.large,),
        centerTitle: true,
        backgroundColor: AppTextStyles.bgcolor,
      ),
      backgroundColor: AppTextStyles.bgcolor,
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemCount: vegetables.length,
            itemBuilder: (context, index){
              var singleVegetable = vegetables[index];
              return card(crop: singleVegetable,height: size.height*0.13, width: size.width*0.7);
            }
        ),
      ),
    );
  }
}
