import 'package:coinhe/constant/app_color.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String title;

  final String hint;

  final FormFieldValidator<String> validator;

  final TextEditingController textController;

  final Widget icon;

  final bool obscureText;

  TextFormFieldWidget({
    @required this.title,
    @required this.hint,
    @required this.validator,
    this.icon,
    this.textController,
    this.obscureText = false
  });

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  static const TAG = 'TextFormFieldWidget';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Color.fromRGBO(159, 196, 255, 0.05),
          borderRadius: BorderRadius.all(Radius.circular(3))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                      color: AppColors.blue
                    ),
                  ),
                ),
                TextFormField(
                  controller: widget.textController,
                  style: TextStyle(
                      color: AppColors.white
                  ),
                  decoration: InputDecoration(
                    hintText: widget.hint,
                    hintStyle: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: AppColors.textGray.withOpacity(0.5)
                    ),
                    fillColor: Colors.transparent,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    border: InputBorder.none,
                    isCollapsed: true,
                    errorBorder: InputBorder.none,
                    errorStyle: TextStyle(height: 0),
                  ),
                  autocorrect: false,
                  validator: widget.validator,
                  obscureText: widget.obscureText,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8,),
          widget?.icon ?? SizedBox()
        ],
      ),
    );
  }
}
