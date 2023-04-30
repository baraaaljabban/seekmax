import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_applications_state.dart';

class MyApplicationsCubit extends Cubit<MyApplicationsState> {
  MyApplicationsCubit() : super(MyApplicationsInitial());
}
