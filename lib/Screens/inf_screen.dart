import 'package:final_project/Data/Models/inf%20screen%20model.dart';
import 'package:final_project/Data/cupit/inf%20screen%20cupit/inf_screen_cubit.dart';
import 'package:final_project/Screens/pic_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class InfScreen extends StatefulWidget {
  int id;

  InfScreen({super.key, required this.id});

  InfScreenModel infScreenModel = InfScreenModel();

  @override
  State<InfScreen> createState() => _InfScreenState();
}

class _InfScreenState extends State<InfScreen> {
  @override
  void initState() {
    InfScreenCubit.get(context).getInfScreen(id: widget.id);
    InfScreenCubit.get(context).getImages(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InfScreenCubit, InfScreenState>(
      listener: (context, state) {
        state is InfScreenError ? print("ERROR") : null;
      },
      builder: (context, state) {
        return state is InfScreenLoading || state is ImagesLoading
            ? const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        )
            : Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                InfScreenCubit
                    .get(context)
                    .infScreenModel
                    .name
                    .toString(),
                style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    letterSpacing: 3),
              ),
              backgroundColor: Colors.black,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white70,
                ),
              ),
            ),
            body: Column(
              children: [
                // Container(
                //   decoration: BoxDecoration(
                //       color: Colors.white70,
                //       borderRadius: BorderRadius.circular(10)),
                //   height: 250,
                //   width: 200,
                // ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 460,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name Is : ${InfScreenCubit
                            .get(context)
                            .infScreenModel
                            .name}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Also Named : ${InfScreenCubit
                            .get(context)
                            .infScreenModel
                            .alsoKnownAs![0]}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Birthed In : ${InfScreenCubit
                            .get(context)
                            .infScreenModel
                            .placeOfBirth}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "BirthDay : ${InfScreenCubit
                            .get(context)
                            .infScreenModel
                            .birthday}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "DeathDay : ${InfScreenCubit
                            .get(context)
                            .infScreenModel
                            .deathday}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Is Adult : ${InfScreenCubit
                            .get(context)
                            .infScreenModel
                            .adult}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Known For : ${InfScreenCubit
                            .get(context)
                            .infScreenModel
                            .knownForDepartment}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "IMDB ID : ${InfScreenCubit
                            .get(context)
                            .infScreenModel
                            .imdbId}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 280,
                  width: 300,
                  child: GridView.builder(
                    itemCount: InfScreenCubit
                        .get(context)
                        .imagesModel
                        .profiles!
                        .length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 220, crossAxisCount: 1),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (builder) =>
                                  PicScreen(
                                    name: InfScreenCubit.get(context).infScreenModel.name.toString(),

                                    height:InfScreenCubit.get(context).imagesModel.profiles![index].height??100 ,


                                    width:InfScreenCubit.get(context).imagesModel.profiles![index].width??100,

                                    path:'http://image.tmdb.org/t/p/w500/${InfScreenCubit
                                            .get(context)
                                            .imagesModel
                                            .profiles![index]
                                            .filePath}',

                                  )));
                        },
                          child: Container(

                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(color: Colors.white70,
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.network(
                              'http://image.tmdb.org/t/p/w500/${InfScreenCubit
                                      .get(context)
                                      .imagesModel
                                      .profiles![index]
                                      .filePath}', fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
