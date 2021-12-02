import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_12/bloc/service_blocs/navigation_bloc.dart';
import 'package:task_12/bloc/service_blocs/toggle_bloc.dart';
import 'package:task_12/bloc/showcase_bloc/showcase_bloc.dart';

import 'main_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bool _bool = false;
  late bool _exit;

  final _icons = <IconData>[Icons.home, Icons.person];

  final pages = <Widget>[
    MainPage(),
    Container(),
  ];

  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ToggleBloc>(
          create: (context1) => ToggleBloc(_bool),
        ),
        BlocProvider<NavigationBloc>(
          create: (context2) => NavigationBloc(_bottomNavIndex),
        ),
      ],
      child: BlocBuilder<NavigationBloc, int>(builder: (context, index) {
        NavigationBloc navigationBloc =
            BlocProvider.of<NavigationBloc>(context);
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
            SystemChannels.textInput.invokeMethod('TextInput.hide');
          },
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Color(0xff47536D),
              title: index == 0 ? Text('7food на карте') : Text('Профиль'),
              centerTitle: true,
              actions: [
                index == 1
                    ? IconButton(
                        icon: Icon(
                          Icons.exit_to_app_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      )
                    : Text(''),
              ],
            ),
            floatingActionButton: MediaQuery.of(context).viewInsets.bottom == 0
                ? SizedBox(
                    width: 65,
                    height: 65,
                    child: FloatingActionButton(
                      backgroundColor: Color(0xff47536D),
                      onPressed: () {},
                      child: Icon(Icons.qr_code_outlined),
                    ))
                : SizedBox(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
            bottomNavigationBar: AnimatedBottomNavigationBar(
              activeColor: Colors.blue,
              inactiveColor: Color(0xff47536D),
              icons: _icons,
              activeIndex: _bottomNavIndex,
              gapLocation: GapLocation.center,
              onTap: (index) {
                navigationBloc.add(IndexEvent(index: index));
                setState(() {
                  _bottomNavIndex = index;
                });
                // setState(() {
                //   homeProvider.bottomNavIndex = index;
                //   index == 3 ? homeProvider.changeLogOutBool(true) : homeProvider.changeLogOutBool(false);
                //   appBarText = homeProvider.appBarTexts[homeProvider.bottomNavIndex];
                // });
              },
            ),
            body: pages[_bottomNavIndex],
          ),
        );
      }),
    );
  }
}
