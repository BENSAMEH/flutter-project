import 'package:bloc/bloc.dart';
import 'package:final_project/Data/Models/home%20screen%20model.dart';
import 'package:final_project/Data/remote%20data%20source/api_call.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());
  static HomeScreenCubit get(context) => BlocProvider.of(context);
  HomeScreenModel homeScreenModel =HomeScreenModel();
  getHomeScreen(){
   emit(HomeScreenLoading());
   ApiCallClass.homeScreenRequest(onSuccess: (res){
     homeScreenModel=res;
     emit(HomeScreeDone());
   }, onError: (statusCode){
     emit(HomeScreenError());
   });

  }
}
