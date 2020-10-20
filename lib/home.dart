// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:iamjagni/screens/formation/index.dart';
import 'package:iamjagni/screens/portfolio/index.dart';
import 'package:iamjagni/screens/profile/index.dart';

class HomePage extends StatefulWidget {
  HomePage(this.observer);

  final FirebaseAnalyticsObserver observer;

  static const String routeName = '/tab';

  @override
  State<StatefulWidget> createState() => _HomePageState(observer);
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, RouteAware {
  _HomePageState(this.observer);

  final FirebaseAnalyticsObserver observer;
  TabController _controller;
  int selectedIndex = 0;

  final List<Tab> tabs = <Tab>[
    const Tab(
      text: 'Perfil',
      icon: Icon(Icons.person),
    ),
    const Tab(text: 'Portfólio', icon: Icon(Icons.folder_special)),
    const Tab(text: 'Formação', icon: Icon(Icons.school)),
  ];

  final List<Widget> widgetOptions = [
    ProfileScreen(),
    PortfolioScreen(),
    FormationScreen(),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    observer.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    observer.unsubscribe(this);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      vsync: this,
      length: tabs.length,
      initialIndex: selectedIndex,
    );
    _controller.addListener(() {
      setState(() {
        if (selectedIndex != _controller.index) {
          selectedIndex = _controller.index;
          _sendCurrentTabToAnalytics();
        }
      });
    });
  }

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
                        image: AssetImage('assets/images/avatar.png'))),
              ),
              SizedBox(width: 4),
              Text('iAm: Jagni'),
            ],
          ),
          centerTitle: false,
        ),
        body: SafeArea(
          child: TabBarView(
            controller: _controller,
            children: widgetOptions,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _controller.index,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => setState(() {
            _controller.animateTo(index);
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

  @override
  void didPush() {
    _sendCurrentTabToAnalytics();
  }

  @override
  void didPopNext() {
    _sendCurrentTabToAnalytics();
  }

  void _sendCurrentTabToAnalytics() {
    final name = tabs[selectedIndex].text;
    observer.analytics.setCurrentScreen(
      screenName: '${HomePage.routeName}/tab-$name',
    );
  }
}
