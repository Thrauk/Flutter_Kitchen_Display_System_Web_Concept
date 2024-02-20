library orders;

import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kds_sample_project/src/features/common/index.dart';
import 'package:kds_sample_project/src/style/index.dart';

part 'data/DTOs/order_dto.dart';
part 'data/DTOs/order_product_dto.dart';
part 'data/DTOs/orders_dto.dart';
part 'data/repository/order_repository.dart';
part 'domain/models/order.dart';
part 'domain/models/order_product.dart';
part 'presentation/blocs/order_bloc/order_bloc.dart';
part 'presentation/blocs/order_bloc/order_event.dart';
part 'presentation/blocs/order_bloc/order_state.dart';
part 'presentation/orders_page.dart';
part 'presentation/widgets/debug_menu/import_by_json_button.dart';
part 'presentation/widgets/order_item/order_action_button.dart';
part 'presentation/widgets/order_item/order_item_header.dart';
part 'presentation/widgets/order_item_widget.dart';
part 'presentation/widgets/order_product_item.dart';
