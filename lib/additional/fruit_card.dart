import 'package:farmer_voice_assistant/maps/cropsMap.dart';
import 'package:farmer_voice_assistant/widgets/global.dart';
import 'package:flutter/material.dart';
class FruitCard extends StatelessWidget {
  final Map<String,dynamic>crop;
  const FruitCard({super.key, required this.crop});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 205,
      child: Card(
        elevation: 54,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/crop_info');
          },
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Image(image: AssetImage(crop['image']),
                  fit: BoxFit.cover,),
                SizedBox(height:8 ),
                Text(crop['name'],
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
