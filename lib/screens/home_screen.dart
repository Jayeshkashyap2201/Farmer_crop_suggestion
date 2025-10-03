import 'package:farmer_voice_assistant/maps/cropsMap.dart';
import 'package:farmer_voice_assistant/maps/schemeMap.dart';
import 'package:farmer_voice_assistant/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:farmer_voice_assistant/design/text_layouts.dart';

import '../widgets/scheme_card.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTextStyles.bgcolor,
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("आपका स्वागत है!",
                              style: AppTextStyles.large,),
                          Text("यह ऐप आपकी मदद के लिए है!",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          ],
                        ),
                        Expanded(child: Container()),
                        const Spacer(),
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:  AssetImage('assets/images/icon.jpg')),
                      ],
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Container(
                        width: size.width * 0.99,
                        //height: 850,
                        //color: Colors.white,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 2.0,color: Colors.grey),
                          boxShadow: [
                            BoxShadow(color: Colors.grey.shade200,blurRadius: 8,spreadRadius: 2)
                          ],
                        ),
                        child: Padding(padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                color: Colors.orange,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text("भारत में होने वाली फसलें उगाएं",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10.0),),
                                      Expanded(child: Container()),
                                      Icon(Icons.search),
                                      InkWell(
                                        onTap: (){
                                          Navigator.pushNamed(context, '/choose_crop');
                                        },
                                        child: Text("सभी फसलें",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 9.0),),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children:
                                  CropsDetails.map((singlecrop)=>card(crop: singlecrop, height: size.height * 0.2 , width: size.width * 1,)).toList(),
                                ),
                              ),
                              SizedBox(height: 40),
                              Divider(thickness: 3,color: Colors.red.shade300,),
                              SizedBox(height: 20),
                              Card(
                                color: Colors.orange,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text("आपके राज्य की योजनाएं",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10.0),),
                                      Expanded(child: Container()),
                                      Icon(Icons.search),
                                      InkWell(
                                        onTap:() {
                                          Navigator.pushNamed(context, '/all_schemes');
                                        },
                                        child: Text("योजनाएं देखें",
                                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 9.0),),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children:
                                    schemeMap.map((singleScheme)=>SchemeCard(scheme: singleScheme)).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
