import 'package:bloc_structure_template/common/constants/storage_key_constants.dart';
import 'package:get_storage/get_storage.dart';

class SharePref {
  static late final GetStorage _pref;

  SharePref init() {
    GetStorage.init(StorageKeyConstants.cDataStore);
    _pref = GetStorage(StorageKeyConstants.cDataStore);
    return this;
  }

  void saveIsLogin(bool isLogin) {
    _pref.write(StorageKeyConstants.cKeyIsLogin, isLogin);
  }

  bool getIsLogin() {
    if (_pref.read(StorageKeyConstants.cKeyIsLogin) != null) {
      return _pref.read(StorageKeyConstants.cKeyIsLogin);
    } else {
      return false;
    }
  }
}
