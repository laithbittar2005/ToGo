import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../logic/search_bloc.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final state = context.read<SearchBloc>().state;
        final model = state.searchModel;
        
        // هون صار فيك تشوف البيانات المختارة بالـ Console
        print("بحث من: ${model.fromCity} إلى: ${model.toCity}");
        print("التاريخ: ${model.tripDate}, الركاب: ${model.passengersCount}, VIP: ${model.isVip}");
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryYellow,
        minimumSize: const Size(double.infinity, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
      ),
      child: const Text(
        AppStrings.search,
        style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}