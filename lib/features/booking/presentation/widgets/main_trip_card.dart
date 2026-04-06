import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import 'ticket_details_grid.dart';
import 'trip_status_section.dart';
import 'custom_button.dart';
import 'custom_badge.dart';

class MainTripCard extends StatelessWidget {
  final dynamic bookingData;
  const MainTripCard({super.key, required this.bookingData});

  @override
  Widget build(BuildContext context) {
    final dt = bookingData.tripDate ?? DateTime.now();
    final date = DateFormat('yyyy-MM-dd').format(dt);
    final time = DateFormat('HH:mm').format(dt);
    final isVip = bookingData.isVip ?? false;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.cardBg,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                _buildHeaderRow("TG-8X1J-VUR3", "TICKET SERIAL"),
                const Divider(color: Colors.white10, height: 20),
                Row(
                  children: [
                    if (isVip) ...[const CustomBadge(text: "VIP"), const SizedBox(width: 6)],
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 10),
                      child: Text(
                        "شركة الحسن",
                        style: TextStyle(
                          color: AppColors.textWhite,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 10),
                      child: _buildRoute(
                        bookingData.fromCity,
                        bookingData.toCity,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TicketDetailsGrid(
                  date: date,
                  time: time,
                  passengers: bookingData.passengersCount.toString(),
                ),
                const Divider(color: Colors.white10, height: 25),
                CustomButton(
                  label: "عرض مسار الرحلة",
                  icon: Icons.map_outlined,
                  backgroundColor: AppColors.primaryYellow,
                  textColor: Colors.black,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const TripStatusSection(),
          const SizedBox(height: 12),
          CustomButton(
            label: "تأكيد الحجز (Sham Cash)",
            icon: Icons.wallet,
            backgroundColor: AppColors.primaryYellow,
            textColor: Colors.black,
            onPressed: () {},
          ),
          const SizedBox(height: 8),
          CustomButton(
            label: "إلغاء الحجز",
            icon: Icons.close,
            backgroundColor: Colors.transparent,
            textColor: Colors.redAccent,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderRow(String code, String label) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        code,
        style: TextStyle(
          color: AppColors.primaryYellow,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
      Text(
        label,
        style: TextStyle(
          color: AppColors.textGrey,
          fontSize: 10,
        ),
      ),
    ],
  );

  Widget _buildRoute(String from, String to) => Flexible(
    child: FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        children: [
          Text(
            from,
            style: TextStyle(
              color: AppColors.textWhite,
              fontSize: 14,
              fontFamily: 'Cairo',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Icon(
              Icons.arrow_forward_rounded,
              color: AppColors.primaryYellow,
              size: 16,
            ),
          ),
          Text(
            to,
            style: TextStyle(
              color: AppColors.textWhite,
              fontSize: 14,
              fontFamily: 'Cairo',
            ),
          ),
        ],
      ),
    ),
  );
}