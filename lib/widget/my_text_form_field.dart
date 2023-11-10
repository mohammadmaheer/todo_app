import 'package:flutter/material.dart';
import 'package:todo_app/widget/add_height.dart';

class MyTextFormField extends StatelessWidget {
  final String hint;
  final String? label;
  final TextEditingController controller;
  const MyTextFormField({
    super.key,
    required this.controller,
    this.label,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const AddHeight(percentage: 0.005),
        ],
        TextFormField(
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field is Required';
            }
            return null;
          },
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: InputDecoration(
            hintText: hint,
            isDense: true,
            contentPadding: const EdgeInsets.all(12),
            border: const OutlineInputBorder(),
            hintStyle: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
