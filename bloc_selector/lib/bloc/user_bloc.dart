import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Cubit<Map<String, dynamic>> {
  UserBloc() : super({'nama': ' ', 'age': 0});

  void changeNama(String namaBaru) {
    emit(
      {
        'nama': namaBaru,
        'age': state['age'],
      },
    );
  }

  void changeUmur(int umurBaru) {
    emit(
      {
        'nama': state['nama'],
        'age': umurBaru,
      },
    );
  }
}
