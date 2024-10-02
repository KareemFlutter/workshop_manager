part of 'workshop_car_brand_cubit.dart';

sealed class WorkshopCarBrandState extends Equatable {
  const WorkshopCarBrandState();

  @override
  List<Object> get props => [];
}

final class WorkshopCarBrandInitial extends WorkshopCarBrandState {}

final class WorkshopCarBrandLoadingState extends WorkshopCarBrandState {}

final class WorkshopCarBrandSuccessState extends WorkshopCarBrandState {
  final List<WorkshopCarBrand> model;

  const WorkshopCarBrandSuccessState(this.model);
}

final class WorkshopCarBrandFailure extends WorkshopCarBrandState {
  final String message;

  const WorkshopCarBrandFailure(this.message);
}
