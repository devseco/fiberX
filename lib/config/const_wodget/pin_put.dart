import 'package:fiber/config/constant.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CustomPinPut extends StatelessWidget {
  final void Function(String)? onCompleted;
  final void Function(String)? onChanged;
  const CustomPinPut({
    super.key,
    this.onCompleted,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      keyboardType: TextInputType.number,
      length: 6,
      followingPinTheme: PinTheme(
        width: Insets.exLarge * 1.5,
        height: Insets.exLarge * 1.5,
        margin: const EdgeInsets.symmetric(horizontal: 0),
        textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      defaultPinTheme: PinTheme(
        width: Insets.exLarge * 1.5,
        height: Insets.exLarge * 1.5,
        margin: const EdgeInsets.symmetric(horizontal: 0),
        textStyle: context.theme.textTheme.titleMedium!.copyWith(
          color: context.theme.colorScheme.onBackground,
        ),
        decoration: BoxDecoration(
          color: context.theme.colorScheme.background,
          border: Border.all(color: context.theme.colorScheme.primaryContainer),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      focusedPinTheme: PinTheme(
        margin: const EdgeInsets.symmetric(horizontal: 0),
        width: Insets.exLarge * 1.5,
        height: Insets.exLarge * 1.5,
        textStyle: context.theme.textTheme.titleMedium!.copyWith(
          color: context.theme.colorScheme.onBackground,
        ),
        decoration: BoxDecoration(
          color: context.theme.colorScheme.background,
          border: Border.all(color: context.theme.colorScheme.primaryContainer),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onChanged: onChanged,
      onCompleted: onCompleted,
    );
  }
}
