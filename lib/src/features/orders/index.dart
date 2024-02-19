library orders;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'data/DTOs/order_dto.dart';
part 'data/DTOs/order_product_dto.dart';
part 'data/DTOs/orders_dto.dart';
part 'data/repository/order_repository.dart';
part 'domain/models/order.dart';
part 'domain/models/order_product.dart';
part 'presentation/orders_page.dart';
part 'presentation/widgets/order_item_widget.dart';
part 'presentation/widgets/order_product_item.dart';