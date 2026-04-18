import 'package:equatable/equatable.dart';
import 'package:togo/features/booking/data/models/booking_model.dart';

class BookingState extends Equatable {
  final BookingModel bookingModel;
  final bool isLoading;
  final String? errorMessage;

  const BookingState({
    required this.bookingModel,
    this.isLoading = false,
    this.errorMessage,
  });

  factory BookingState.initial() {
    return const BookingState(
      bookingModel: BookingModel(),
    );
  }

  BookingState copyWith({
    BookingModel? bookingModel,
    bool? isLoading,
    String? errorMessage,
  }) {
    return BookingState(
      bookingModel: bookingModel ?? this.bookingModel,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        bookingModel,
        isLoading,
        errorMessage,
      ];
}