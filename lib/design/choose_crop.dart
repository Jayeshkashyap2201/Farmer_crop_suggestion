import 'package:farmer_voice_assistant/Detail/allVegetables.dart';
import 'package:farmer_voice_assistant/design/text_layouts.dart';
import 'package:flutter/material.dart';
class ChooseCrop extends StatelessWidget {
  const ChooseCrop({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:AppTextStyles.bgcolor,
        title: Text("अपनी फसलें चुनें",style: TextStyle(fontSize: 20),),
      ),
      backgroundColor: AppTextStyles.bgcolor,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Container(
              width: size.width * 0.95,
              height: size.height * 0.3,
              child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/all_fruits');
                },
                child: Card(
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        SizedBox(height: size.width*0.30,child: Image(image: AssetImage("assets/images/fruit.jpg"),fit: BoxFit.cover,)),
                        SizedBox(height: 20,),
                        Center(child: Text("फलो की जानकारी",style: TextStyle(fontSize: 20),),)
                      ],
                    ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: size.width * 0.95,
              height: size.height * 0.3,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Allvegetables()));
                },
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      SizedBox(height: size.width*0.35,child: Image(image: AssetImage("assets/images/vegetables.jpg"),fit: BoxFit.cover,)),
                      SizedBox(height: 20,),
                      Center(child: Text("सब्ज़ियों की जानकारी",style: TextStyle(fontSize: 20),),)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
