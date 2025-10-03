import 'package:flutter/material.dart';
class Humidity extends StatelessWidget {
  const Humidity({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("इस समस्या के समाधान के लिए आप निम्लिखित कार्य कर सकते हैं",style: TextStyle(fontSize: 8.3),),
        )),
        Card(color: Colors.green.shade100,
          child: Row(children: [
            Stack(
              children: [
                Icon(Icons.crop_square_sharp,size: 30,),
                Positioned(left:3 ,top: 3, child: Icon(Icons.check,color: Colors.green.shade700,),),
              ],
            ),
            Text("सिंचाई की आवृत्ति बढ़ाएं (थोड़ी-थोड़ी बार–बार पानी दें)।",style: TextStyle(fontSize: 9),),
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
            Text("मल्चिंग करें: मिट्टी को सूखने से बचाने के लिए भूसी या सूखी घास डालें।",style: TextStyle(fontSize: 7.3),),
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
            Text("सुबह या शाम में पानी दें ताकि वाष्पीकरण कम हो।",style: TextStyle(fontSize:9),),
          ],),
        ),
      ],
    );
  }
}
