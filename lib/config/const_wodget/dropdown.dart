import 'package:fiber/config/constant.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.title,
    this.onChanged,
    this.list,
    this.data,
    this.enabled,
  });

  final List<String>? list;
  final List<Map<String, dynamic>>? data;
  final String title;
  final void Function(Object?)? onChanged;
  final String? enabled;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      // enableFilter: true,
      enableSearch: true,
      onSelected: (value) {
        onChanged!(value);
        FocusScope.of(context).unfocus();
      },
      menuHeight: context.height * 0.3,
      expandedInsets: const EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 0,
      ),

      hintText: title,
      controller: TextEditingController(),
      initialSelection: title,
      requestFocusOnTap: true,
      // searchCallback: (entries, query) {
      //   if (query.isEmpty) {
      //     return null;
      //   }
      //   final int index = entries.indexWhere((entry) => entry.label == query);

      //   return index != -1 ? index : null;
      // },
      dropdownMenuEntries: data != null
          ? data!.map((Map<String, dynamic> value) {
              return DropdownMenuEntry(
                value: value,
                label: value['name'],
                enabled: enabled != value['name'],
                labelWidget: Text(
                  value['name'],
                ),
              );
            }).toList()
          : list!.map((String value) {
              return DropdownMenuEntry(
                value: value,
                label: value,
                labelWidget: Text(value),
              );
            }).toList(),
      // isDense: false,
      // isExpanded: true,
      // icon: Icon(
      //   Icons.keyboard_arrow_down,
      //   color: Theme.of(context).colorScheme.outline,
      // ),
      // borderRadius: BorderRadius.circular(Insets.small),
      // style: context.textTheme.bodyMedium!.copyWith(
      //   color: Theme.of(context).colorScheme.outline,
      // ),

      // hint: Text(title),
      // elevation: 1,
      // underline: Container(),
      // onChanged: onChanged,
    );
  }
}
