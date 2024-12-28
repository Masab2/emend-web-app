import 'package:get_storage/get_storage.dart';

class StorageService {
  static final GetStorage _box = GetStorage();

  static GetStorage get box => _box;

  static T? read<T>(String key) {
    return _box.read<T>(key);
  }

  static void write(String key, dynamic value) {
    _box.write(key, value);
  }
}
