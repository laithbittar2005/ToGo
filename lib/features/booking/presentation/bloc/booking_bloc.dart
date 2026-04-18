import 'package:flutter_bloc/flutter_bloc.dart';
import 'booking_event.dart';
import 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingState.initial()) {
    
    on<UpdateFromCityEvent>((event, emit) {
      emit(state.copyWith(
        bookingModel: state.bookingModel.copyWith(
          fromCity: event.city,
        ),
      ));
    });

    on<UpdateToCityEvent>((event, emit) {
      emit(state.copyWith(
        bookingModel: state.bookingModel.copyWith(
          toCity: event.city,
        ),
      ));
    });

    on<SwapCitiesEvent>((event, emit) {
      final model = state.bookingModel;

      emit(state.copyWith(
        bookingModel: model.copyWith(
          fromCity: model.toCity,
          toCity: model.fromCity,
        ),
      ));
    });

    on<UpdateDateEvent>((event, emit) {
      emit(state.copyWith(
        bookingModel: state.bookingModel.copyWith(
          tripDate: event.date,
        ),
      ));
    });

    on<UpdatePassengersEvent>((event, emit) {
      emit(state.copyWith(
        bookingModel: state.bookingModel.copyWith(
          passengersCount: event.count,
        ),
      ));
    });

    on<UpdateTripTypeEvent>((event, emit) {
      emit(state.copyWith(
        bookingModel: state.bookingModel.copyWith(
          isVip: event.isVip,
        ),
      ));
    });
  }
}