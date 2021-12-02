import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_12/bloc/showcase_bloc/showcase_bloc.dart';
import 'package:task_12/bloc/showcase_bloc/showcase_event.dart';
import 'package:task_12/bloc/showcase_bloc/showcase_state.dart';

import '../../../constants.dart';

class ShowShowcasesList extends StatelessWidget {
  late Size screenSize;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;

    return BlocBuilder<ShowcaseBloc, ShowcaseState>(
      builder: (context, state) {
        if (state is ShowcasesEmptyState) {
          return Center(
            child: Text('Has no showcases'),
          );
        }

        if (state is ShowcasesLoadingState) {
          print('Loading...');
          return Center(
            child: CircularProgressIndicator(
              color: Constants().mainColor,
            ),
          );
        }

        if (state is ShowcasesLoadedState) {
          return Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: state.loadedShowcases!.showcases.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenSize.height * 0.02),
                  height: screenSize.height * 0.125,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: ListTile(
                            title: Text(
                              '${state.loadedShowcases!.showcases[index].name}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              '${state.loadedShowcases!.showcases[index].address.substring(19)}',
                              style: TextStyle(fontSize: 13),
                            ),
                            leading: Image.network(
                              'https://image.freepik.com/free-vector/refrigeration-showcase-with-drinks-colorful-bottles-flat-style_136277-38.jpg',
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right,
                              size: 45,
                              color: Color(0xff47536D),
                            ),
                            onTap: () {
                              print("Button clicked");
                            })),
                  ),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: 20,
                        color: Colors.black12,
                        offset: Offset(0, 3))
                  ]),
                );
              },
            ),
          );
        }

        return Center(
          child: Text('Что-то пошло не так'),
        );
      },
    );
  }
}
