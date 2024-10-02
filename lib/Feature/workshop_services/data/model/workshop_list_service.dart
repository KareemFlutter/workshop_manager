import "package:equatable/equatable.dart";
import "package:workshop_manager/Feature/workshop_services/data/model/workshop_list_service_media.dart";

class WorkshopListService with EquatableMixin {
  int id;
  String? createdAt;
  String? updatedAt;
  String type;
  int isMainService;
  int requireCarBrand;
  String enName;
  String enDescription;
  String arName;
  String arDescription;
  int isActive;
  int? parentId;
  String? serviceImage;
  List<dynamic> subCategory;
  List<WorkshopListServiceMedia> media;

  WorkshopListService({
    required this.id,
    this.createdAt,
    this.updatedAt,
    required this.type,
    required this.isMainService,
    required this.requireCarBrand,
    required this.enName,
    required this.enDescription,
    required this.arName,
    required this.arDescription,
    required this.isActive,
    this.parentId,
    this.serviceImage,
    required this.subCategory,
    required this.media,
  });

  factory WorkshopListService.fromJson(Map<String, dynamic> json) {
    return WorkshopListService(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      type: json['type'],
      isMainService: json['is_main_service'],
      requireCarBrand: json['require_car_brand'],
      enName: json['en_name'],
      enDescription: json['en_description'],
      arName: json['ar_name'],
      arDescription: json['ar_description'],
      isActive: json['is_active'],
      parentId: json['parent_id'],
      serviceImage: json['service_image'],
      subCategory: List<dynamic>.from(json['sub_category']),
      media: List<WorkshopListServiceMedia>.from(
          json['media'].map((x) => WorkshopListServiceMedia.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        type,
        isMainService,
        requireCarBrand,
        enName,
        enDescription,
        arName,
        arDescription,
        isActive,
        parentId,
        serviceImage,
        subCategory,
        media
      ];
}
