import 'package:flutter/material.dart';
class heatIndex extends StatelessWidget {
  const heatIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("इस समस्या के समाधान के लिए आप निम्लिखित कार्य कर सकते हैं",style: TextStyle(fontSize: 13),),
        )),
        Card(color: Colors.green.shade100,
          child: Row(children: [
            Stack(
              children: [
                Icon(Icons.crop_square_sharp,size: 30,),
                Positioned(left:3 ,top: 3, child: Icon(Icons.check,color: Colors.green.shade700,),),
              ],
            ),
            Text("सुबह/शाम सिंचाई करें, दोपहर में बचें।"),
          ],),
        ),

        Card(color: Colors.green.shade100,
          child: Row(children: [
            Stack(
              children: [
                Icon(Icons.crop_square_sharp,size: 30,),
                Positioned(left:3 ,top: 3, child: Icon(Icons.check,color: Colors.green.shade700,),),
              ],
            ),
            Text("ड्रिमल्चिंग (Mulching) से मिट्टी की नमी बनाए रखें।"),
          ],),
        ),
        Card(color: Colors.green.shade100,
          child: Row(children: [
            Stack(
              children: [
                Icon(Icons.crop_square_sharp,size: 30,),
                Positioned(left:3 ,top: 3, child: Icon(Icons.check,color: Colors.green.shade700,),),
              ],
            ),
            Text("शेड नेट्स या हरी घास की छांव से पौधों को धूप से बचाएं।"),
          ],),
        ),
        Card(color: Colors.green.shade100,
          child: Row(children: [
            Stack(
              children: [
                Icon(Icons.crop_square_sharp,size: 30,),
                Positioned(left:3 ,top: 3, child: Icon(Icons.check,color: Colors.green.shade700,),),
              ],
            ),
            Text("गर्मी सहनशील किस्में चुनें।"),
          ],),
        ),
        Card(color: Colors.green.shade100,
          child: Row(children: [
            Stack(
              children: [
                Icon(Icons.crop_square_sharp,size: 30,),
                Positioned(left:3 ,top: 3, child: Icon(Icons.check,color: Colors.green.shade700,),),
              ],
            ),
            Text("ज़रूरत हो तो स्प्रे करके ठंडक दें (जैसे पानी या जैविक स्प्रे)।"),
          ],),
        ),
      ],
    );
  }
}
