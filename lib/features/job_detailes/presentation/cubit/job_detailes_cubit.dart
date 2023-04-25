import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'job_detailes_state.dart';

class JobDetailesCubit extends Cubit<JobDetailesState> {
  JobDetailesCubit() : super(JobDetailesInitial());
}
