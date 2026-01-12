import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/database/database.dart';

part 'database_provider.g.dart';

@Riverpod(keepAlive: true)
AppDatabase database(Ref ref) {
  return AppDatabase();
}
