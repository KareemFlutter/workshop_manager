import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workshop_manager/Feature/workshop_car_brands/data/model/workshop_car_brands_model.dart';
import 'package:workshop_manager/Feature/workshop_car_brands/domian/repo/workshop_car_brand_repo.dart';

part 'workshop_car_brand_state.dart';

class WorkshopCarBrandCubit extends Cubit<WorkshopCarBrandState> {
  final WorkshopCarBrandRepo repo;
  WorkshopCarBrandCubit(this.repo) : super(WorkshopCarBrandInitial());
  Future<void> workshopBrand() async {
    emit(WorkshopCarBrandLoadingState());

    final result = await repo.workshopBrand();
    result.fold(
      (failure) {
        emit(WorkshopCarBrandFailure(failure.message));
      },
      (service) {
        emit(WorkshopCarBrandSuccessState(service));
      },
    );
  }
}
