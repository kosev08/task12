import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_12/bloc/showcase_bloc/showcase_event.dart';
import 'package:task_12/models/showcases.dart';
import 'package:task_12/services/showcase_service/showcase_repository.dart';

import 'showcase_state.dart';

class ShowcaseBloc extends Bloc<ShowcaseEvent, ShowcaseState> {
  final ShowcasesRepository showcaseRepository;

  ShowcaseBloc({required this.showcaseRepository})
      // : assert(showcaseRepository != null),
      : super(ShowcasesEmptyState());
}
