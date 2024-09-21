import 'package:flutter/material.dart';

class FilterCustom extends StatelessWidget {
  const FilterCustom(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.title,
      required this.subTitle});

  final bool value;
  final String title;
  final String subTitle;
  final void Function(bool onChecked, String flag) onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: (onChecked){onChanged(onChecked, title);},
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
