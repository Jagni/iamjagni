import 'package:flutter/material.dart';
import 'package:iamjagni/screens/portfolio/index.dart';
import 'package:iamjagni/screens/profile/index.dart';
import 'package:iamjagni/widgets/fade_indexed_stack.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  final widgetOptions = [
    ProfileScreen(),
    PortfolioScreen(),
    Center(child: Text("formação")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: FadeIndexedStack(
                index: _currentIndex, children: widgetOptions)),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => setState(() {
            _currentIndex = index;
          }),
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
            BottomNavigationBarItem(
                icon: Icon(Icons.folder_special), label: 'Portfólio'),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Formação',
            )
          ],
        ));
  }
}
