import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_constants.dart';
import '../../logic/search_bloc.dart';
import '../../logic/search_event.dart';
import '../../logic/search_state.dart';

class LocationSelector extends StatelessWidget {
  const LocationSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) => Stack(
        alignment: Alignment.centerLeft,
        children: [
          Column(children: [
            _box(context, Icons.location_on, "من", state.searchModel.fromCity, true, state),
            const SizedBox(height: 10),
            _box(context, Icons.navigation, "إلى", state.searchModel.toCity, false, state),
          ]),
          _swapBtn(context),
        ],
      ),
    );
  }

  Widget _box(BuildContext context, IconData icon, String title, String city, bool isFrom, SearchState state) {
    return GestureDetector(
      onTap: () => _showPicker(context, isFrom, state),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(color: const Color(0xFF3A3A3C), borderRadius: BorderRadius.circular(15)),
        child: Row(children: [
          Icon(icon, color: const Color(0xFFFFD700), size: 22),
          const SizedBox(width: 15),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(color: Colors.grey, fontSize: 11)),
            Text(city.isEmpty ? "اختر المدينة" : city, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          ]),
          const Spacer(),
          const Icon(Icons.keyboard_arrow_down, color: Colors.white54),
        ]),
      ),
    );
  }

  Widget _swapBtn(BuildContext context) => Positioned(
    left: 10,
    child: GestureDetector(
      onTap: () => context.read<SearchBloc>().add(SwapCitiesEvent()),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(color: Color(0xFFFFD700), shape: BoxShape.circle),
        child: const Icon(Icons.swap_vert, color: Colors.black, size: 28),
      ),
    ),
  );

  void _showPicker(BuildContext context, bool isFrom, SearchState state) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF2C2C2E),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => ListView.builder(
        itemCount: AppConstants.syrianCities.length,
        itemBuilder: (ctx, i) {
          final city = AppConstants.syrianCities[i];
          return ListTile(
            title: Text(city, style: const TextStyle(color: Colors.white, fontFamily: 'Cairo')),
            onTap: () {
              final isDup = isFrom ? (city == state.searchModel.toCity) : (city == state.searchModel.fromCity);
              if (isDup) return _error(context, "لقد اخترت نفس المدينة، يرجى تحديد وجهة أخرى");
              context.read<SearchBloc>().add(isFrom ? UpdateFromCityEvent(city) : UpdateToCityEvent(city));
              Navigator.pop(ctx);
            },
          );
        },
      ),
    );
  }

  void _error(BuildContext context, String msg) {
    late OverlayEntry e;
    e = OverlayEntry(builder: (c) => Positioned(
      top: 50, left: 20, right: 20,
      child: Material(color: Colors.transparent, child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
        child: Text(msg, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
      )),
    ));
    Overlay.of(context).insert(e);
    Future.delayed(const Duration(seconds: 2), () => e.remove());
  }
}