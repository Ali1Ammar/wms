import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wms/src/core/provider/db.dart';
import 'package:wms/src/domain/repo/Transaction_repo.dart';
import 'package:wms/src/domain/repo/product_repo.dart';

final productRepoProvider =
    Provider<ProductRepo>((ref) => ref.read(appDbProvider).driftProductRepo);

final transactionRepoProvider = Provider<TransactionRepo>(
    (ref) => ref.read(appDbProvider).driftTransactionRepo);
