import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final Icon? prefixIcon;  // Changed to Icon specifically for DeanDetails
  final IconData? suffixIcon;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final bool readOnly;
  final VoidCallback? onTap;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final VoidCallback? onSuffixIconTap;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.validator,
    this.keyboardType,
    this.prefixIcon,  // Updated parameter
    this.suffixIcon,
    this.obscureText = false,
    this.inputFormatters,
    this.onChanged,
    this.focusNode,
    this.readOnly = false,
    this.onTap,
    this.fillColor,
    this.hintStyle,
    this.style,
    this.onSuffixIconTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null 
          ? GestureDetector(
              onTap: onSuffixIconTap,
              child: Icon(
                suffixIcon,
                color: Colors.grey,
              ),
            )
          : null,
        filled: fillColor != null,
        fillColor: fillColor,
        hintStyle: hintStyle ?? const TextStyle(color: Colors.grey),
        
        // Border styling
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black38),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black38),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.green,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.red.shade400,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.red.shade400,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        errorStyle: TextStyle(
          color: Colors.red.shade400,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      style: style ?? const TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      validator: validator,
      maxLines: maxLines,
      keyboardType: keyboardType,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      focusNode: focusNode,
      readOnly: readOnly,
      onTap: onTap,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}



class CustomTextFields extends StatelessWidget {
  final String hintText;
  final int maxLines;
  final FormFieldValidator<String>? validator;
  final double? width;
  final double? height;
  final IconData? prefixIcon;
  final TextEditingController? controller; // Add this line
  final TextInputType? keyboardType; // Add this line

  const CustomTextFields({
    Key? key,
    required this.hintText,
    this.maxLines = 1,
    this.validator,
    this.width,
    this.height,
    this.prefixIcon,
    this.controller, // Add this line
    this.keyboardType, // Add this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? (maxLines > 1 ? null : 50),
      child: TextFormField(
        controller: controller, // Add this line to use the controller
        keyboardType: keyboardType, // Use the keyboardType parameter here
        decoration: InputDecoration(
          hintText: hintText,
          alignLabelWithHint: maxLines > 1,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: Colors.black38,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: Colors.black38,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: Colors.green,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Icon(prefixIcon, color: Colors.grey),
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        ),
        validator: validator,
        maxLines: maxLines,
      ),
    );
  }
}














// class DropDownTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final IconData? suffixIcon;
//   final VoidCallback? onTap;
//   final bool readOnly;
//   final TextInputType? keyboardType;
//   final Function(String)? onChanged;

//   const DropDownTextField({
//     Key? key,
//     required this.controller,
//     required this.hintText,
//     this.suffixIcon,
//     this.onTap,
//     this.readOnly = false,
//     this.keyboardType,
//     this.onChanged,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey, width: 1),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: TextField(
//         controller: controller,
//         readOnly: readOnly,
//         onTap: onTap,
//         onChanged: onChanged,
//         keyboardType: keyboardType,
//         decoration: InputDecoration(
//           hintText: hintText,
//           hintStyle: TextStyle(color: Colors.grey),
//           contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//           border: InputBorder.none,
//           suffixIcon: suffixIcon != null
//               ? Icon(
//                   suffixIcon,
//                   color: Colors.grey,
//                 )
//               : null,
//         ),
//         style: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     );
//   }
// }


class DropDownTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? suffixIcon;
  final VoidCallback? onTap;
  final bool readOnly;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final InputDecoration? decoration;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  const DropDownTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.onTap,
    this.readOnly = false,
    this.keyboardType,
    this.onChanged,
    this.decoration,
    this.textStyle,
    this.hintStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Modern color scheme
    const Color primaryColor = Color(0xFF6366F1);  // Indigo
    const Color borderColor = Color(0xFFE2E8F0);   // Slate-200
    const Color textColor = Color(0xFF1E293B);     // Slate-800

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        onChanged: onChanged,
        keyboardType: keyboardType,
        style: textStyle ?? TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
        decoration: decoration ?? InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle ?? TextStyle(
            color: textColor.withOpacity(0.5),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          suffixIcon: suffixIcon != null
              ? Icon(
                  suffixIcon,
                  color: primaryColor,
                  size: 24,
                )
              : null,
        ),
      ),
    );
  }
}