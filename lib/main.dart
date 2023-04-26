import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seekmax/core/bloc/app_bloc_observer.dart';
import 'package:seekmax/core/bloc/base_bloc_provider.dart';
import 'package:seekmax/core/dependency_registrar/dependencies.dart';

import 'features/app/presentation/pages/app_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppBlocObserver();
  await slInit();

  runApp(const BaseBlocProviderWidget(child: AppPage()));
}
