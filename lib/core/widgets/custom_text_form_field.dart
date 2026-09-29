import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.title,
    this.maxLines = 1,
    this.validator,
    this.suffixIcon,
    this.obscureText = false,
  });

  final TextEditingController controller;

  final String hintText;
  final String title;
  final int? maxLines;
  final bool obscureText;

  final Widget? suffixIcon;
  final Function(String?)? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: Theme.of(context).textTheme.bodyMedium),
        SizedBox(height: 8),
        TextFormField(
          maxLines: widget.maxLines,
          style: Theme.of(context).textTheme.labelMedium,
          controller: widget.controller,
          obscureText: !isVisible && widget.obscureText,
          validator: widget.validator != null
              ? (String? value) => widget.validator!(value)
              : null,
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: widget.obscureText
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    icon: isVisible
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
