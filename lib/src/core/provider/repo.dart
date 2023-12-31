import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wms/src/core/provider/db.dart';
import 'package:wms/src/domain/repo/transaction_repo.dart';
import 'package:wms/src/domain/repo/product_repo.dart';
import 'package:wms/src/domain/repo/user_repo.dart';

final productRepoProvider =
    Provider<ProductRepo>((ref) => ref.read(appDbProvider).driftProductRepo);

final transactionRepoProvider = Provider<TransactionRepo>(
    (ref) => ref.read(appDbProvider).driftTransactionRepo);

final userRepoProvider =
    Provider<UserRepo>((ref) => ref.read(appDbProvider).driftUserRepo);
