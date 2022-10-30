/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Order type in your schema. */
@immutable
class Order extends Model {
  static const classType = const _OrderModelType();
  final String id;
  final String? _customerID;
  final Customer? _customer;
  final Restaurant? _restaurant;
  final List<OrderItem>? _orderitems;
  final double? _ordertotal;
  final OrderStatus? _orderstatus;
  final String? _driver;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get customerID {
    return _customerID;
  }
  
  Customer? get customer {
    return _customer;
  }
  
  Restaurant? get restaurant {
    return _restaurant;
  }
  
  List<OrderItem>? get orderitems {
    return _orderitems;
  }
  
  double? get ordertotal {
    return _ordertotal;
  }
  
  OrderStatus? get orderstatus {
    return _orderstatus;
  }
  
  String? get driver {
    return _driver;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Order._internal({required this.id, customerID, customer, restaurant, orderitems, ordertotal, orderstatus, driver, createdAt, updatedAt}): _customerID = customerID, _customer = customer, _restaurant = restaurant, _orderitems = orderitems, _ordertotal = ordertotal, _orderstatus = orderstatus, _driver = driver, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Order({String? id, String? customerID, Customer? customer, Restaurant? restaurant, List<OrderItem>? orderitems, double? ordertotal, OrderStatus? orderstatus, String? driver}) {
    return Order._internal(
      id: id == null ? UUID.getUUID() : id,
      customerID: customerID,
      customer: customer,
      restaurant: restaurant,
      orderitems: orderitems != null ? List<OrderItem>.unmodifiable(orderitems) : orderitems,
      ordertotal: ordertotal,
      orderstatus: orderstatus,
      driver: driver);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Order &&
      id == other.id &&
      _customerID == other._customerID &&
      _customer == other._customer &&
      _restaurant == other._restaurant &&
      DeepCollectionEquality().equals(_orderitems, other._orderitems) &&
      _ordertotal == other._ordertotal &&
      _orderstatus == other._orderstatus &&
      _driver == other._driver;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Order {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("customerID=" + "$_customerID" + ", ");
    buffer.write("customer=" + (_customer != null ? _customer!.toString() : "null") + ", ");
    buffer.write("restaurant=" + (_restaurant != null ? _restaurant!.toString() : "null") + ", ");
    buffer.write("ordertotal=" + (_ordertotal != null ? _ordertotal!.toString() : "null") + ", ");
    buffer.write("orderstatus=" + (_orderstatus != null ? enumToString(_orderstatus)! : "null") + ", ");
    buffer.write("driver=" + "$_driver" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Order copyWith({String? id, String? customerID, Customer? customer, Restaurant? restaurant, List<OrderItem>? orderitems, double? ordertotal, OrderStatus? orderstatus, String? driver}) {
    return Order._internal(
      id: id ?? this.id,
      customerID: customerID ?? this.customerID,
      customer: customer ?? this.customer,
      restaurant: restaurant ?? this.restaurant,
      orderitems: orderitems ?? this.orderitems,
      ordertotal: ordertotal ?? this.ordertotal,
      orderstatus: orderstatus ?? this.orderstatus,
      driver: driver ?? this.driver);
  }
  
  Order.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _customerID = json['customerID'],
      _customer = json['customer']?['serializedData'] != null
        ? Customer.fromJson(new Map<String, dynamic>.from(json['customer']['serializedData']))
        : null,
      _restaurant = json['restaurant']?['serializedData'] != null
        ? Restaurant.fromJson(new Map<String, dynamic>.from(json['restaurant']['serializedData']))
        : null,
      _orderitems = json['orderitems'] is List
        ? (json['orderitems'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => OrderItem.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _ordertotal = (json['ordertotal'] as num?)?.toDouble(),
      _orderstatus = enumFromString<OrderStatus>(json['orderstatus'], OrderStatus.values),
      _driver = json['driver'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'customerID': _customerID, 'customer': _customer?.toJson(), 'restaurant': _restaurant?.toJson(), 'orderitems': _orderitems?.map((OrderItem? e) => e?.toJson()).toList(), 'ordertotal': _ordertotal, 'orderstatus': enumToString(_orderstatus), 'driver': _driver, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'customerID': _customerID, 'customer': _customer, 'restaurant': _restaurant, 'orderitems': _orderitems, 'ordertotal': _ordertotal, 'orderstatus': _orderstatus, 'driver': _driver, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField CUSTOMERID = QueryField(fieldName: "customerID");
  static final QueryField CUSTOMER = QueryField(
    fieldName: "customer",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Customer).toString()));
  static final QueryField RESTAURANT = QueryField(
    fieldName: "restaurant",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Restaurant).toString()));
  static final QueryField ORDERITEMS = QueryField(
    fieldName: "orderitems",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (OrderItem).toString()));
  static final QueryField ORDERTOTAL = QueryField(fieldName: "ordertotal");
  static final QueryField ORDERSTATUS = QueryField(fieldName: "orderstatus");
  static final QueryField DRIVER = QueryField(fieldName: "driver");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Order";
    modelSchemaDefinition.pluralName = "Orders";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.OWNER,
        ownerField: "customerID",
        identityClaim: "cognito:username",
        provider: AuthRuleProvider.USERPOOLS,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.READ,
          ModelOperation.UPDATE
        ]),
      AuthRule(
        authStrategy: AuthStrategy.OWNER,
        ownerField: "driver",
        identityClaim: "cognito:username",
        provider: AuthRuleProvider.USERPOOLS,
        operations: [
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Order.CUSTOMERID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Order.CUSTOMER,
      isRequired: false,
      targetName: "customerOrdersId",
      ofModelName: (Customer).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Order.RESTAURANT,
      isRequired: false,
      targetName: "restaurantOrderId",
      ofModelName: (Restaurant).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Order.ORDERITEMS,
      isRequired: false,
      ofModelName: (OrderItem).toString(),
      associatedKey: OrderItem.ORDER
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Order.ORDERTOTAL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Order.ORDERSTATUS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Order.DRIVER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _OrderModelType extends ModelType<Order> {
  const _OrderModelType();
  
  @override
  Order fromJson(Map<String, dynamic> jsonData) {
    return Order.fromJson(jsonData);
  }
}