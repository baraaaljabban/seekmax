import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'available_jobs_state.dart';

class AvailableJobsCubit extends Cubit<AvailableJobsState> {
  AvailableJobsCubit() : super(AvailableJobsInitial());
}
