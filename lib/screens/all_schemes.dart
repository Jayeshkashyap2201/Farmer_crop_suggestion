import 'package:farmer_voice_assistant/design/text_layouts.dart';
import 'package:farmer_voice_assistant/maps/schemeMap.dart';
import 'package:farmer_voice_assistant/widgets/scheme_card.dart';
import 'package:flutter/material.dart';
class AllSchemes extends StatelessWidget {
  const AllSchemes({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTextStyles.bgcolor,
      appBar:AppBar(
        title: Text('योजनाये जानियें',
        style: AppTextStyles.large,),
        backgroundColor: AppTextStyles.bgcolor,
        centerTitle: true,
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: schemeMap.length,
          itemBuilder: (context,index){
            var singlecrop = schemeMap[index];
            return SchemeCard(scheme : singlecrop);
          }
      ),
    );
  }
}
