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


/** This is an auto generated class representing the CustomerAddress type in your schema. */
@immutable
class CustomerAddress extends Model {
  static const classType = const _CustomerAddressModelType();
  final String id;
  final String? _street;
  final String? _city;
  final String? _state;
  final String? _zip;
  final String? _owner;
  final Customer? _customer;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get street {
    try {
      return _street!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get city {
    try {
      return _city!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get state {
    try {
      return _state!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get zip {
    try {
      return _zip!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get owner {
    return _owner;
  }
  
  Customer? get customer {
    return _customer;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const CustomerAddress._internal({required this.id, required street, required city, required state, required zip, owner, customer, createdAt, updatedAt}): _street = street, _city = city, _state = state, _zip = zip, _owner = owner, _customer = customer, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory CustomerAddress({String? id, required String street, required String city, required String state, required String zip, String? owner, Customer? customer}) {
    return CustomerAddress._internal(
      id: id == null ? UUID.getUUID() : id,
      street: street,
      city: city,
      state: state,
      zip: zip,
      owner: owner,
      customer: customer);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CustomerAddress &&
      id == other.id &&
      _street == other._street &&
      _city == other._city &&
      _state == other._state &&
      _zip == other._zip &&
      _owner == other._owner &&
      _customer == other._customer;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("CustomerAddress {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("street=" + "$_street" + ", ");
    buffer.write("city=" + "$_city" + ", ");
    buffer.write("state=" + "$_state" + ", ");
    buffer.write("zip=" + "$_zip" + ", ");
    buffer.write("owner=" + "$_owner" + ", ");
    buffer.write("customer=" + (_customer != null ? _customer!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  CustomerAddress copyWith({String? id, String? street, String? city, String? state, String? zip, String? owner, Customer? customer}) {
    return CustomerAddress._internal(
      id: id ?? this.id,
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      zip: zip ?? this.zip,
      owner: owner ?? this.owner,
      customer: customer ?? this.customer);
  }
  
  CustomerAddress.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _street = json['street'],
      _city = json['city'],
      _state = json['state'],
      _zip = json['zip'],
      _owner = json['owner'],
      _customer = json['customer']?['serializedData'] != null
        ? Customer.fromJson(new Map<String, dynamic>.from(json['customer']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'street': _street, 'city': _city, 'state': _state, 'zip': _zip, 'owner': _owner, 'customer': _customer?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'street': _street, 'city': _city, 'state': _state, 'zip': _zip, 'owner': _owner, 'customer': _customer, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField STREET = QueryField(fieldName: "street");
  static final QueryField CITY = QueryField(fieldName: "city");
  static final QueryField STATE = QueryField(fieldName: "state");
  static final QueryField ZIP = QueryField(fieldName: "zip");
  static final QueryField OWNER = QueryField(fieldName: "owner");
  static final QueryField CUSTOMER = QueryField(
    fieldName: "customer",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Customer).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "CustomerAddress";
    modelSchemaDefinition.pluralName = "CustomerAddresses";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: AuthRuleProvider.USERPOOLS,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CustomerAddress.STREET,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CustomerAddress.CITY,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CustomerAddress.STATE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CustomerAddress.ZIP,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CustomerAddress.OWNER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: CustomerAddress.CUSTOMER,
      isRequired: false,
      targetName: "customerCustomeraddressId",
      ofModelName: (Customer).toString()
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

class _CustomerAddressModelType extends ModelType<CustomerAddress> {
  const _CustomerAddressModelType();
  
  @override
  CustomerAddress fromJson(Map<String, dynamic> jsonData) {
    return CustomerAddress.fromJson(jsonData);
  }
}