import 'package:hooks_riverpod/hooks_riverpod.dart';

final cryptoFilterProvider = StateProvider<String>(
  (ref) => '',
);
final navBarIndexProvider = StateProvider<int>(
  (ref) => 0,
);
