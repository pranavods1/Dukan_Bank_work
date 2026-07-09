// lib/features/home/presentation/controller/bottom_nav_notifier.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_nav_notifier.g.dart';

@riverpod
class BottomNavIndex extends _$BottomNavIndex {
  @override
  int build() => 0; // ഡിഫോൾട്ട് ഇൻഡെക്സ് 0 (Home Page)

  // ടാബ് ഇൻഡെക്സ് മാറ്റാൻ ഈ ഫംഗ്ഷൻ ഉപയോഗിക്കാം
  void setIndex(int index) {
    state = index;
  }
}
