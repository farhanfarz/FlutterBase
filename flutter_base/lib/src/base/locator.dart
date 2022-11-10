import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'encrypted_codec.dart';
import 'local.dart';
import 'registry.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  try {
    // final gclient = await getGraphQLClient();
    // locator.registerSingleton<GraphQLClient>(gclient);

    final _sharedPrefs = await SharedPreferences.getInstance();
    final _codec = getEncryptSembastCodec(password: LOCAL_STORAGE_KEY);
    var _db = await databaseFactoryIo.openDatabase(
        path.join((await getApplicationDocumentsDirectory()).path, REGISTRY_DB),
        codec: _codec);

    locator
      ..registerSingleton<Database>(_db)
      ..registerSingleton<SharedPreferences>(_sharedPrefs)
      ..registerSingleton(RegistryService());
  } catch (e) {
    print(e);
  }
  return;
}
