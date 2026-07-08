// lib/core/widgets/common_loader.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonLoader<T> extends StatelessWidget {
  final AsyncValue<T> state;
  final Widget Function(T data) onData;

  const CommonLoader({
    required this.state,
    required this.onData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // റിവർപോഡ് സ്റ്റേറ്റ് അനുസരിച്ച് കോമൺ ആയി ലോഡിങ് കാണിക്കുന്നു
    return state.when(
      loading: () => const Center(
        child: CircularProgressIndicator(
          color: Colors.red, // നമ്മൾ ആപ്പിൽ സെറ്റ് ചെയ്യുന്ന തീം കളർ
        ),
      ),
      error: (error, stackTrace) => Center(
        child: Text(
          'Error: ${error.toString()}',
          style: const TextStyle(color: Colors.red),
        ),
      ),
      data: onData, // ഡാറ്റ വിജയകരമായാൽ മാത്രം യഥാർത്ഥ പേജ് കാണിക്കുന്നു
    );
  }
}
