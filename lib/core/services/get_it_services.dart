import 'package:fruits_app/core/services/firebase_Auth_services.dart';
import 'package:fruits_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_app/features/auth/domain/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
class ServicesLoacator {
  void init() {
    getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
    getIt.registerSingleton<AuthRepo>(
        AuthRepoImpl(firebaseAuthServices: getIt<FirebaseAuthServices>()));
  }
}