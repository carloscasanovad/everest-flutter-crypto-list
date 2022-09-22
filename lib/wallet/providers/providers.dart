import 'package:hooks_riverpod/hooks_riverpod.dart';

final visibilityProvider = StateProvider<bool>(
  (ref) => true,
);
final userBalanceProvider = StateProvider<int>(
  (ref) => 0,
);
