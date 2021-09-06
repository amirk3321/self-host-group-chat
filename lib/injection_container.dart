import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/create_group_usecase.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/create_group_usecase.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/get_all_group_usecase.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/get_all_group_usecase.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/get_all_users_usecase.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/get_all_users_usecase.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/get_create_current_user_usecase.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/get_create_current_user_usecase.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/get_current_uid_usecase.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/get_current_uid_usecase.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/get_messages_usecase.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/get_messages_usecase.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/get_update_user_usecase.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/get_update_user_usecase.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/join_group_usecase.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/join_group_usecase.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/send_text_message_usecase.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/send_text_message_usecase.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/update_group_usecase.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/update_group_usecase.dart';
import 'package:self_host_group_chat_app/features/presentation/cubit/group/group_cubit.dart';
import 'package:self_host_group_chat_app/features/presentation/cubit/group/group_cubit.dart';
import 'package:self_host_group_chat_app/features/presentation/cubit/user/user_cubit.dart';
import 'package:self_host_group_chat_app/features/presentation/cubit/user/user_cubit.dart';
import 'features/data/remote/data_sources/firebase_remote_data_source.dart';
import 'features/data/remote/data_sources/firebase_remote_data_source_impl.dart';
import 'features/data/repositories/firebase_repository_impl.dart';
import 'features/domain/repositories/firebase_repository.dart';
import 'features/domain/use_cases/forgot_password_usecase.dart';
import 'features/domain/use_cases/google_sign_in_usecase.dart';
import 'features/domain/use_cases/is_sign_in_usecase.dart';
import 'features/domain/use_cases/sign_in_usecase.dart';
import 'features/domain/use_cases/sign_out_usecase.dart';
import 'features/domain/use_cases/sign_up_usecase.dart';
import 'features/presentation/cubit/auth/auth_cubit.dart';
import 'features/presentation/cubit/chat/chat_cubit.dart';
import 'features/presentation/cubit/credential/credential_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Future bloc
  sl.registerFactory<AuthCubit>(() =>
      AuthCubit(
        isSignInUseCase: sl.call(),
        signOutUseCase: sl.call(),
        getCurrentUIDUseCase: sl.call(),
      ));
  sl.registerFactory<CredentialCubit>(() =>
      CredentialCubit(
          forgotPasswordUseCase: sl.call(),
          getCreateCurrentUserUseCase: sl.call(),
          signInUseCase: sl.call(),
          signUpUseCase: sl.call(),
          googleSignInUseCase: sl.call()));
  sl.registerFactory<UserCubit>(() =>
      UserCubit(
        getAllUsersUseCase: sl.call(),
        getUpdateUserUseCase: sl.call(),
      ));

  sl.registerFactory<GroupCubit>(() =>
      GroupCubit(
        getAllGroupsUseCase: sl.call(),
        getCreateGroupUseCase: sl.call(),
        joinGroupUseCase: sl.call(),
        groupUseCase: sl.call(),
      ));
  sl.registerFactory<ChatCubit>(() =>
      ChatCubit(
        getMessageUseCase: sl.call(),
        sendTextMessageUseCase: sl.call(),

      ));

  //UseCases
  sl.registerLazySingleton<GoogleSignInUseCase>(
          () => GoogleSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<ForgotPasswordUseCase>(
          () => ForgotPasswordUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCreateCurrentUserUseCase>(
          () => GetCreateCurrentUserUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCurrentUIDUseCase>(
          () => GetCurrentUIDUseCase(repository: sl.call()));
  sl.registerLazySingleton<IsSignInUseCase>(
          () => IsSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignInUseCase>(
          () => SignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignUpUseCase>(
          () => SignUpUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignOutUseCase>(
          () => SignOutUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetAllUsersUseCase>(
          () => GetAllUsersUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetUpdateUserUseCase>(
          () => GetUpdateUserUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCreateGroupUseCase>(
          () => GetCreateGroupUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetAllGroupsUseCase>(
          () => GetAllGroupsUseCase(repository: sl.call()));
  sl.registerLazySingleton<JoinGroupUseCase>(
          () => JoinGroupUseCase(repository: sl.call()));
  sl.registerLazySingleton<UpdateGroupUseCase>(
          () => UpdateGroupUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetMessageUseCase>(
          () => GetMessageUseCase(repository: sl.call()));
  sl.registerLazySingleton<SendTextMessageUseCase>(
          () => SendTextMessageUseCase(repository: sl.call()));

  //Repository
  sl.registerLazySingleton<FirebaseRepository>(
          () => FirebaseRepositoryImpl(remoteDataSource: sl.call()));

  //Remote DataSource
  sl.registerLazySingleton<FirebaseRemoteDataSource>(
          () => FirebaseRemoteDataSourceImpl(sl.call(), sl.call(), sl.call()));

  //External
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
  sl.registerLazySingleton(() => googleSignIn);
}
