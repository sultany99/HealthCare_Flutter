import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class InputField extends StatefulWidget {
  final String label;
  final double radius;

  // Colors
  final MaterialColor borderColor;
  final MaterialColor labelColor;

  // width
  final double borderWidth;

  // Icon
  final IconData icon;

  final FocusNode? focusNode;

  // Booleans
  final bool isPassword;
  final TextEditingController controller;
  final void Function() onTap;
  final void Function(String val) onSubmitted;

  const InputField({
    super.key,
    this.focusNode,
    required this.controller,
    this.label = 'InputField',
    this.labelColor = Colors.blue,
    this.radius = 10,
    this.borderColor = Colors.blue,
    this.borderWidth = 1,
    this.icon = Icons.edit,
    this.isPassword = false,
    required this.onSubmitted,
    required this.onTap,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder bBorder = OutlineInputBorder(
        borderSide: BorderSide(
          style: BorderStyle.solid,
          color: Theme.of(context).colorScheme.onSurface,
          width: widget.borderWidth,
        ),
        borderRadius: BorderRadius.all(Radius.circular(widget.radius)));

    return TextFormField(
        // autofocus: true,
        controller: widget.controller,
        focusNode: widget.focusNode,
        onFieldSubmitted: widget.onSubmitted,
        onTap: widget.onTap,
        obscureText: isShowPassword,
        obscuringCharacter: '⬤',
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(isShowPassword
                      ? Icons.remove_red_eye
                      : Icons.remove_red_eye_outlined),
                  onPressed: () {
                    setState(() {
                      isShowPassword = !isShowPassword;
                    });
                  },
                )
              : null,
          labelText: widget.label,
          // labelStyle: TextStyle(color: widget.labelColor),
          border: bBorder,
          // enabledBorder: bBorder,
          // focusedBorder: bBorder,
          enabledBorder: bBorder,
          // disabledBorder: bBorder,
          focusedBorder: bBorder,
        ));
  }
}

class HCContainer extends StatefulWidget {
  final Widget child;

  const HCContainer({super.key, this.child = const Text('HCContainer')});

  @override
  State<HCContainer> createState() => _HCContainerState();
}

class _HCContainerState extends State<HCContainer> {
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    print("hi ${context}");
    return SafeArea(
        child: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: widget.child,
    ));
  }
}
