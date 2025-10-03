import 'package:farmer_voice_assistant/additional/Humidity.dart';
import 'package:farmer_voice_assistant/additional/heat_Index.dart';
import 'package:farmer_voice_assistant/design/text_layouts.dart';
import 'package:farmer_voice_assistant/maps/cropsMap.dart';
import 'package:farmer_voice_assistant/additional/suggetion.dart';
import 'package:farmer_voice_assistant/widgets/global.dart';
import 'package:farmer_voice_assistant/widgets/http.dart';
import 'package:flutter/material.dart';
import 'package:farmer_voice_assistant/maps/crop_fatch_api.dart';
import 'package:farmer_voice_assistant/maps/current_condition.dart';
import '../additional/Dew.dart';
import '../additional/Gust.dart';
class CropInfo extends StatefulWidget {
  const CropInfo({super.key});

  @override
  State<CropInfo> createState() => _CropInfoState();
}

class _CropInfoState extends State<CropInfo> {
  int cropIndex = 0;
  bool isLoading = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    cropIndex = args['index'];
  }
  void fetching() async{
    Future.delayed(Duration (seconds: 5),(){
      CircularProgressIndicator();
    });  }
  @override
  void initState() {
    super.initState();
    WeatherApi().fetchWeather().then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text("अधिक जाने"),centerTitle: true,),
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('अधिक जाने',style: AppTextStyles.large,),
        centerTitle: true,
        backgroundColor: AppTextStyles.bgcolor,
      ),
      backgroundColor: AppTextStyles.bgcolor,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: size.width*0.95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[300],
                border: Border.all(color: Colors.white,width: 5),
              ),
              child: Padding(padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          shadowColor: Colors.grey[900],
                            elevation: 50,
                            child: SizedBox(height :size.height *0.2, width : size.width *0.5 ,child: Image(fit: BoxFit.cover,image: AssetImage(CropsDetails[cropIndex]['image'])))),
                        SizedBox(width: size.width*0.02),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height:100,width:100,child: Text(CropsDetails[cropIndex]['name'],style: AppTextStyles.large.copyWith(fontSize: 15),)),
                            SizedBox(
                                height: 120,width: 100,
                                child: CircleAvatar( backgroundImage: AssetImage('assets/images/kissan.jpg'),radius: 5,)),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("आपके शहर  ${selectedItemGlobal!} के मौसम के अनुमान के अनुसार",style: TextStyle(color: Colors.grey.shade700,fontSize: 10),),
                          ),
                        ),
                      ],
                    ),
                    Divider(thickness: 3,color: Colors.black,),
                    Row(
                      children: [
                        SizedBox(
                          height: 70,
                          width: size.width*0.286,
                          child: Card(
                            color: Colors.blue.shade50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text("आवश्यक उद्देश्य",style: TextStyle(fontSize: 9),)),
                              ),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                          width: size.width*0.286,
                          child: Card(
                            color: Colors.blue.shade50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text("आवश्यक आवश्यकताएँ",style: TextStyle(fontSize: 9),)),
                              ),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                          width: size.width*0.28,
                          child: Card(
                            color: Colors.blue.shade50,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text("अगले तीन महीने की स्थिति",style: TextStyle(fontSize: 9),)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(thickness: 3,color: Colors.black,),
                    Row(
                      children: [
                        SizedBox(
                          height: 70,
                          width: size.width*0.286,
                          child: Card(color: Colors.orange.shade50,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text(cropApi[cropIndex]["current"]["temp"],style: TextStyle(fontSize: 9),)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                          width: size.width*0.286,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text(current[cropIndex]["temperature"],style: TextStyle(fontSize: 9),)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                          width: size.width*0.28,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text(WeatherApi.temp)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    (double.tryParse(current[cropIndex]["requiredTemp"].toString())! < (double.tryParse(WeatherApi.temp)?? 0.0)) ?
                    Container(
                        decoration: BoxDecoration(
                        color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(20),
                      ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5,right: 5),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Stack(
                                    children: [
                                      Icon(Icons.crop_square_sharp,size: 30,),
                                      Positioned(left:3 ,top: 3, child: Icon(Icons.close,color: Colors.red,),),
                                    ],
                                  ),
                                Flexible(child: Text("यह समय इस फसल की खेती के लिए आवश्यक तापमान नहीं है",style: TextStyle(fontSize: 9),)),
                                ],
                              ),
                              Suggetion(),
                            ],
                          ),
                        )):
                    Container(
                        decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5,right: 5),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Icon(Icons.crop_square_sharp,size: 30,),
                                Positioned(left:3 ,top: 3, child: Icon(Icons.check,color: Colors.green.shade900,),),
                              ],
                            ),
                            Text("यह समय इस फसल की खेती के लिए आवश्यक तापमान है",style: TextStyle(fontSize: 9),),],
                        ),
                      )),
                    Divider(thickness: 3 ,),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(
                          height: 70,
                          width: size.width*0.286,
                          child: Card(color: Colors.orange.shade50,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text(cropApi[cropIndex]["heatindex"],style: TextStyle(fontSize: 9),)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                          width: size.width*0.28,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text(current[cropIndex]["heatindex"],style: TextStyle(fontSize: 9),)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                          width: size.width*0.286,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text(WeatherApi.heatIndex)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        (double.tryParse(current[cropIndex]["heat"].toString())! < (double.tryParse(WeatherApi.heatIndex)?? 0.0)) ?
                        Container(decoration: BoxDecoration(
                          color: Colors.red.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5,right: 5),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Icon(Icons.crop_square_sharp,size: 30,),
                                          Positioned(left:3 ,top: 3, child: Icon(Icons.close,color: Colors.red,),),
                                        ],
                                      ),
                                      Text("यह समय इस फसल की खेती के लिए आवश्यक ऊष्मा सूचकांक नहीं है",style: TextStyle(fontSize: 7),),
                                    ],
                                  ),
                                  heatIndex(),
                                ],
                              ),
                            )):
                        Container(decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5,right: 5),
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Icon(Icons.crop_square_sharp,size: 30,),
                                  Positioned(left:3 ,top: 3, child: Icon(Icons.check,color: Colors.green.shade900,),),
                                ],
                              ),
                              Text("यह समय इस फसल की खेती के लिए आवश्यक ऊष्मा सूचकांक है",style: TextStyle(fontSize: 8.3),),
                            ],
                          ),
                        )),
                      ],
                    ),
                    Divider(thickness: 3,),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(
                          height: 70,
                          width: size.width*0.286,
                          child: Card(
                            color: Colors.orange.shade50,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text(cropApi[cropIndex]["gust"],style: TextStyle(fontSize: 9),)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                          width: size.width*0.28,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text(current[cropIndex]["gust"],style: TextStyle(fontSize: 9),)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                          width: size.width*0.286,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text(WeatherApi.gust)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        if (double.tryParse(current[cropIndex]["g"].toString())!< (double.tryParse(WeatherApi.gust)?? 0.0))
                          Container(decoration: BoxDecoration(
                          color: Colors.red.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5,right: 5),
                            child: Column(
                              children: [
                                Row(

                                  children: [
                                    Stack(
                                      children: [
                                        Icon(Icons.crop_square_sharp,size: 30,),
                                        Positioned(left:3 ,top: 3, child: Icon(Icons.close,color: Colors.red,),),
                                      ],
                                    ),
                                    Text("यह समय इस फसल की खेती के लिए आवश्यक झोंका किलोमीटर प्रति घंटा नहीं है",style: TextStyle(fontSize: 6.5),),
                                  ],
                                ),
                                Gust(),
                              ],
                            ),
                          )) else Container(
                          decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5,right: 5),
                            child:Row(
                              children: [
                                Stack(
                                  children: [
                                    Icon(Icons.crop_square_sharp,size: 30,),
                                    Positioned(left:3 ,top: 3, child: Icon(Icons.check,color: Colors.green.shade900,),),
                                  ],
                                ),
                                Text("यह समय इस फसल की खेती के लिए आवश्यक झोंका किलोमीटर प्रति घंटा है",style: TextStyle(fontSize: 7),),
                              ],
                            ),
                          )),
                      ],
                    ),
                    Divider(thickness: 3 ,),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(
                          height: 70,
                          width: size.width*0.28,
                          child: Card(color: Colors.orange.shade50,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text(cropApi[cropIndex]["humidity"],style: TextStyle(fontSize: 9),)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                          width: size.width*0.28,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text(current[cropIndex]["humidity"],style: TextStyle(fontSize: 9),)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                          width: size.width*0.28,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text(WeatherApi.humidity)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        if ((double.tryParse(current[cropIndex]["huf"].toString())?? 0.0)<(double.tryParse(WeatherApi.humidity) ?? 0.0))
                          Container(decoration: BoxDecoration(
                          color: Colors.red.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5,right: 5),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Icon(Icons.crop_square_sharp,size: 30,),
                                          Positioned(left:3 ,top: 3, child: Icon(Icons.close,color: Colors.red,),),
                                        ],
                                      ),
                                      Text("यह समय इस फसल की खेती के लिए आवश्यक नमी नहीं है",style: TextStyle(fontSize: 9),),
                                    ],
                                  ),
                                  Humidity(),
                                ],
                              ),
                            )) else Container(
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5,right: 5),
                              child:Row(
                                children: [
                                  Stack(
                                    children: [
                                      Icon(Icons.crop_square_sharp,size: 30,),
                                      Positioned(left:3 ,top: 3, child: Icon(Icons.check,color: Colors.green.shade900,),),
                                    ],
                                  ),
                                  Text("यह समय इस फसल की खेती के लिए आवश्यक नमी है",style: TextStyle(fontSize: 9),),
                                ],
                              ),
                            )),
                      ],
                    ),
                    Divider(thickness: 3 ,),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(
                          height: 70,
                          width: size.width*0.28,
                          child: Card(color: Colors.orange.shade50,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text(cropApi[cropIndex]["dewpoint"],style: TextStyle(fontSize: 9),)),
                            ),
                          ),
                        ),
                        SizedBox(
                        height: 70,
                        width: size.width*0.28,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text(current[cropIndex]["dewpoint"],style: TextStyle(fontSize: 9),)),
                            ),
                          ),
                        ),
                    SizedBox(
                      height: 70,
                      width: size.width*0.28,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text(WeatherApi.dewPoint)),
                        ),
                      ),
                    ),
                    ],
                    ),
                    Row(
                      children: [
                        if (double.tryParse(current[cropIndex]["dew"].toString())!>(double.tryParse(WeatherApi.dewPoint)?? 0.0)) Container(decoration: BoxDecoration(
                          color: Colors.red.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5,right: 5),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Icon(Icons.crop_square_sharp,size: 30,),
                                          Positioned(left:3 ,top: 3, child: Icon(Icons.close,color: Colors.red,),),
                                        ],
                                      ),
                                      Text("यह समय इस फसल की खेती के लिए आवश्यक ओसांक नहीं है",style: TextStyle(fontSize: 9),),
                                    ],
                                  ),
                                  Dew(),
                                ],
                              ),
                            )) else Container(
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5,right: 5),
                              child:Row(
                                children: [
                                  Stack(
                                    children: [
                                      Icon(Icons.crop_square_sharp,size: 30,),
                                      Positioned(left:3 ,top: 3, child: Icon(Icons.check,color: Colors.green.shade900,),),
                                    ],
                                  ),
                                  Text("यह समय इस फसल की खेती के लिए आवश्यक ओसांक है",style: TextStyle(fontSize: 9),),
                                ],
                              ),
                            )),
                      ],
                    ),
                    Divider(thickness: 3 ,),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(
                          height: 70,
                          width: size.width*0.28,
                          child: Card(color: Colors.orange.shade50,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text(cropApi[cropIndex]["cloud"],style: TextStyle(fontSize: 9),)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                          width: size.width*0.28,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text(current[cropIndex]["cloud"],style: TextStyle(fontSize: 9),)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                          width: size.width*0.28,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text(WeatherApi.cloud)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                    children: [
                    SizedBox(
                    height: 70,
                    width: size.width*0.28,
                    child: Card(color: Colors.orange.shade50,
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(cropApi[cropIndex]["wind"],style: TextStyle(fontSize: 9),)),
                    ),
                    ),
                    ),
                    SizedBox(
                    height: 70,
                    width: size.width*0.28,
                    child: Card(
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(current[cropIndex]["wind"],style: TextStyle(fontSize: 9),)),
                    ),
                    ),
                    ),
                    SizedBox(
                    height: 70,
                    width: size.width*0.28,
                    child: Card(
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(WeatherApi.wind)),
                    ),
                    ),
                    ),
                    ],
                    ),
                    Row(
                    children: [
                    SizedBox(
                    height: 70,
                    width: size.width*0.28,
                    child: Card(color: Colors.orange.shade50,
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(cropApi[cropIndex]["wind_direction"],style: TextStyle(fontSize: 9),)),
                    ),
                    ),
                    ),
                    SizedBox(
                    height: 70,
                    width: size.width*0.28,
                    child: Card(
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(current[cropIndex]["wind_direction"],style: TextStyle(fontSize: 9),)),
                    ),
                    ),
                    ),
                    SizedBox(
                    height: 70,
                    width: size.width*0.28,
                    child: Card(
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text(WeatherApi.windDirection)),
                      ),
                    ),
                                          ),
                                        ],
                                      ),
                    // Row(
                    //   children: [
                    //     SizedBox(
                    //       height: 100,
                    //       width: size.width*0.286,
                    //       child: Card(color: Colors.orange.shade50,
                    //         child: Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: Center(child: Text(cropApi[cropIndex]["current"]["condition"]["text"])),
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       height: 100,
                    //       width: size.width*0.286,
                    //       child: Card(
                    //         child: Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: Center(child: Text(current[cropIndex]["cloud_condition"])),
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       height: 100,
                    //       width: size.width*0.286,
                    //       child: Card(
                    //         child: Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: Center(child: Text(WeatherApi.cloud)),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Divider(color: Colors.red.shade300,thickness: 3,),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        SizedBox(
                          height: 70,
                          width: size.width*0.8,
                          child: Card(
                            elevation: 10,
                            color: Colors.deepOrange.shade100,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Center(child: Text("इस फसल के बारे में अतिरिक्त महत्वपूर्ण बातें",style: TextStyle(fontSize: 12),),),
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                    Divider(color: Colors.red.shade300,thickness: 3,),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(
                          height: 90,
                          width: size.width*0.3,
                          child: Card(
                            color: Colors.yellow.shade50,
                            child: Center(child: Text("मिट्टी",style: TextStyle(fontSize: 9),)),
                          ),
                        ),
                        SizedBox(
                          height: 90,
                          width: size.width*0.55,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text(CropsDetails[cropIndex]["soil"],style: TextStyle(fontSize: 9),),),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 90,
                          width: size.width*0.3,
                          child: Card(
                            color: Colors.yellow.shade50,
                            child: Center(child: Text("समय",style: TextStyle(fontSize: 9),)),
                          ),
                        ),
                        SizedBox(
                          height: 90,
                          width: size.width*0.55,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text(CropsDetails[cropIndex]["time"],style: TextStyle(fontSize: 9),),),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 90,
                          width: size.width*0.3,
                          child: Card(
                            color: Colors.yellow.shade50,
                            child: Center(child: Text("कटाई का समय",style: TextStyle(fontSize: 9),)),
                          ),
                        ),
                        SizedBox(
                          height: 90,
                          width: size.width*0.55,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text(CropsDetails[cropIndex]["grow"],style: TextStyle(fontSize: 9),),),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 90,
                          width: size.width*0.3,
                          child: Card(
                            color: Colors.yellow.shade50,
                            child: Center(child: Text("फसल",style: TextStyle(fontSize: 9),)),
                          ),
                        ),
                        SizedBox(
                          height: 90,
                          width: size.width*0.55,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text(CropsDetails[cropIndex]["harvest"],style: TextStyle(fontSize: 9),),),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 90,
                          width: size.width*0.3,
                          child: Card(
                            color: Colors.yellow.shade50,
                            child: Center(child: Text("फसलों के बीच अंतर",style: TextStyle(fontSize: 9),)),
                          ),
                        ),
                        SizedBox(
                          height: 90,
                          width: size.width*0.55,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text(CropsDetails[cropIndex]["spacing"],style: TextStyle(fontSize: 9),),),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 90,
                          width: size.width*0.3,
                          child: Card(
                            color: Colors.yellow.shade50,
                            child: Center(child: Text("फसल की विशेषता",style: TextStyle(fontSize: 9),)),
                          ),
                        ),
                        SizedBox(
                          height: 90,
                          width: size.width*0.55,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text(CropsDetails[cropIndex]["special"],style: TextStyle(fontSize: 9),),),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
