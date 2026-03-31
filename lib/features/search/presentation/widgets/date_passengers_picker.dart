import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../logic/search_bloc.dart';
import '../../logic/search_event.dart';
import '../../logic/search_state.dart';

class DatePassengersPicker extends StatelessWidget {
  const DatePassengersPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        final date = state.searchModel.tripDate;
        final count = state.searchModel.passengersCount;

        return Column(
          children: [
            // صندوق اختيار التاريخ
            _buildBaseBox(
              icon: Icons.calendar_today,
              title: "تاريخ الرحلة",
              content: Text(
                date == null ? "اختر التاريخ" : "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              onTap: () => _selectDate(context, date),
            ),
            const SizedBox(height: 12),
            // صندوق اختيار الركاب
            _buildBaseBox(
              icon: Icons.group,
              title: "عدد المسافرين",
              content: Row(
                children: [
                  const Text("مسافر", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  const Spacer(),
                  _counterBtn(Icons.remove, () => _updateCount(context, count, -1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text("$count", style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  _counterBtn(Icons.add, () => _updateCount(context, count, 1)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  // دالة موحدة لكل الصناديق في الواجهة
  Widget _buildBaseBox({required IconData icon, required String title, required Widget content, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(color: const Color(0xFF3A3A3C), borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primaryYellow, size: 22),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.grey, fontSize: 11)),
                  const SizedBox(height: 4),
                  content,
                ],
              ),
            ),
            if (onTap != null) const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }

  // دالة تحديث عدد الركاب المنطقية
  void _updateCount(BuildContext context, int current, int delta) {
    if (current + delta >= 1) {
      context.read<SearchBloc>().add(UpdatePassengersEvent(current + delta));
    }
  }

  // دالة زر العداد المختصرة
  Widget _counterBtn(IconData icon, VoidCallback onTap) {
    return InkWell( // استخدمنا InkWell لتعطي تلميح بالضغط (Ripple Effect)
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey.withOpacity(0.3)), borderRadius: BorderRadius.circular(8)),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }

  // دالة اختيار التاريخ
  Future<void> _selectDate(BuildContext context, DateTime? current) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: current ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx).copyWith(colorScheme: ColorScheme.dark(primary: AppColors.primaryYellow, onPrimary: Colors.black, surface: const Color(0xFF2C2C2E))),
        child: child!,
      ),
    );
    if (picked != null) context.read<SearchBloc>().add(UpdateDateEvent(picked));
  }
}