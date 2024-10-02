import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:workshop_manager/Core/network/error/failure.dart';
import 'package:workshop_manager/Feature/add_workshop/data/model/workshop_model.dart';
import 'package:workshop_manager/Feature/add_workshop/data/source/base/add_workshop_source.dart';
import 'package:workshop_manager/Feature/add_workshop/domain/respo/add_workshop_repo.dart';

class AddWorkshopRepoImol implements AddWorkshopRepo {
  final AddWorkshopSource source;

  AddWorkshopRepoImol(this.source);
  @override
  Future<Either<Failure, WorkshopModel>> addWorkshop({
    required File logo,
    required String name,
    required String address,
    required String geoLat,
    required String geolng,
    required String phone,
    required String arDescritption,
    required String enDescritption,
    required String capacity,
    required String govesId,
    required String districId,
    required List brands,
    required List<Map<String, dynamic>> days,
  }) async {
    try {
      final response = await source.addWorkshop(
          logo: logo,
          name: name,
          address: address,
          geoLat: geoLat,
          geolng: geolng,
          phone: phone,
          arDescritption: arDescritption,
          enDescritption: enDescritption,
          capacity: capacity,
          govesId: govesId,
          districId: districId,
          brands: brands,
          days: days);
      if (!(response['success'] as bool)) {
        //  return Left(ServerFailure(response['message'] as String));
      }
      return Right(WorkshopModel.fromJson(response['data']));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
