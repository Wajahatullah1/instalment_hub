import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(
              icon: Icons.home_outlined,
              index: 0,
              currentIndex: currentIndex,
              onTap: onTap,
            ),
            _navItem(
              icon: Icons.groups_outlined,
              index: 1,
              currentIndex: currentIndex,
              onTap: onTap,
            ),
            const SizedBox(width: 40), // For FAB spacing
            _navItem(
              icon: Icons.attach_money_outlined,
              index: 3,
              currentIndex: currentIndex,
              onTap: onTap,
            ),
            _navItem(
              icon: Icons.person_outline,
              index: 4,
              currentIndex: currentIndex,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    required int index,
    required int currentIndex,
    required Function(int) onTap,
  }) {
    final isSelected = currentIndex == index;
    return IconButton(
      icon: Icon(
        icon,
        color: isSelected ? Colors.blue : Colors.black87,
      ),
      onPressed: () => onTap(index),
    );
  }
}
