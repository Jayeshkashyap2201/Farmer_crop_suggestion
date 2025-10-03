import 'package:farmer_voice_assistant/maps/schemeMap.dart';
import 'package:flutter/material.dart';
class SchemeCard extends StatelessWidget {
  final Map<String,dynamic>scheme;
  const SchemeCard({super.key, required this.scheme});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width*0.90,
      height: 250.0,
      child: Card(
        elevation: 50,
        shadowColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: schemeMap.length,
          itemBuilder: (context, index) {
            final schemeItem = schemeMap[index];
            GestureDetector(
              onTap: (){
                var index = schemeMap.indexOf(schemeItem);
                Navigator.pushNamed(context, '/schemeDetails' , arguments: { 'index' : index});
              },
              child: Column(
                children: [
                SizedBox(
                  height: size.height*0.2,
                  width: size.width*0.3,
                  child: Image(image: AssetImage(schemeItem['image']))
                ),
                SizedBox(height:15 ),
                Center(
                  child: Text(schemeItem['name'],style: TextStyle(fontSize: 10,),),
                ),
                ],
              ),
            );
          }
        ),
        ),
      )
    );
  }
}
