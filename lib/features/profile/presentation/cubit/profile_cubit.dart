import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:seekmax/features/profile/domain/usecases/logout.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final Logout logout;
  ProfileCubit({
    required this.logout,
  }) : super(ProfileInitial());

  void onLogout() async {
    await logout();
    emit(ProfileLogoutState());
  }
}
