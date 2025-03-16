import 'package:fruits_app/core/repos/order_repo/order_reo_impl.dart';
import 'package:fruits_app/core/repos/order_repo/order_repo.dart';
import 'package:fruits_app/core/repos/products_repo/products_repo.dart';
import 'package:fruits_app/core/repos/products_repo/products_repo_impl.dart';
import 'package:fruits_app/core/services/firebase_Auth_services.dart';
import 'package:fruits_app/core/services/storage_service.dart';
import 'package:fruits_app/core/services/supabase_storage.dart';
import 'package:fruits_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_app/features/auth/data/repos/forget_pass_repo_impl.dart';
import 'package:fruits_app/features/auth/domain/repo/auth_repo.dart';
import 'package:fruits_app/features/profile/data/repo/orders_repo_impl.dart';
import 'package:fruits_app/features/profile/domain/repo/order_status_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/domain/repo/forget_pass_repo.dart';
import '../../features/profile/data/repo/image_repo_impl.dart';
import '../../features/profile/domain/repo/image_repo.dart';
import 'database_service.dart';
import 'firestore_service.dart';

final getIt = GetIt.instance;

class ServicesLoacator {
  void init() {
    getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());

    getIt.registerSingleton<DatabaseService>(FirestoreService());
    getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
        firebaseAuthServices: getIt<FirebaseAuthServices>(),
        databaseService: getIt<DatabaseService>()));
    getIt.registerSingleton<ProductsRepo>(
        ProductsRepoImpl(getIt<DatabaseService>()));
    getIt.registerSingleton<OrderRepo>(OrderRepoImpl(getIt.get<DatabaseService>()));
    getIt.registerSingleton<OrdersStatusRepo>(OrdersStatusRepoImpl(getIt.get<DatabaseService>()));
    getIt.registerSingleton<StorageService>(SupabaseStorage());
    getIt.registerSingleton<ImageRepo>(
        ImageRepoImpl(getIt.get<StorageService>(),getIt.get<DatabaseService>(),getIt.get<AuthRepo>()));
    getIt.registerSingleton<ForgetPassRepo>(ForgetPassRepoImpl(getIt.get<FirebaseAuthServices>()));

  }
}
