import 'package:flutter_bloc/flutter_bloc.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    
    on<UpdateFromCityEvent>((event, emit) {
      if (event.city != state.searchModel.toCity) {
        emit(state.copyWith(
          searchModel: state.searchModel.copyWith(fromCity: event.city),
        ));
      }
    });

    on<UpdateToCityEvent>((event, emit) {
      if (event.city != state.searchModel.fromCity) {
        emit(state.copyWith(
          searchModel: state.searchModel.copyWith(toCity: event.city),
        ));
      }
    });

    on<SwapCitiesEvent>((event, emit) {
      emit(state.copyWith(
        searchModel: state.searchModel.copyWith(
          fromCity: state.searchModel.toCity,
          toCity: state.searchModel.fromCity,
        ),
      ));
    });

    on<UpdateDateEvent>((event, emit) {
      emit(state.copyWith(
        searchModel: state.searchModel.copyWith(tripDate: event.date),
      ));
    });

    on<UpdatePassengersEvent>((event, emit) {
      emit(state.copyWith(
        searchModel: state.searchModel.copyWith(passengersCount: event.count),
      ));
    });

    on<UpdateTripTypeEvent>((event, emit) {
      emit(state.copyWith(
        searchModel: state.searchModel.copyWith(isVip: event.isVip),
      ));
    });
  }
}