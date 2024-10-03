import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:workshop_manager/Feature/add_workshop/data/model/workshop_model.dart';
import 'package:workshop_manager/Feature/add_workshop/domain/respo/add_workshop_repo.dart';
import 'package:workshop_manager/Feature/goves_and_district/data/models/goves_and_district_model.dart';
import 'package:workshop_manager/Feature/workshop_car_brands/data/model/workshop_car_brands_model.dart';
part 'add_work_shop_state.dart';

class AddWorkShopCubit extends Cubit<AddWorkShopState> {
  final AddWorkshopRepo repo;
  AddWorkShopCubit(this.repo) : super(AddWorkShopInitial());

//! Controllers
  TextEditingController workshopNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneOneController = TextEditingController();
  TextEditingController phonetwoController = TextEditingController();
  TextEditingController arDescritptionController = TextEditingController();
  TextEditingController enDescritptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  //! Picker
  ImagePicker picker = ImagePicker();
  File? logo;

  //! Lists
  List<GovesAndDistrict>? goves;
  List<WorkshopCarBrand>? brand;
  List<Map<String, dynamic>>? days;
  String capacityNumber = "1";

  //! Location
  // LocationData? currentLocation;
  // String? locationString;
  Future<void> addWorkshop() async {
    emit(AddWorkShopLoaddingState());
    try {
      final result = await repo.addWorkshop(
        logo: logo!,
        name: workshopNameController.text,
        address: addressController.text,
        geoLat: "30.104732",
        geolng: "31.378030",
        phone: phoneOneController.text,
        arDescritption: arDescritptionController.text,
        enDescritption: enDescritptionController.text,
        capacity: capacityNumber,
        govesId: goves!.map((e) => e.id).toString(),
        districId: goves!.map((e) => e.children!.map((e) => e.id)).toString(),
        brands: brand!.map((e) => e.id).toList(),
        days: days!,
      );
      result.fold((failure) => emit(AddWorkShopFailureState(failure.message)),
          (result) => emit(AddWorkShopSuccessState(result)));
    } catch (e) {}
  }

  //! Image Picker
  Future<void> logoPicker(ImageSource source) async {
    try {
      final pick = await picker.pickImage(source: source);
      if (pick != null) {
        logo = File(pick.path);
        emit(ImagePickerSuccessState(logo!));
      }
    } catch (e) {
      rethrow;
    }
  }

  //! Capacity
  void changeCapacityNumber(String? newValue) {
    capacityNumber = newValue!;
  }

  //! Get Device Location
  // Future<void> getCuruntLocation() async {
  //   var location = Location();

  //   try {
  //     var userLocation = await location.getLocation();

  //     currentLocation = userLocation;
  //     updateLocationString(userLocation.latitude!, userLocation.longitude!);
  //     marker.add(Marker(
  //       point: LatLng(
  //         userLocation.latitude!,
  //         userLocation.longitude!,
  //       ),
  //       child: const Icon(
  //         Icons.location_on_outlined,
  //         size: 30,
  //         color: AppColors.black,
  //       ),
  //       height: 80,
  //       width: 80,
  //     ));
  //     emit(ChangeLocationMarkerOnMap());
  //   } on Exception {
  //     currentLocation = null;
  //     emit(ChangeLocationMarkerFailureOnMap());
  //   }

  //   location.onLocationChanged.listen((locate.LocationData newLocation) {
  //     newLocation = currentLocation!;
  //     updateLocationString(newLocation.latitude!, newLocation.longitude!);
  //     emit(ChangeLocationToNewLocation());
  //   });
  // }

  // Future<void> updateLocationString(double latitude, double longitude) async {
  //   try {
  //     List<Placemark> placemarks =
  //         await placemarkFromCoordinates(latitude, longitude);
  //     if (placemarks.isNotEmpty) {
  //       final placemark = placemarks.first;

  //       locationString =
  //           '${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}';
  //       emit(ChangeCurrentLocationToStringSuccessState());
  //     } else {
  //       locationString = 'Address not found.';
  //       emit(ChangeCurrentLocationToStringFailureState());
  //     }
  //   } catch (e) {
  //     locationString = 'Unable to get address.';
  //     emit(ChangeCurrentLocationToStringFailureState());
  //   }
  // }
}
