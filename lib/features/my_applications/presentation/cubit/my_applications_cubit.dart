import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_applications_state.dart';

class MyApplicationsCubit extends Cubit<MyApplicationsState> {
  MyApplicationsCubit() : super(MyApplicationsInitial());
}
