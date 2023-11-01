// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ProductModelTable extends ProductModel
    with TableInfo<$ProductModelTable, ProductModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _basePriceMeta =
      const VerificationMeta('basePrice');
  @override
  late final GeneratedColumn<int> basePrice = GeneratedColumn<int>(
      'base_price', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _stockMeta = const VerificationMeta('stock');
  @override
  late final GeneratedColumn<int> stock = GeneratedColumn<int>(
      'stock', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, basePrice, stock, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_model';
  @override
  VerificationContext validateIntegrity(Insertable<ProductModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('base_price')) {
      context.handle(_basePriceMeta,
          basePrice.isAcceptableOrUnknown(data['base_price']!, _basePriceMeta));
    }
    if (data.containsKey('stock')) {
      context.handle(
          _stockMeta, stock.isAcceptableOrUnknown(data['stock']!, _stockMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductModelData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      basePrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}base_price']),
      stock: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}stock']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $ProductModelTable createAlias(String alias) {
    return $ProductModelTable(attachedDatabase, alias);
  }
}

class ProductModelData extends DataClass
    implements Insertable<ProductModelData> {
  final int id;
  final String name;
  final int? basePrice;
  final int? stock;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const ProductModelData(
      {required this.id,
      required this.name,
      this.basePrice,
      this.stock,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || basePrice != null) {
      map['base_price'] = Variable<int>(basePrice);
    }
    if (!nullToAbsent || stock != null) {
      map['stock'] = Variable<int>(stock);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  ProductModelCompanion toCompanion(bool nullToAbsent) {
    return ProductModelCompanion(
      id: Value(id),
      name: Value(name),
      basePrice: basePrice == null && nullToAbsent
          ? const Value.absent()
          : Value(basePrice),
      stock:
          stock == null && nullToAbsent ? const Value.absent() : Value(stock),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory ProductModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductModelData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      basePrice: serializer.fromJson<int?>(json['basePrice']),
      stock: serializer.fromJson<int?>(json['stock']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'basePrice': serializer.toJson<int?>(basePrice),
      'stock': serializer.toJson<int?>(stock),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  ProductModelData copyWith(
          {int? id,
          String? name,
          Value<int?> basePrice = const Value.absent(),
          Value<int?> stock = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      ProductModelData(
        id: id ?? this.id,
        name: name ?? this.name,
        basePrice: basePrice.present ? basePrice.value : this.basePrice,
        stock: stock.present ? stock.value : this.stock,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  @override
  String toString() {
    return (StringBuffer('ProductModelData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('basePrice: $basePrice, ')
          ..write('stock: $stock, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, basePrice, stock, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductModelData &&
          other.id == this.id &&
          other.name == this.name &&
          other.basePrice == this.basePrice &&
          other.stock == this.stock &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class ProductModelCompanion extends UpdateCompanion<ProductModelData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int?> basePrice;
  final Value<int?> stock;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const ProductModelCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.basePrice = const Value.absent(),
    this.stock = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  ProductModelCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.basePrice = const Value.absent(),
    this.stock = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
  })  : name = Value(name),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<ProductModelData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? basePrice,
    Expression<int>? stock,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (basePrice != null) 'base_price': basePrice,
      if (stock != null) 'stock': stock,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  ProductModelCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int?>? basePrice,
      Value<int?>? stock,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return ProductModelCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      basePrice: basePrice ?? this.basePrice,
      stock: stock ?? this.stock,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (basePrice.present) {
      map['base_price'] = Variable<int>(basePrice.value);
    }
    if (stock.present) {
      map['stock'] = Variable<int>(stock.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductModelCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('basePrice: $basePrice, ')
          ..write('stock: $stock, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $TransactionModelTable extends TransactionModel
    with TableInfo<$TransactionModelTable, TransactionModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
      'price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, productId, quantity, price, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_model';
  @override
  VerificationContext validateIntegrity(
      Insertable<TransactionModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionModelData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}price'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $TransactionModelTable createAlias(String alias) {
    return $TransactionModelTable(attachedDatabase, alias);
  }
}

class TransactionModelData extends DataClass
    implements Insertable<TransactionModelData> {
  final int id;
  final int productId;
  final int quantity;
  final int price;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const TransactionModelData(
      {required this.id,
      required this.productId,
      required this.quantity,
      required this.price,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<int>(productId);
    map['quantity'] = Variable<int>(quantity);
    map['price'] = Variable<int>(price);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  TransactionModelCompanion toCompanion(bool nullToAbsent) {
    return TransactionModelCompanion(
      id: Value(id),
      productId: Value(productId),
      quantity: Value(quantity),
      price: Value(price),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory TransactionModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionModelData(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<int>(json['productId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      price: serializer.fromJson<int>(json['price']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<int>(productId),
      'quantity': serializer.toJson<int>(quantity),
      'price': serializer.toJson<int>(price),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  TransactionModelData copyWith(
          {int? id,
          int? productId,
          int? quantity,
          int? price,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      TransactionModelData(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  @override
  String toString() {
    return (StringBuffer('TransactionModelData(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, productId, quantity, price, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionModelData &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.quantity == this.quantity &&
          other.price == this.price &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class TransactionModelCompanion extends UpdateCompanion<TransactionModelData> {
  final Value<int> id;
  final Value<int> productId;
  final Value<int> quantity;
  final Value<int> price;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const TransactionModelCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.price = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  TransactionModelCompanion.insert({
    this.id = const Value.absent(),
    required int productId,
    required int quantity,
    required int price,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
  })  : productId = Value(productId),
        quantity = Value(quantity),
        price = Value(price),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<TransactionModelData> custom({
    Expression<int>? id,
    Expression<int>? productId,
    Expression<int>? quantity,
    Expression<int>? price,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (quantity != null) 'quantity': quantity,
      if (price != null) 'price': price,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  TransactionModelCompanion copyWith(
      {Value<int>? id,
      Value<int>? productId,
      Value<int>? quantity,
      Value<int>? price,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return TransactionModelCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionModelCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $UserModelTable extends UserModel
    with TableInfo<$UserModelTable, UserModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userNameMeta =
      const VerificationMeta('userName');
  @override
  late final GeneratedColumn<String> userName = GeneratedColumn<String>(
      'user_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumnWithTypeConverter<Role, String> role =
      GeneratedColumn<String>('role', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Role>($UserModelTable.$converterrole);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, userName, password, role, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_model';
  @override
  VerificationContext validateIntegrity(Insertable<UserModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta));
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    context.handle(_roleMeta, const VerificationResult.success());
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserModelData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      userName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_name'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      role: $UserModelTable.$converterrole.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role'])!),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $UserModelTable createAlias(String alias) {
    return $UserModelTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Role, String, String> $converterrole =
      const EnumNameConverter<Role>(Role.values);
}

class UserModelData extends DataClass implements Insertable<UserModelData> {
  final int id;
  final String name;
  final String userName;
  final String password;
  final Role role;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const UserModelData(
      {required this.id,
      required this.name,
      required this.userName,
      required this.password,
      required this.role,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['user_name'] = Variable<String>(userName);
    map['password'] = Variable<String>(password);
    {
      final converter = $UserModelTable.$converterrole;
      map['role'] = Variable<String>(converter.toSql(role));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  UserModelCompanion toCompanion(bool nullToAbsent) {
    return UserModelCompanion(
      id: Value(id),
      name: Value(name),
      userName: Value(userName),
      password: Value(password),
      role: Value(role),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory UserModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserModelData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      userName: serializer.fromJson<String>(json['userName']),
      password: serializer.fromJson<String>(json['password']),
      role: $UserModelTable.$converterrole
          .fromJson(serializer.fromJson<String>(json['role'])),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'userName': serializer.toJson<String>(userName),
      'password': serializer.toJson<String>(password),
      'role': serializer
          .toJson<String>($UserModelTable.$converterrole.toJson(role)),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  UserModelData copyWith(
          {int? id,
          String? name,
          String? userName,
          String? password,
          Role? role,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      UserModelData(
        id: id ?? this.id,
        name: name ?? this.name,
        userName: userName ?? this.userName,
        password: password ?? this.password,
        role: role ?? this.role,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  @override
  String toString() {
    return (StringBuffer('UserModelData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('userName: $userName, ')
          ..write('password: $password, ')
          ..write('role: $role, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, userName, password, role, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModelData &&
          other.id == this.id &&
          other.name == this.name &&
          other.userName == this.userName &&
          other.password == this.password &&
          other.role == this.role &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class UserModelCompanion extends UpdateCompanion<UserModelData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> userName;
  final Value<String> password;
  final Value<Role> role;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const UserModelCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.userName = const Value.absent(),
    this.password = const Value.absent(),
    this.role = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  UserModelCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String userName,
    required String password,
    required Role role,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
  })  : name = Value(name),
        userName = Value(userName),
        password = Value(password),
        role = Value(role),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<UserModelData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? userName,
    Expression<String>? password,
    Expression<String>? role,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (userName != null) 'user_name': userName,
      if (password != null) 'password': password,
      if (role != null) 'role': role,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  UserModelCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? userName,
      Value<String>? password,
      Value<Role>? role,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return UserModelCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (role.present) {
      final converter = $UserModelTable.$converterrole;

      map['role'] = Variable<String>(converter.toSql(role.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserModelCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('userName: $userName, ')
          ..write('password: $password, ')
          ..write('role: $role, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $ProductModelTable productModel = $ProductModelTable(this);
  late final $TransactionModelTable transactionModel =
      $TransactionModelTable(this);
  late final $UserModelTable userModel = $UserModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [productModel, transactionModel, userModel];
}
