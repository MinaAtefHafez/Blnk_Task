



import 'package:blnk_task/data/repo/user_data_repo.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance ;


abstract class ServiceLocator {
  static void init () {
       getIt.registerLazySingleton<UserDataRepo>(() => UserDataRepoImpl() );
   }
}