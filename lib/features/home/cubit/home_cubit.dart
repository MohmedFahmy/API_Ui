import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:use_api_app/features/home/cubit/stats.dart';

import '../../home data/data/data.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState());

  getDataAPIs() async {
    emit(TestLoadingState());
    var passed = await Data.getData();
    emit(TestPassedState(list: passed));
  }
}
