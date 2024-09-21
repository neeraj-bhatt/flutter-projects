import 'package:flutter/material.dart';
// import 'package:foodie_goodie/screens/tab_screen.dart';
// import 'package:foodie_goodie/widgets/drawer.dart';
import 'package:foodie_goodie/widgets/filter.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  var _isGlutenFreeFilter = false;
  var _isLactoseFreeFilter = false;
  var _isVegetarianFilter = false;
  var _isVeganFilter = false;

  void onChanged(bool onChecked, String flag) {
    setState(() {
      if(flag == "Gluten-Free") {
        _isGlutenFreeFilter = onChecked;
      }
      if(flag == "Lactose-Free") {
        _isLactoseFreeFilter = onChecked;
      }
      if(flag == "Vegetarian") {
        _isVegetarianFilter = onChecked;
      }
      if(flag == "Vegan") {
        _isVeganFilter= onChecked;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      // drawer: CustomDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == "meals") {
      //       Navigator.of(context).pushReplacement(
      //           MaterialPageRoute(builder: (ctx) => const TabScreen()));
      //     }
      //   },
      // ),
      body: Column(
        children: [
          FilterCustom(
            value: _isGlutenFreeFilter,
            onChanged: onChanged,
            title: "Gluten-Free",
            subTitle: "Only includes gluten-free meals",
          ),
          FilterCustom(
            value: _isLactoseFreeFilter,
            onChanged: onChanged,
            title: "Lactose-Free",
            subTitle: "Only includes Lactose-free meals",
          ),
          FilterCustom(
            value: _isVegetarianFilter,
            onChanged: onChanged,
            title: "Vegetarian",
            subTitle: "Only includes Vegetarian meals",
          ),
          FilterCustom(
            value: _isVeganFilter,
            onChanged: onChanged,
            title: "Vegan",
            subTitle: "Only includes Vegan meals",
          )
        ],
      ),
    );
  }
}
