import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places/providers/user_places.dart';
import 'package:favorite_places/models/place.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _formKey = GlobalKey<FormState>();

  String _title = "";

  void _savePlace(){
    if(!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    ref.watch(userPlacesProvider.notifier).addPlace(Place(title: _title));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                maxLength: 60,
                decoration: const InputDecoration(labelText: 'Title'),
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Enter some title";
                  }
                  if(value.trim().length > 60){
                    return "Max 60 Characters are allowed";
                  }
                  return null;
                },
                onSaved: (newValue){
                  _title = newValue!;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton.icon(
                onPressed: _savePlace,
                icon: const Icon(Icons.add),
                label: const Text('Add Place'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
