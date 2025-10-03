import 'package:farmer_voice_assistant/design/text_layouts.dart';
import 'package:farmer_voice_assistant/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:farmer_voice_assistant/maps/cropsMap.dart';
class AllCrops extends StatelessWidget {

  const AllCrops({super.key, });

  @override
  Widget build(BuildContext context) {
   var size = MediaQuery.of(context).size;
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
          itemCount: CropsDetails.length,
          itemBuilder: (context, index){
            var singleCrop = CropsDetails[index];
            return card(crop: singleCrop,height: size.height*0.1, width: size.width*0.7,);
          }
        ),
      ),
    );
  }
}
