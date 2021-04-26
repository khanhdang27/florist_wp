import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gut7/models/models.dart';
import 'package:gut7/repositories/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial());
  final ProductRepository productRepository = ProductRepository();

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is ProductGetRecom) {
      List<Product> products = await productRepository.getRecom();
      if (true) {
        yield ProductGetRecomSuccess(
          items: products,
        );
      } else {
        yield ProductGetRecomFailed();
      }
    }

    if (event is ProductGetOfCate) {
      List<Product> products = await productRepository.getOfCate(event.categoryId);
      if (true) {
        yield ProductGetOfCateSuccess(
          items: products,
        );
      } else {
        yield ProductGetOfCateFailed();
      }
    }
    if (event is ProductGetOne) {
      Product product = await productRepository.getOne(Id: event.Id);
      if (true) {
        yield ProductGetOneSuccess(
          item: product,
        );
      } else {
        yield ProductGetOneFailed();
      }
    }
  }
}
