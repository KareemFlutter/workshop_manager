part of 'goves_and_district_cubit.dart';

sealed class GovesAndDistrictState extends Equatable {
  const GovesAndDistrictState();

  @override
  List<Object> get props => [];
}

final class GovesAndDistrictInitial extends GovesAndDistrictState {}

final class GovesAndDistrictLoadingState extends GovesAndDistrictState {}

final class GovesAndDistrictSuccessState extends GovesAndDistrictState {
  final List<GovesAndDistrict> model;

  const GovesAndDistrictSuccessState(this.model);
}

final class GovesAndDistrictFailureState extends GovesAndDistrictState {
  final String message;

  const GovesAndDistrictFailureState(this.message);
}
