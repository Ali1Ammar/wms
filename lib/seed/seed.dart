import 'package:wms/src/domain/entities/entities.dart';
import 'package:wms/src/infrastructure/db/database.dart';

Future<void> seed(AppDatabase db) async {
  // seed users
  await Future.wait([
    db.driftUserRepo.createUser(User(
      id: 1,
      name: "Ali admin",
      userName: "admin",
      password: "admin",
      role: Role.admin,
    )),
    db.driftUserRepo.createUser(User(
      id: 2,
      name: "Ali officer",
      userName: "officer",
      password: "officer",
      role: Role.officer,
    ))
  ]);

  // seed product
  final products = await Future.wait([
    db.driftProductRepo.createProduct(Product(
      id: 1,
      name: "Product 1",
      basePrice: 100,
      quantity: 10,
    )),
    db.driftProductRepo.createProduct(Product(
      id: 2,
      name: "Product 1",
      basePrice: 100,
      quantity: 10,
    )),
    db.driftProductRepo.createProduct(Product(
      id: 3,
      name: "Product 1",
      basePrice: 100,
      quantity: 10,
    ))
  ]);

  // seed transaction
  await Future.wait([
    db.driftTransactionRepo.createTransaction(Transaction(
      id: 1,
      quantity: 10,
      product: products[0],
      price: 10,
      date: DateTime.now(),
    )),
    db.driftTransactionRepo.createTransaction(Transaction(
      id: 2,
      quantity: 10,
      product: products[0],
      price: 10,
      date: DateTime.now(),
    )),
    db.driftTransactionRepo.createTransaction(Transaction(
      id: 3,
      quantity: 10,
      product: products[0],
      price: 10,
      date: DateTime.now(),
    )),
    db.driftTransactionRepo.createTransaction(Transaction(
      id: 4,
      quantity: 10,
      product: products[0],
      price: 10,
      date: DateTime.now(),
    )),
    for (var i = 1; i < 10000; i++)
      db.driftTransactionRepo.createTransaction(Transaction(
        id: 5 + i,
        quantity: 10,
        product: products[0],
        price: 10,
        date: DateTime.now(),
      )),
  ]);
}

Future<void> deleteAll() async {
  try {
    final dbFile = await getDbFile();
    dbFile.deleteSync();
  } catch (e) {
    //
  }
}
