import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:foodie_goodie/provider/filters_provider.dart';

class FilterCustom extends ConsumerWidget {
  const FilterCustom(
      {super.key,
      required this.value,
      required this.title,
      required this.subTitle});

  final bool value;
  final String title;
  final String subTitle;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile(
      value: value,
      onChanged: (onChecked){
        if(title == "Gluten-Free"){
          ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, onChecked);
        }
        if(title == "Lactose-Free"){
          ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, onChecked);
        }
        if(title == "Vegetarian"){
          ref.read(filtersProvider.notifier).setFilter(Filter.vegetarian, onChecked);
        }
        if(title == "Vegan"){
          ref.read(filtersProvider.notifier).setFilter(Filter.vegan, onChecked);
        }
      },
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
