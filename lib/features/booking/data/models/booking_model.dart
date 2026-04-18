import 'package:equatable/equatable.dart';

class BookingModel extends Equatable {
  final String fromCity;
  final String toCity;
  final DateTime? tripDate;
  final int passengersCount;
  final bool isVip;

  const BookingModel({
    this.fromCity = '',
    this.toCity = '',
    this.tripDate,
    this.passengersCount = 1,
    this.isVip = false,
  });

  BookingModel copyWith({
    String? fromCity,
    String? toCity,
    DateTime? tripDate,
    int? passengersCount,
    bool? isVip,
  }) {
    return BookingModel(
      fromCity: fromCity ?? this.fromCity,
      toCity: toCity ?? this.toCity,
      tripDate: tripDate ?? this.tripDate,
      passengersCount: passengersCount ?? this.passengersCount,
      isVip: isVip ?? this.isVip,
    );
  }

  @override
  List<Object?> get props => [
        fromCity,
        toCity,
        tripDate,
        passengersCount,
        isVip,
      ];
}