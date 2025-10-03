import 'package:farmer_voice_assistant/design/choose_crop.dart';
import 'package:farmer_voice_assistant/screens/home_screen.dart';
import 'package:farmer_voice_assistant/screens/all_crops.dart';
import 'package:farmer_voice_assistant/screens/all_schemes.dart';
import 'package:farmer_voice_assistant/screens/information.dart';
import 'package:flutter/material.dart';
class NavigatorBar extends StatefulWidget {
  const NavigatorBar({super.key});

  @override
  State<NavigatorBar> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {

  final appScreens =[
    const HomeScreen(),
    const ChooseCrop(),
    const AllSchemes(),
    const Information(),
  ];

  var SelectedIndex =0;
  void tapped(int index){
    setState(() {
      SelectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: appScreens[SelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: SelectedIndex,
        onTap: tapped,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey[500],
        showSelectedLabels: false,
        showUnselectedLabels: true,
        items : const [
        BottomNavigationBarItem(icon: Icon(Icons.home),
          activeIcon: Icon(Icons.home),
          label: 'मुख्य पृष्ठ',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.all_inbox),
          activeIcon: Icon(Icons.all_inbox),
          label: 'फसलें',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.details_rounded),
          activeIcon: Icon(Icons.details_rounded),
          label: 'योजनाओं',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.info),
          activeIcon: Icon(Icons.info),
          label: 'जानकारी',
        ),
      ],
      ),
    );
  }
}
