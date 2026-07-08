// lib/lib/core/widgets/custom_button.dart

import 'package:flutter/material.dart';
import 'theme_provider.dart'; // context.brand കളർ എടുക്കാൻ വേണ്ടി ഇമ്പോർട്ട് ചെയ്തു

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // ബട്ടൺ കളർ JSON ഫയലിലെ ബ്രാൻഡ് കളറിൽ നിന്ന് എടുക്കുന്നു (context.brand)
        backgroundColor: context.brand,
        // ഫോണ്ട് കളർ രണ്ട് തീമിലും വൈറ്റ് (White) ആക്കി
        foregroundColor: Colors.white, 
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // വശങ്ങൾ വളയ്ക്കാൻ
        ),
        elevation: 2, // ചെറിയ നിഴൽ നൽകാൻ
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
