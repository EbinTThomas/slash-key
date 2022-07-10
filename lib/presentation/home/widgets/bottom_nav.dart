import 'package:slashkey/core/fonts.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int newIndex, _) {
          return BottomNavigationBar(
            currentIndex: newIndex,
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.pink,
            unselectedItemColor: Colors.black,
            selectedFontSize: fs_xxs,
            unselectedFontSize: fs_xxs,
            selectedIconTheme: const IconThemeData(
                color: Colors.pink
            ),
            unselectedIconTheme: const IconThemeData(
                color: Colors.black
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined),
                activeIcon: Icon(Icons.category),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.radio_outlined),
                activeIcon: Icon(Icons.radio),
                label: 'Studio',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined),
                activeIcon: Icon(Icons.explore),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.face_outlined),
                activeIcon: Icon(Icons.face),
                label: 'Profile',
              ),
            ],
          );
        }
    );
  }
}
