import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/features/home/data/models/data_models.dart';
import 'package:fluttertest/features/home/data/repos/home_repo.dart';

part 'featured_data_state.dart';

class FeatureddatasCubit extends Cubit<FeatureddatasState> {
  FeatureddatasCubit(this.homeRepo) : super(FeatureddatasInitial());
  final HomeRepo homeRepo;
  Future<void> fetchFeatureddatas() async {
    //  emit(FeatureddatasLoading());
    debugPrint('fetching data');
    var result = await homeRepo.fetchData();
    result.fold((failure) {
      emit(FeatureddatasFailure(errMessage: failure.errMessage));
      debugPrint('fetching failed');
    }, (books) {
      debugPrint('fetching success');
      emit(FeatureddatasSuccess(books));
    });
  }
}
