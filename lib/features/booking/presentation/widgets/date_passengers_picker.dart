import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:togo/features/booking/presentation/bloc/booking_bloc.dart';
import 'package:togo/features/booking/presentation/bloc/booking_state.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/booking_event.dart';
import 'info_selection_box.dart';   
import 'passenger_counter.dart';

class DatePassengersPicker extends StatelessWidget {
  const DatePassengersPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        final model = state.bookingModel; 

        return Column(
          children: [
            // استخدام القطعة المنفصلة للتاريخ
            InfoSelectionBox(
              icon: Icons.calendar_today,
              title: "تاريخ الرحلة",
              content: Text(
                model.tripDate == null 
                    ? "اختر التاريخ" 
                    : DateFormat('yyyy-MM-dd').format(model.tripDate!),
                style: TextStyle(color: AppColors.textWhite, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              onTap: () => _selectDate(context, model.tripDate),
            ),
            
            const SizedBox(height: 12),

            // استخدام القطعة المنفصلة للركاب
            InfoSelectionBox(
              icon: Icons.group,
              title: "عدد المسافرين",
              content: PassengerCounter(
                count: model.passengersCount,
                onUpdate: (val) {
                  if (val >= 1) context.read<BookingBloc>().add(UpdatePassengersEvent(val));
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context, DateTime? current) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: current ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)), // طريقة أنظف لتحديد شهر من الآن
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx).copyWith(
          colorScheme: ColorScheme.dark(
            primary: AppColors.primaryYellow, 
            onPrimary: Colors.black, 
            surface: AppColors.cardBg
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) context.read<BookingBloc>().add(UpdateDateEvent(picked));
  }
}