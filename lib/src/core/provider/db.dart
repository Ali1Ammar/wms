import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wms/src/infrastructure/db/database.dart';

final baseDbProvider = Provider((ref) => openConnection());

final appDbProvider = Provider((ref) => AppDatabase(ref.read(baseDbProvider)));
