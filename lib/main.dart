import 'package:court_click/core/network/dio_client.dart';
import 'package:court_click/core/routes/app_router.dart';
import 'package:court_click/core/routes/app_routes.dart';
import 'package:court_click/core/theme/app_theme.dart';
import 'package:court_click/data/datasources/movie_remote_data_source.dart';
import 'package:court_click/data/repositories/home_repository.dart';
import 'package:court_click/presentation/screens/bloc/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MachineTestApp());
}

class MachineTestApp extends StatelessWidget {
   MachineTestApp({super.key});
final reposity = HomeRepository(
  MovieRemoteDataSource(DioClient.dio)
);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(repository: reposity),
        ),
        
      ],
     
    
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark,
        initialRoute: AppRoutes.home,
        routes: AppRouter.routes
      ),
    );
  }
}
