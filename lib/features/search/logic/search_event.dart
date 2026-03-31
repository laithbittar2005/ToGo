import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
  @override
  List<Object?> get props => [];
}

class UpdateFromCityEvent extends SearchEvent {
  final String city;
  const UpdateFromCityEvent(this.city);
  @override
  List<Object?> get props => [city];
}

class UpdateToCityEvent extends SearchEvent {
  final String city;
  const UpdateToCityEvent(this.city);
  @override
  List<Object?> get props => [city];
}

class SwapCitiesEvent extends SearchEvent {}

class UpdateDateEvent extends SearchEvent {
  final DateTime date; // تغيير لنوع DateTime
  const UpdateDateEvent(this.date);
  @override
  List<Object?> get props => [date];
}

class UpdatePassengersEvent extends SearchEvent {
  final int count;
  const UpdatePassengersEvent(this.count);
  @override
  List<Object?> get props => [count];
}

class UpdateTripTypeEvent extends SearchEvent {
  final bool isVip;
  const UpdateTripTypeEvent(this.isVip);
  @override
  List<Object?> get props => [isVip];
}