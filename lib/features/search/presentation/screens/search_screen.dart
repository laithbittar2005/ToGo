import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/search_header.dart';
import '../widgets/date_passengers_picker.dart';
import '../widgets/search_button.dart';
import '../widgets/location_selector.dart';
import '../widgets/trip_type_toggle.dart';
import '../../logic/search_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SearchHeader(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2C2E),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Column(
                    children: [
                      LocationSelector(),
                      SizedBox(height: 20),
                      DatePassengersPicker(),
                      SizedBox(height: 20),
                      TripTypeToggle(),
                      SizedBox(height: 30),
                      SearchButton(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}