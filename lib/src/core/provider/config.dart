import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wms/env/env.dart';

final envConfig = Provider((ref) => Env());
