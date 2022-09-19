import 'package:hooks_riverpod/hooks_riverpod.dart';

final chartIndexTappedProvider = StateProvider<int>(
  (ref) => 0,
);
final chartDayProvider = StateProvider<String>(
  (ref) => '5',
);
