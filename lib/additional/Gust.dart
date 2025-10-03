import 'package:flutter/material.dart';
class Gust extends StatelessWidget {
  const Gust({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("इस समस्या के समाधान के लिए आप निम्लिखित कार्य कर सकते हैं",style: TextStyle(fontSize: 8),),
        )),
        Card(color: Colors.green.shade100,
          child: Row(children: [
            Stack(
              children: [
                Icon(Icons.crop_square_sharp,size: 30,),
                Positioned(left:3 ,top: 3, child: Icon(Icons.check,color: Colors.green.shade700,),),
              ],
            ),
            Text("फसलों के चारों ओर हवा रोकने वाले पेड़ (windbreaks) लगाएं।",style: TextStyle(fontSize: 8),),
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
            Text("बाँस या डंडों से पौधों को सहारा दें (staking)।",style: TextStyle(fontSize: 9),),
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
            Text("कम ऊँचाई वाली किस्में उगाएं जो तेज हवा में झुकें नहीं।",style: TextStyle(fontSize: 8),),
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
            Text("नेट्स या बैरिकेड्स का इस्तेमाल करें खेत के किनारों पर।",style: TextStyle(fontSize: 8),),
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
            Text("खुला खेत हो तो घनी बुवाई करें, ताकि आपस में सहारा मिले।",style: TextStyle(fontSize: 8),),
          ],),
        ),
      ],
    );
  }
}
