import 'dart:core';
import 'package:farmer_voice_assistant/design/text_layouts.dart';
import 'package:flutter/material.dart';
import 'package:farmer_voice_assistant/widgets/global.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
  static String getSelectedState(_InformationState state) => state.selectedItem ?? "";
}

class _InformationState extends State<Information> {
  List <String> items = ["Indore" , "Bhopal" , "Ujjain" , "Dhar" , "Riwa" , "Gwalior" , "Narmadapuram" , "Dewas" , "Pachmani"];
  String ? selectedItem;
  final TextEditingController emailText = TextEditingController();
  bool view = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("कृपया जानकारी भरें",style: AppTextStyles.large,),
        backgroundColor: Colors.blue.shade50,
        centerTitle: true,
      ),
      backgroundColor: Colors.blue.shade50,
      body: Stack(
        children: [
          Center(
            child: Container(
                height: size.height*0.9,
                width: size.width*0.97,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage("assets/images/village.jpeg"),
                    fit: BoxFit.cover
                  ),
                ),
            ),
          ),
          Positioned(
            width: size.width * 0.94,
            top: size.width * 0.4,
            left: size.width * 0.03,
            child: Card(
              color: Colors.blue.shade100,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Card
                      (
                      elevation : 30,
                      color: Colors.red.shade50,
                      child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("अपने शहर से संबंधित जानकारी के लिए निम्नलिखत जानकारी दर्ज करे"),
                    ),),
                    SizedBox(height: 20,),
                    Card(
                      child: TextField(
                        enabled: true,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailText,
                        obscureText: view,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          suffixStyle: TextStyle(fontSize: 15),
                          suffixText: "@gamil.com",
                          labelText: "email",
                          hintText: "xyz@gmail.com",
                          prefixIcon: Icon(Icons.mail_rounded),
                          suffixIcon: IconButton( onPressed: () => setState(() => view =!view ),
                              icon: Icon(view ? Icons.visibility : Icons.visibility_off)),
                          focusedBorder: OutlineInputBorder(
                            //borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.purpleAccent,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            //borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: size.width*0.9,
                      child: Card(
                        color: Colors.green.shade50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton(
                            iconSize: 30,
                            borderRadius: BorderRadius.circular(30),
                            hint: Text("कृपया अपना आवासीय क्षेत्र चुनें",style: TextStyle(fontSize: 10),),
                            value: selectedItem,
                            items: items.map((singleItem) =>DropdownMenuItem(
                                value: singleItem,
                                child: Text(singleItem)
                              )).toList(),
                            onChanged: (String? clicked) {
                              setState(() {
                                selectedItem = clicked;
                                selectedItemGlobal = clicked!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    FilledButton(onPressed: (){
                      Navigator.pushNamed(context, '/');
                    },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.upload,size: 30,),
                          Text("अपनी जानकारी सुनीश्चित करे",style: TextStyle(color: Colors.white),),
                        ],
                      ),
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
