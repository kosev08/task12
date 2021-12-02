import 'package:task_12/models/showcases.dart';

abstract class ShowcaseState {}

class ShowcasesEmptyState extends ShowcaseState {}

class ShowcasesLoadingState extends ShowcaseState {}

class ShowcasesLoadedState extends ShowcaseState {
  ShowcaseList? loadedShowcases;
  ShowcasesLoadedState({required this.loadedShowcases})
      : assert(loadedShowcases != null);
}

class ShowcasesErrorState extends ShowcaseState {}
