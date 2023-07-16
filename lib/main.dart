import 'package:blnk_task/core/service_locator/service_locator.dart';
import 'package:blnk_task/data/repo/google_sheet_repo.dart';
import 'package:blnk_task/presentation/view/screens/user_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/cubits/user_data_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 

  await GoogleSheetRepo.init();
  ServiceLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) { 
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => UserDataCubit(getIt()),         
      ),
      
    ] , child: const MaterialApp(
      debugShowCheckedModeBanner: false ,
      home : UserDataScreen() ,
    ),
    ); 
  }
}

