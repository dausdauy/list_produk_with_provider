import './base_model.dart';

class ProductModel extends BaseModel {
  ProductModel({
    this.id,
    this.categoryId,
    this.uomId,
    this.brandId,
    this.productType,
    this.name,
    this.description,
    this.condition,
    this.pk,
    this.price,
    this.stock,
    this.isActive,
    this.defaultImage,
    this.discount,
    this.cabangId,
    this.priceBeforeDiscount,
  });

  int? id;
  int? categoryId;
  int? uomId;
  int? brandId;
  String? productType;
  String? name;
  String? description;
  String? condition;
  dynamic pk;
  int? price;
  int? stock;
  int? isActive;
  String? defaultImage;
  int? discount;
  int? cabangId;
  int? priceBeforeDiscount;

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "uom_id": uomId,
        "brand_id": brandId,
        "product_type": productType,
        "name": name,
        "description": description,
        "condition": condition,
        "pk": pk,
        "price": price,
        "stock": stock,
        "is_active": isActive,
        "default_image": defaultImage,
        "discount": discount,
        "cabang_id": cabangId,
        "price_before_discount": priceBeforeDiscount,
      };

  @override
  BaseModel fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        categoryId: json["category_id"],
        uomId: json["uom_id"],
        brandId: json["brand_id"],
        productType: json["product_type"],
        name: json["name"],
        description: json["description"],
        condition: json["condition"],
        pk: json["pk"],
        price: json["price"],
        stock: json["stock"],
        isActive: json["is_active"],
        defaultImage: json["default_image"],
        discount: json["discount"],
        cabangId: json["cabang_id"],
        priceBeforeDiscount: json["price_before_discount"],
      );
}
