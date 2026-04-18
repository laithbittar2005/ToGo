import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_constants.dart';
import '../bloc/booking_bloc.dart';
import '../bloc/booking_event.dart';
import '../bloc/booking_state.dart';
import '../../../../core/utils/app_utils.dart';

class LocationSelector extends StatelessWidget {
  const LocationSelector({super.key});

  @override
  Widget build(BuildContext context) {
    // تم التغيير من SearchBloc و SearchState إلى Booking
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) => Stack(
        alignment: Alignment.centerLeft,
        children: [
          Column(
            children: [
              _box(
                context,
                Icons.location_on,
                "من",
                state.bookingModel.fromCity, // تأكد إذا المتغير بالـ State اسمه bookingModel أو searchModel
                true,
                state,
              ),
              const SizedBox(height: 10),
              _box(
                context,
                Icons.navigation,
                "إلى",
                state.bookingModel.toCity,
                false,
                state,
              ),
            ],
          ),
          _swapBtn(context),
        ],
      ),
    );
  }

  Widget _box(
    BuildContext context,
    IconData icon,
    String title,
    String city,
    bool isFrom,
    BookingState state, // تغيير النوع هنا أيضاً
  ) {
    return GestureDetector(
      onTap: () => _showPicker(context, isFrom, state),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xFF3A3A3C),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFFFFD700), size: 22),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
                Text(
                  city.isEmpty ? "اختر المدينة" : city,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_down, color: Colors.white54),
          ],
        ),
      ),
    );
  }

  Widget _swapBtn(BuildContext context) => Positioned(
    left: 10,
    child: GestureDetector(
      // التغيير لـ BookingBloc
      onTap: () => context.read<BookingBloc>().add(SwapCitiesEvent()),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Color(0xFFFFD700),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.swap_vert, color: Colors.black, size: 28),
      ),
    ),
  );

  void _showPicker(BuildContext context, bool isFrom, BookingState state) { // تغيير النوع هنا أيضاً
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF2C2C2E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => ListView.builder(
        itemCount: AppConstants.syrianCities.length,
        itemBuilder: (ctx, i) {
          final city = AppConstants.syrianCities[i];
          return ListTile(
            title: Text(
              city,
              style: const TextStyle(color: Colors.white, fontFamily: 'Cairo'),
            ),
            onTap: () {
              // تأكد من اسم المتغير (bookingModel)
              final isDup = isFrom
                  ? (city == state.bookingModel.toCity)
                  : (city == state.bookingModel.fromCity);

              if (isDup) {
                AppUtils.showError(
                  context,
                  "لقد اخترت نفس المدينة، يرجى تحديد وجهة أخرى",
                );
                return;
              }
              // التغيير لـ BookingBloc
              context.read<BookingBloc>().add(
                isFrom ? UpdateFromCityEvent(city) : UpdateToCityEvent(city),
              );
              Navigator.pop(ctx);
            },
          );
        },
      ),
    );
  }
}