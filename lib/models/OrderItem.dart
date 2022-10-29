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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the OrderItem type in your schema. */
@immutable
class OrderItem extends Model {
  static const classType = const _OrderItemModelType();
  final String id;
  final int? _quantity;
  final String? _customerID;
  final Order? _order;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  int? get quantity {
    return _quantity;
  }
  
  String? get customerID {
    return _customerID;
  }
  
  Order? get order {
    return _order;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const OrderItem._internal({required this.id, quantity, customerID, order, createdAt, updatedAt}): _quantity = quantity, _customerID = customerID, _order = order, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory OrderItem({String? id, int? quantity, String? customerID, Order? order}) {
    return OrderItem._internal(
      id: id == null ? UUID.getUUID() : id,
      quantity: quantity,
      customerID: customerID,
      order: order);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderItem &&
      id == other.id &&
      _quantity == other._quantity &&
      _customerID == other._customerID &&
      _order == other._order;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("OrderItem {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("quantity=" + (_quantity != null ? _quantity!.toString() : "null") + ", ");
    buffer.write("customerID=" + "$_customerID" + ", ");
    buffer.write("order=" + (_order != null ? _order!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  OrderItem copyWith({String? id, int? quantity, String? customerID, Order? order}) {
    return OrderItem._internal(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      customerID: customerID ?? this.customerID,
      order: order ?? this.order);
  }
  
  OrderItem.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _quantity = (json['quantity'] as num?)?.toInt(),
      _customerID = json['customerID'],
      _order = json['order']?['serializedData'] != null
        ? Order.fromJson(new Map<String, dynamic>.from(json['order']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'quantity': _quantity, 'customerID': _customerID, 'order': _order?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'quantity': _quantity, 'customerID': _customerID, 'order': _order, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField QUANTITY = QueryField(fieldName: "quantity");
  static final QueryField CUSTOMERID = QueryField(fieldName: "customerID");
  static final QueryField ORDER = QueryField(
    fieldName: "order",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Order).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "OrderItem";
    modelSchemaDefinition.pluralName = "OrderItems";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.OWNER,
        ownerField: "customerID",
        identityClaim: "cognito:username",
        provider: AuthRuleProvider.USERPOOLS,
        operations: [
          ModelOperation.CREATE
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderItem.QUANTITY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderItem.CUSTOMERID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: OrderItem.ORDER,
      isRequired: false,
      targetName: "orderOrderitemsId",
      ofModelName: (Order).toString()
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

class _OrderItemModelType extends ModelType<OrderItem> {
  const _OrderItemModelType();
  
  @override
  OrderItem fromJson(Map<String, dynamic> jsonData) {
    return OrderItem.fromJson(jsonData);
  }
}