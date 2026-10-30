import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
// import 'package:retail/counter.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class CountireCubit extends Cubit<int> {
  CountireCubit() : super(0) {
    getCounter();
  }
  final storage = FlutterSecureStorage();
  final Box box = Hive.box('Countercounter');
  Future<void> getCounter() async {
    //____________________SharedPreferences_________________________
    // final prefs = await SharedPreferences.getInstance();
    // final counter = prefs.getInt('counter') ?? 0;

    //____________________Hive_________________________
    final counter = box.get('counterBox', defaultValue: 0);
    //____________________Flutter secure_________________________
    // final value = await storage.read(key: 'CounterSecure');
    // final counter = int.tryParse(value ?? '');

    emit(counter ?? 0);
  }

  Future<void> increment() async {
    final newValue = state + 1;

    emit(newValue);
    //____________________SharedPreferences_________________________
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setInt('counter', newValue);

    //____________________Hive_________________________
    await box.put('counterBox', newValue);
    //____________________Flutter secure_________________________
    await storage.write(key: 'CounterSecure', value: newValue.toString());
  }

  Future<void> decrement() async {
    final newValue = state - 1;

    emit(newValue);
    //____________________SharedPreferences_________________________
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setInt('counter', newValue);

    //____________________Hive_________________________
    await box.put('counterBox', newValue);

    //____________________Flutter secure_________________________
    await storage.write(key: 'CounterSecure', value: newValue.toString());
  }
}
