import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../modules/transactions/model/transactions_model.dart';

class UserTransactionsState extends StateNotifier<List<TransactionsModel>> {
  UserTransactionsState() : super(const []);

  static final movementsprovider =
      StateNotifierProvider<UserTransactionsState, List<TransactionsModel>>(
    (ref) => UserTransactionsState(),
  );

  void addNewTransaction(TransactionsModel newTransaction) {
    state = [...state, newTransaction];
  }
}
