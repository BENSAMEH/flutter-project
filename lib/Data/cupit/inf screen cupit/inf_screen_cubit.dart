import 'package:bloc/bloc.dart';
import 'package:final_project/Data/Models/images%20model.dart';
import 'package:final_project/Data/Models/inf%20screen%20model.dart';
import 'package:final_project/Data/remote%20data%20source/api_call.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'inf_screen_state.dart';

class InfScreenCubit extends Cubit<InfScreenState> {
  InfScreenCubit() : super(InfScreenInitial());

  static InfScreenCubit get(context) => BlocProvider.of(context);
  InfScreenModel infScreenModel = InfScreenModel();
  ImagesModel imagesModel =ImagesModel();

  getInfScreen({required int id}) {
    emit(InfScreenLoading());
    ApiCallClass.infScreenRequest(id: id, onSuccess: (res) {
      infScreenModel = res;
      emit(InfScreenDone());
    }, onError: (statusCode){emit(InfScreenError());


    });
  }
  getImages({required int id}) {
    emit(ImagesLoading());
    ApiCallClass.imagesRequest(id: id, onSuccess: (res) {
      imagesModel = res;
      emit(ImagesDone());
    }, onError: (statusCode){emit(ImagesError());


    });
  }
}
