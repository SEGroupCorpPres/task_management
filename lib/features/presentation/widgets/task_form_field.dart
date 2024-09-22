import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/features/data/local/models/task_form_model.dart';

class TaskFormField extends StatelessWidget {
  const TaskFormField({
    super.key,
    required this.taskFormModel,
  });

  final TaskFormModel taskFormModel;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: taskFormModel.fieldFocusNode,
      controller: taskFormModel.fieldController,
      validator: taskFormModel.validator,
      onTapOutside: taskFormModel.onTapOutside,
      onTap: taskFormModel.onTap,
      decoration: InputDecoration(
        // errorText: authFormModel.errorText,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        hintText: taskFormModel.hint,

        hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey),
        suffixIcon: taskFormModel.isSuffix!
            ? RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 15.sp,
                ),
              )
            : null,
      ),
    );
  }
}
