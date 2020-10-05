import 'package:flutter/material.dart';
import 'package:iamjagni/screens/portfolio/index.dart';
import 'package:iamjagni/widgets/fade_indexed_stack.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  final widgetOptions = [
    PortfolioScreen(),
    Center(child: Text("experiencia")),
    Center(child: Text("skills")),
    Center(child: Text("perfil"))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueGrey,
                    image: DecorationImage(
                        image: AssetImage("assets/images/avatar.png"))),
              ),
              SizedBox(width: 4),
              Text("Jagni Dasa"),
            ],
          ),
          centerTitle: false,
        ),
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
            BottomNavigationBarItem(
                icon: Icon(Icons.folder_special), label: 'Portfólio'),
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'Experiência',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.code), label: 'Habilidades'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          ],
        ));
  }
}
