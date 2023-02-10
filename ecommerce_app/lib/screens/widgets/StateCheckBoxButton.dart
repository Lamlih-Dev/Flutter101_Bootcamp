import 'package:flutter/material.dart';

var isChecked = false;

class StateCheckBoxButton extends StatefulWidget {
  const StateCheckBoxButton({super.key});

  @override
  State<StateCheckBoxButton> createState() => _StateCheckBoxButtonState();
}

class _StateCheckBoxButtonState extends State<StateCheckBoxButton> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(value: isChecked, onChanged: onCheckBoxChangeState);
  }

  void onCheckBoxChangeState(bool) {
    isChecked = bool;
    setState(() {});
  }
}
