import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:foodie_goodie/widgets/filter.dart';
import 'package:foodie_goodie/provider/filters_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: Column(
        children: [
          FilterCustom(
            value: activeFilters[Filter.glutenFree]!,
            title: "Gluten-Free",
            subTitle: "Only includes gluten-free meals",
          ),
          FilterCustom(
            value: activeFilters[Filter.lactoseFree]!,
            title: "Lactose-Free",
            subTitle: "Only includes Lactose-free meals",
          ),
          FilterCustom(
            value: activeFilters[Filter.vegetarian]!,
            title: "Vegetarian",
            subTitle: "Only includes Vegetarian meals",
          ),
          FilterCustom(
            value: activeFilters[Filter.vegan]!,
            title: "Vegan",
            subTitle: "Only includes Vegan meals",
          )
        ],
      ),
    );
  }
}
