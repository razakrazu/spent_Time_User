import 'package:flutter/material.dart';
import 'package:speat_time_user/core/color.dart';
import 'package:speat_time_user/view/booking_details/booking_details_screen.dart';
import 'package:speat_time_user/view/home_screen/home_screen.dart';
import 'package:speat_time_user/view/searching/search_screen.dart';
import 'package:speat_time_user/view/settings/settings_screen.dart';



class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List<Widget> _widgetOptions = <Widget>   [
   HomeScreen(),
 const   SearchingScreen(),
    BookingDetailsScreen(),
  const  SettingsScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('BottomNavigationBar Sample'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 25,),
            label: 'home',
              backgroundColor:  Color.fromARGB(255, 86, 120, 92),
          ),
             BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined,size: 25,),
            label: 'search',
            // backgroundColor: Color.fromARGB(255, 156, 156, 156),
                    backgroundColor:  Color.fromARGB(255, 86, 120, 92),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel_rounded,size: 25,),
            label: 'booking',
        backgroundColor:  Color.fromARGB(255, 86, 120, 92),
          ),
       
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin,size: 30,),
            label: 'Profile',
                 backgroundColor:  Color.fromARGB(255, 86, 120, 92),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:const Color.fromARGB(255, 255, 255, 255),
        // backgroundColor: const Color.fromARGB(255, 86, 120, 92),
        onTap: _onItemTapped,
        unselectedIconTheme:const IconThemeData(color: Color.fromARGB(255, 222, 222, 222)),
      ),
    );
  }
}
