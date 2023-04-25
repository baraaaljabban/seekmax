import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'available_jobs_state.dart';

class AvailableJobsCubit extends Cubit<AvailableJobsState> {
  AvailableJobsCubit() : super(AvailableJobsInitial());
}
