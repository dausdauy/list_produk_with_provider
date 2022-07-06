import './base_model.dart';

class ProductDetailModel extends BaseModel {
  ProductDetailModel({
    this.id,
    this.categoryId,
    this.uomId,
    this.brandId,
    this.name,
    this.description,
    this.condition,
    this.priceBeforeDiscount,
    this.discount,
    this.price,
    this.stock,
    this.defaultImage,
    this.uomName,
    this.brandName,
    this.categoryName,
    this.images,
  });

  int? id;
  int? categoryId;
  int? uomId;
  int? brandId;
  String? name;
  String? description;
  String? condition;
  int? priceBeforeDiscount;
  int? discount;
  int? price;
  int? stock;
  String? defaultImage;
  String? uomName;
  String? brandName;
  String? categoryName;
  List<String>? images;

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "uom_id": uomId,
        "brand_id": brandId,
        "name": name,
        "description": description,
        "condition": condition,
        "price_before_discount": priceBeforeDiscount,
        "discount": discount,
        "price": price,
        "stock": stock,
        "default_image": defaultImage,
        "uom_name": uomName,
        "brand_name": brandName,
        "category_name": categoryName,
        "images": List<String>.from(images!.map((x) => x)),
      };

  @override
  BaseModel fromJson(Map<String, dynamic> json) => ProductDetailModel(
        id: json["id"],
        categoryId: json["category_id"],
        uomId: json["uom_id"],
        brandId: json["brand_id"],
        name: json["name"],
        description: json["description"],
        condition: json["condition"],
        priceBeforeDiscount: json["price_before_discount"],
        discount: json["discount"],
        price: json["price"],
        stock: json["stock"],
        defaultImage: json["default_image"],
        uomName: json["uom_name"],
        brandName: json["brand_name"],
        categoryName: json["category_name"],
        images: List<String>.from(json["images"].map((x) => x)),
      );
}
