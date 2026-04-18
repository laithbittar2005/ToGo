import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavCubit extends Cubit<int> {
  // القيمة 2 تعني يبدأ من صفحة البحث
  BottomNavCubit() : super(2); 

  void changeTab(int index) => emit(index);
}