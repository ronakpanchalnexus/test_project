part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initOnBoarding();
  await _initAuth();
  await Prefs.init();
}

_initOnBoarding() async {
  sl.registerLazySingleton(() => NavigationService());
}

_initAuth() async {
  // sl
  //   ..registerFactory(
  //     () => UserAuthenticationBloc(
  //       signIn: sl(),
  //       signUp: sl(),
  //       updateUserUseCase: sl(),
  //       updateCompanyUseCase: sl(),
  //       checkInvitationUseCase: sl(),
  //       getUserUseCase: sl(),
  //       getCompanyUseCase: sl(),
  //       updateHourlyWageUseCase: sl(),
  //       verifyOtpUseCase: sl(),
  //       requestPasswordResetUseCase: sl(),
  //       resetPasswordUseCase: sl(),
  //     ),
  //   )
  //   ..registerLazySingleton(() => ResetPasswordStateSuccess(sl()))
  //   ..registerLazySingleton(() => ResetPasswordStateFailed(sl()))
  //   ..registerLazySingleton(() => SignInUseCase(sl()))
  //   ..registerLazySingleton<AuthenticationRepo>(
  //       () => AuthenticationRepoImplementation(sl()))
  //   ..registerLazySingleton<AuthenticationRemoteDataSource>(
  //       () => AuthenticationRemoteDataSourceImplementation(dio: sl()));
}
