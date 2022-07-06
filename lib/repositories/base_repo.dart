import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learn/models/models.dart';
import 'package:http/http.dart' as http;

import '../utils/func.dart';
import '../utils/url.dart';

part 'impl_provider.dart';

class BaseRepository<T extends BaseModel> implements IRepository<T> {
  final T model;
  BaseRepository({required this.model});
  List<T> listProduct = [];
  T? detailProduct;

  @override
  Future<List<T>> getList() async {
    final response = await http.post(
      Uri.parse(UrlConfig.api + 'products?category_id=40&cabang_id=1'),
    );

    final result = await jsonDecode(response.body)['result']
        .map<T>((x) => model.fromJson(x) as T)
        .toList()
      ..shuffle();

    if (response.statusCode != 200) {
      Func.showToastServerError();
    } else {
      if (result.isNotEmpty) {
        listProduct = result;
      } else {
        Func.showToast(msg: 'Data kosong');
      }
    }

    return listProduct;
  }

  @override
  Future<T> getOne(int id) async {
    final response =await http.get(Uri.parse(UrlConfig.api + 'products/detil/$id'));
    debugPrint(response.body);
    final parsed = jsonDecode(response.body)['result'];
    detailProduct = model.fromJson(parsed);
    if (response.statusCode != 200) {
      Func.showToastServerError();
    } else {
      detailProduct;
    }

    return detailProduct!;
  }

  @override
  Future<void> insert(item) {
    throw UnimplementedError();
  }

  @override
  Future<void> remove(int id) {
    return Func.showToast(msg: '${listProduct.elementAt(id)} berhasil di hapus')
        .whenComplete(() {
      listProduct.remove(listProduct.elementAt(id));
    });
  }

  @override
  Future<void> update(int id) {
    throw UnimplementedError();
  }
}
