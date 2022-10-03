import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../modules/transactions/model/transactions_model.dart';

final movementsProvider = StateProvider<List<TransactionsModel>>(
  (ref) => [],
);
