import 'package:farmer_voice_assistant/maps/cropsMap.dart';
import 'package:farmer_voice_assistant/widgets/global.dart';
import 'package:flutter/material.dart';
import 'crop_info.dart';
class card extends StatelessWidget {
  final Map<String,dynamic>crop;
  final height;
  final width;
  const card({super.key, required this.crop, required this.height, required this.width});

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
              Navigator.pushNamed(context, '/crop_info', arguments: {'index' : index});
            },
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.75,
                  width: width,
                  child: Image(image: AssetImage(crop['image']),
                    fit: BoxFit.cover,),
                ),
                SizedBox(height:8 ),
                Expanded(
                  child: Text(crop['name'],textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                    ),
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
