import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/features/presentation/pages/home_screen.dart';
import 'package:task_management/features/presentation/widgets/plus_button.dart';
import 'package:task_management/features/presentation/pages/task_screen.dart';
import 'package:task_management/generated/assets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const TaskScreen(),
  ];

  void _onTapNavItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const PlusButton(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => _onTapNavItem(index),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 0 ? Assets.iconsHome : Assets.iconsInactiveHome,
            ),
            label: 'Home',
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.grid_view_outlined), label: 'Task'),
        ],
      ),
    );
  }
}
