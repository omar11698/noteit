import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteit/Note_feature/presentation/manager/blocs/gridview_bloc/gridviewbloc_bloc.dart';

import '../Dependency_injection/DI.dart';

class MultiBlocProvidersList{

  static  blocProvidersList(BuildContext context){

   return  [
     // BlocProvider<GetWeatherBloc>(
     //   create: (context) => GetWeatherBloc(getWeatherByCityName: instance()),
     //  ),
      BlocProvider<GridViewBloc>(  create: (context) => GridViewBloc(),

      )
    ];

  }
}