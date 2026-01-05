import 'package:notes_app/export.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? onSuffixIconClick;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.obscureText = false,
    this.onSuffixIconClick,
    this.labelStyle,
    this.hintStyle,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: labelStyle ?? AppStyle.k15500DarkSlate,
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: hintStyle ?? AppStyle.k16500Gray,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.kGray),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.kGray),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.kPrimary),
            ),
            suffixIcon: isPassword
                ? IconButton(
              icon: Icon(
                obscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: AppColors.kGray,
              ),
              onPressed: onSuffixIconClick,
            )
                : null,
          ),
        ),
      ],
    );
  }
}
