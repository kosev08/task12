import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_12/bloc/service_blocs/toggle_bloc.dart';
import 'package:task_12/pages/home_page/widgets/action_buttons.dart';
import 'package:task_12/pages/home_page/widgets/map.dart';
import 'package:task_12/pages/home_page/widgets/showcases_list.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleBloc, bool>(builder: (context, currentBool) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ActionButtons(),
            Center(
              child: !currentBool ? Container() : MapPage(),
            )
          ],
        ),
      );
    });
  }
}
