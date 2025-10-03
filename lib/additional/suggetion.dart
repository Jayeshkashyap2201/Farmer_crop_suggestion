import 'package:flutter/material.dart';
class Suggetion extends StatelessWidget {
  const Suggetion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Card(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("इस समस्या के समाधान के लिए आप निम्लिखित कार्य कर सकते हैं",style: TextStyle(fontSize: 9),),
      )),
      Card(color: Colors.green.shade100,
        child: Row(children: [
          Stack(
          children: [
            Icon(Icons.crop_square_sharp,size: 30,),
            Positioned(left:3 ,top: 3, child: Icon(Icons.check,color: Colors.green.shade700,),),
          ],
        ),
          Text("छायादार जाल (shade nets) का उपयोग करें।",style: TextStyle(fontSize: 9),),
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
          Text("ड्रिप इरिगेशन से मिट्टी को ठंडा रखें।",style: TextStyle(fontSize: 9),),
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
          Text("गीली घास (mulching) डालें तापमान नियंत्रण के लिए।",style: TextStyle(fontSize: 9),),
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
          Text("ड्गर्मी सहनशील बीजों का चयन करें।",style: TextStyle(fontSize: 9),),
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
          Text("ड्सुबह या शाम को सिंचाई करें।",style: TextStyle(fontSize: 9),),
        ],),
      ),
    ],
    );
  }
}
