
import 'package:get_it/get_it.dart';



final locator = GetIt.instance;

Future<void> SetupLocatore() async {
  // (dotenv.load was already called in main.dart)

  // /       () => PaymentRepository(
  //     baseUrl:   dotenv.env['PAYMENT_BASE_URL']!,
  //     secretKey: dotenv.env['PAYMENT_SECRET_KEY']!,
  //   ),
  // );  //
  // locator.registerLazySingleton<PaymentRepository>(


  // …register any other services, blocs, cubits, etc.…
}
