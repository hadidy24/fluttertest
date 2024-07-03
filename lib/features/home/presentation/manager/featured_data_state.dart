part of 'featured_data_cubit.dart';

abstract class FeatureddatasState extends Equatable {
  const FeatureddatasState();
}

class FeatureddatasInitial extends FeatureddatasState {
  @override
  List<Object> get props => [];
}

class FeatureddatasLoading extends FeatureddatasState {
  @override
  List<Object> get props => [];
}

class FeatureddatasFailure extends FeatureddatasState {
  final String errMessage;

  const FeatureddatasFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

class FeatureddatasSuccess extends FeatureddatasState {
  final List<DataModels> datas;
  const FeatureddatasSuccess(this.datas);
  @override
  List<Object> get props => [datas];
}
