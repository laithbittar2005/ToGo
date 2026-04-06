import 'package:equatable/equatable.dart';

class SearchModel extends Equatable {
  final String fromCity;
  final String toCity;
  final DateTime? tripDate; 
  final int passengersCount;
  final bool isVip;

  const SearchModel({
    this.fromCity = 'دمشق',
    this.toCity = 'حلب',
    this.tripDate, 
    this.passengersCount = 1,
    this.isVip = false,
  });

  SearchModel copyWith({
    String? fromCity,
    String? toCity,
    DateTime? tripDate,
    int? passengersCount,
    bool? isVip,
  }) {
    return SearchModel(
      fromCity: fromCity ?? this.fromCity,
      toCity: toCity ?? this.toCity,
      tripDate: tripDate ?? this.tripDate,
      passengersCount: passengersCount ?? this.passengersCount,
      isVip: isVip ?? this.isVip,
    );
  }

  @override
  List<Object?> get props => [fromCity, toCity, tripDate, passengersCount, isVip];
}