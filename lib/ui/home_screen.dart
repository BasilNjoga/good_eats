import 'package:flutter/material.dart';
import 'package:good_eats/ui/orders_screen.dart';
import 'package:good_eats/ui/profile_screen.dart';
import 'package:good_eats/ui/welcome_screen.dart';
import 'package:good_eats/util/colors.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "homescreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  List<Map> menuIcons = [
     {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.event, 'label': 'Orders'},
    {'icon': Icons.account_circle_rounded, 'label': 'Profile'}
  ];

  @override
  void initState() {
    //_pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Column(
        children: [ 
           Expanded(
            child: 
          PageView(
            controller: _pageController,
            children: const [
             WelcomeScreen(),
             OrdersScreen(),
             ProfileScreen()
            ],
            onPageChanged: (int index) {
              setState(() {
                _pageController.jumpToPage(index);
                _currentIndex = index;
              });
            }
          )
          )
        
        ],
      ),
     // resizeToAvoidBottomInset: true,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
       currentIndex: _currentIndex,
      selectedIconTheme: const IconThemeData(color: AppColors.appBrown),
      selectedItemColor: AppColors.appBrown,
      unselectedItemColor : Colors.black,
        onTap: (index) {
          setState(() {
            _pageController.jumpToPage(index);
           _currentIndex = index;
          });
        },
        items: List.generate(menuIcons.length, (index) {
          return BottomNavigationBarItem(
            icon: Icon(menuIcons[index]['icon']),
            label: menuIcons[index]['label'],
            );
        }),
      ),
    );
  }
}