import 'package:court_click/core/network/dio_client.dart';
import 'package:court_click/core/routes/app_router.dart';
import 'package:court_click/core/routes/app_routes.dart';
import 'package:court_click/core/theme/app_theme.dart';
import 'package:court_click/data/data_sources/movie_remote_data_source.dart';
import 'package:court_click/data/data_sources/search_data_source.dart';
import 'package:court_click/data/repositories/home_repository.dart';
import 'package:court_click/data/repositories/search_repository.dart';
import 'package:court_click/presentation/bloc/home/home_bloc.dart';
import 'package:court_click/presentation/bloc/search/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MachineTestApp());
}

class MachineTestApp extends StatelessWidget {
const   MachineTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(repository: HomeRepository(MovieRemoteDataSource(DioClient.dio))),
            
        ),
        BlocProvider(
        create: (_) => SearchBloc(
            repository: SearchRepository(SearchRemoteDataSource(DioClient.dio)),
          ),
        )
        
      ],
     
    
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark,
        initialRoute: AppRoutes.main,
        routes: AppRouter.routes
      ),
    );
  }
}
