import 'package:core/network/network_info.dart';
import 'package:data/datasources/pokeapi_pokemons.dart';
import 'package:data/repository/pokemon_repository.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:domain/repositories/pokemonrepository.dart';
import 'package:domain/usecases.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/bloc/pokemon_list_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> setupLocator() async {
  //! Feature Pokemon List
  // Bloc
  sl.registerFactory(() => PokemonlistBloc(getList: sl()));

  // Use cases
  sl.registerLazySingleton(
      () => GetPokemonListUseCase(repositoryContract: sl()));

  // Repositories
  sl.registerLazySingleton<PokemonRepositoryContract>(
    () => PokemonRepository(
      pokemonsRemoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<PokemonsRemoteDataSourceContract>(
    () => PokemonsRemoteDataSource(
      client: sl(),
    ),
  );

  //! Core
  sl.registerLazySingleton(() => NetworkInfo(dataConnectionChecker: sl()));

  //! External
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
}
