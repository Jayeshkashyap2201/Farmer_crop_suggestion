import 'package:farmer_voice_assistant/design/text_layouts.dart';
import 'package:farmer_voice_assistant/maps/schemeMap.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
class SchemeDetail extends StatefulWidget {
  const SchemeDetail({super.key});
  @override
  State<SchemeDetail> createState() => _SchemeDetailState();
}

class _SchemeDetailState extends State<SchemeDetail> {
  late int schemeIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    schemeIndex = args['index'];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTextStyles.bgcolor,
      appBar: AppBar(
        backgroundColor: AppTextStyles.bgcolor,
        title: Text('जानकारी देखें',
        style: AppTextStyles.large),
        centerTitle: true,
      ),
      body: Padding(padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
            Center(
              child: SizedBox(
              width: size.width*0.95,
                height: 290,
                child: Card(
                  elevation: 50,
                  shadowColor: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          SizedBox(height: size.height*0.2,
                              width: size.width*0.7,child: Image(image: AssetImage(schemeMap[schemeIndex]['image']),)),
                          SizedBox(height:15 ),
                          Center(
                            child: Text(schemeMap[schemeIndex]['name'],style: TextStyle(
                              fontSize: 17,
                            ),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ),
                Column(
                  children: [
                    SizedBox(height: 30,),
                    Divider(color: Colors.grey,thickness: 5,),
                    Text("आवश्यकता / Requirements",style: AppTextStyles.large.copyWith(fontSize: 15),),
                    //SizedBox(height: 10),
                    Divider(color: Colors.grey,thickness: 5,),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child :Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text("आयु / Age")),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text(schemeMap[schemeIndex]["requirement"]["age"])),
                            ),
                          ),
                        ),
                      ],
                    ),
                     SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child :Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text("पता / Address")),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text(schemeMap[schemeIndex]["requirement"]["address"])),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child :Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text("शिक्षा / Education")),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text(schemeMap[schemeIndex]["requirement"]["education"])),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child :Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text("अतिरिक्त जरूरतें")),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text(schemeMap[schemeIndex]["requirement"]["additional"])),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(color: Colors.grey,thickness: 5,),
                    Text("फ़ायदे / Benifits",style: AppTextStyles.large.copyWith(fontSize: 15),),
                    Divider(color: Colors.grey,thickness: 5,),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child :Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text("वित्तीय / Financial")),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text(schemeMap[schemeIndex]["benifit"]["finencial"])),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    Row(
                      children: [
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child :Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text("औरत / Women")),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text(schemeMap[schemeIndex]["benifit"]["women"])),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    Row(
                      children: [
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child :Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text("रोजगार / Employment")),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text(schemeMap[schemeIndex]["benifit"]["rojgar"])),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    Row(
                      children: [
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child :Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text("भविष्य / Future")),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text(schemeMap[schemeIndex]["benifit"]["future"])),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Divider(color: Colors.grey,thickness: 5,),
                    Text("दस्तावेज़ / Documents",style: AppTextStyles.large.copyWith(fontSize: 15),),
                    Divider(color: Colors.grey,thickness: 5,),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child :Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text("आधार / Aadhar")),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text(schemeMap[schemeIndex]["documents"]["aadhar"])),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child :Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Center(child: Text("बैंक खाता / Bank Account")),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text(schemeMap[schemeIndex]["documents"]["bankaccount"])),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child :Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text("निवासप्रमाण पत्र / Domicile")),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text(schemeMap[schemeIndex]["documents"]["nivaspramanpatra"])),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child :Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text("तस्वीर / Photo")),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text(schemeMap[schemeIndex]["documents"]["photo"])),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Divider(color: Colors.grey,thickness: 5,),
                    Text("प्रक्रिया / Process",style: AppTextStyles.large.copyWith(fontSize: 15),),
                    Divider(color: Colors.grey,thickness: 5,),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child :Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text("ऑनलाइन / Online")),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 60,
                        //   width: size.width*0.6,
                        //   child: FilledButton(onPressed: ()  {
                        //     //_launchURL();
                        //   },
                        //       child: Text(schemeMap[schemeIndex]["process"]["online"],)),
                        // )
                        // Expanded(child: Container()),
                        Link(uri: Uri.parse(schemeMap[schemeIndex]["process"]["link"]),
                            target: LinkTarget.defaultTarget,
                            builder: (context , followLink) {
                              return SizedBox(
                                height: size.height*0.07,
                                width: size.width*0.43,
                                child: ElevatedButton(onPressed: followLink, child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Text("अभी आवेदान दे !",style: TextStyle(fontSize: 12,color: Colors.red),),
                                )),
                              );
                            }),
                        // Expanded(child: Container()),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child :Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text("ऑफलाइन / Offline")),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text(schemeMap[schemeIndex]["process"]["offline"])),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child :Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text("समय / Time")),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height*0.07,
                          width: size.width*0.43,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Center(child: Text(schemeMap[schemeIndex]["process"]["time"])),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

