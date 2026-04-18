import 'package:equatable/equatable.dart';

abstract class BookingEvent extends Equatable {
  const BookingEvent();

  @override
  List<Object?> get props => [];
}

class UpdateFromCityEvent extends BookingEvent {
  final String city;

  const UpdateFromCityEvent(this.city);

  @override
  List<Object?> get props => [city];
}

class UpdateToCityEvent extends BookingEvent {
  final String city;

  const UpdateToCityEvent(this.city);

  @override
  List<Object?> get props => [city];
}

class SwapCitiesEvent extends BookingEvent {}

class UpdateDateEvent extends BookingEvent {
  final DateTime date;

  const UpdateDateEvent(this.date);

  @override
  List<Object?> get props => [date];
}

class UpdatePassengersEvent extends BookingEvent {
  final int count;

  const UpdatePassengersEvent(this.count);

  @override
  List<Object?> get props => [count];
}

class UpdateTripTypeEvent extends BookingEvent {
  final bool isVip;

  const UpdateTripTypeEvent(this.isVip);

  @override
  List<Object?> get props => [isVip];
}