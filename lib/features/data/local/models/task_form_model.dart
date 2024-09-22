import 'package:flutter/cupertino.dart';

class TaskFormModel {
  final String hint;
  final String errorText;
  final TextEditingController fieldController;
  final FocusNode fieldFocusNode;
  final bool? isSuffix;
  final VoidCallback? onTap;
  final ValueChanged<String?>? onChanged;
  final ValueChanged<PointerDownEvent?>? onTapOutside;

  // final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  TaskFormModel({
    required this.fieldController,
    required this.hint,
    required this.fieldFocusNode,
    required this.errorText,
    required this.validator,
    this.onTapOutside,
    this.onTap,
    this.isSuffix = false,
    this.onChanged,
    // this.keyboardType = TextInputType.emailAddress,
  });
}
