import 'package:flutter/material.dart';
import '../core/customs/custom_text_form_field.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextFormField
              (
              borderRadius: 16,
              prefixIcon:  ImageIcon(AssetImage('assets/icon/Vector (4).png')),
              hintText: 'Search',
              label: '',

            )
          )
        ],
      ),
    );
  }
}
