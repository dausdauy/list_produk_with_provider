import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';
import '../repositories/base_repo.dart';

typedef Products<S> = Future<void>;

class ProductProvider with ChangeNotifier {
  final products = BaseRepository<ProductModel>(model: ProductModel());
  final productDetail = BaseRepository<ProductDetailModel>(model: ProductDetailModel());
  List<ProductModel> dataProduct = <ProductModel>[];
  ProductDetailModel? detailProduct;

  Products getList() => products.getList().then((value) {
        dataProduct = value;
        notifyListeners();
      });

  Products getOne(int id) => productDetail.getOne(id).then((value) {
        detailProduct = value;
        notifyListeners();
      });
}
