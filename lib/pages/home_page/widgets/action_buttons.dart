import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_12/bloc/service_blocs/toggle_bloc.dart';
import 'package:task_12/constants.dart';

class ActionButtons extends StatelessWidget {
  Constants mainColors = Constants();
  late Size screenSize;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    ToggleBloc toggleBloc = BlocProvider.of<ToggleBloc>(context);
    return BlocBuilder<ToggleBloc, bool>(
      builder: (context, currentBool) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: screenSize.height * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screenSize.width * 0.45,
                decoration: BoxDecoration(
                    color: currentBool ? Colors.white : Color(0xff47536D),
                    border: Border.all(color: mainColors.tMainColor),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        topLeft: Radius.circular(16))),
                child: TextButton(
                  child: Text(
                    'Список',
                    style: TextStyle(
                        color: currentBool ? Colors.black : Colors.white),
                  ),
                  onPressed: () {
                    toggleBloc.add(ColorEvent.event_right);
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                    color: currentBool ? Color(0xff47536D) : Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        topRight: Radius.circular(16))),
                child: TextButton(
                  child: Text(
                    'На карте',
                    style: TextStyle(
                        color: currentBool ? Colors.white : Colors.black),
                  ),
                  onPressed: () {
                    toggleBloc.add(ColorEvent.event_left);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
