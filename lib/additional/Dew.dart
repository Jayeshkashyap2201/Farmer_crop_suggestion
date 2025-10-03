import 'package:flutter/material.dart';
class Dew extends StatelessWidget {
  const Dew({super.key});

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
            Padding(
              padding: const EdgeInsets.only(left: 5,right: 5),
              child: Text("नियमित सिंचाई करें",style: TextStyle(fontSize: 13),),
            ),
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
            Padding(
              padding: const EdgeInsets.only(left: 5,right: 5),
              child: Text("मल्चिंग करें",style: TextStyle(fontSize: 13),),
            ),
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
            Padding(
              padding: const EdgeInsets.only(left: 5,right: 5),
              child: Text("रात में सिंचाई से बचें",style: TextStyle(fontSize: 13),),
            ),
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
            Padding(
              padding: const EdgeInsets.only(left: 5,right: 5),
              child: Text("हवा से फसलों की सुरक्षा करें",style: TextStyle(fontSize: 13),),
            ),
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
            Padding(
              padding: const EdgeInsets.only(left: 5,right: 5),
              child: Text("पॉलीहाउस या ग्रीनहाउस का उपयोग करें",style: TextStyle(fontSize: 13),),
            ),
          ],),
        ),
      ],
    );
  }
}
