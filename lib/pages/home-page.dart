// ignore_for_file: prefer_const_constructors

import 'package:coffe_ui/utils/coffe_tile.dart';
import 'package:coffe_ui/utils/coffe_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of coffe types
  final List coffeType = [
    // [ coffe type, isSelected ]
    [
      'All',
      true,
    ],
    [
      'Cappucino',
      false,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Alternative',
      false,
    ],
  ];

  // user tapped on coffe types
  void coffeTypeSelected(int index) {
    setState(() {
      // this for loop deselect all coffe types (chenge vale of isSelected to false)
      for (int i = 0; i < coffeType.length; i++) {
        coffeType[i][1] = false;
      }
      coffeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 25.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "favourite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "notifications"),
        ],
      ),
      body: Column(
        children: [
          // Find the best coffe for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              'Find the best coffee for you',
              style: GoogleFonts.bebasNeue(
                fontSize: 56,
              ),
            ),
          ),
          const SizedBox(height: 25.0),

          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Find your coffe...',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  )),
            ),
          ),

          const SizedBox(height: 25.0),

          //horizontal listview of coffe types
          Container(
            height: 50,
            // decoration: BoxDecoration(color: Colors.red),
            child: ListView.builder(
              itemCount: coffeType.length,
              itemBuilder: (context, index) {
                return CoffeType(
                  coffeType: coffeType[index][0],
                  isSelected: coffeType[index][1],
                  onTap: () {
                    coffeTypeSelected(index);
                  },
                );
              },
              scrollDirection: Axis.horizontal,
              // ignore: prefer_const_literals_to_create_immutables
            ),
          ),

          // Horizontal listview of coffe tiles
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeTile(
                coffeImagePath: 'lib/images/coffe1.jpg',
                coffeName: 'Latte',
                coffePrice: '4.00',
                coffeDetails: 'With almond milk',
              ),
              CoffeTile(
                coffeImagePath: 'lib/images/coffe2.jpg',
                coffeName: 'Americano',
                coffePrice: '3.00',
                coffeDetails: 'Strong black coffe',
              ),
              CoffeTile(
                coffeImagePath: 'lib/images/coffe3.jpg',
                coffeName: 'Cappucino',
                coffePrice: '4.50',
                coffeDetails: 'With lactose-free milk',
              ),
            ],
          ))

          // Bottom navigation bar
        ],
      ),
    );
  }
}
