import 'package:final_project/Data/Models/home%20screen%20model.dart';
import 'package:final_project/Data/cupit/home%20screen%20cupit/home_screen_cubit.dart';
import 'package:final_project/Screens/inf_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({super.key});

  HomeScreenModel homeScreenModel = HomeScreenModel();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenModel homeScreenModel = HomeScreenModel();

  @override
  void initState() {
    HomeScreenCubit.get(context).getHomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenState>(
      listener: (context, state) {
        state is HomeScreenError ? debugPrint("an error appear") : null;
      },
      builder: (context, state) {
        return state is HomeScreenLoading
            ? const Center(
                child: CircularProgressIndicator(color: Colors.white70),
              )
            : Scaffold(
                backgroundColor: Colors.black,
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  centerTitle: true,
                  title: const Text(
                    "ACTORS",
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        letterSpacing: 3),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                      height: 1000,
                      child: GridView.builder(
                          itemCount: HomeScreenCubit.get(context)
                              .homeScreenModel
                              .results!
                              .length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 200, crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) =>
                                             InfScreen(id:int.parse(HomeScreenCubit.get(context).homeScreenModel.results![index].id.toString()) )));
                              },
                              child: Container(
                                  height: 80,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.circular(3)),
                                  margin: const EdgeInsets.all(10),
                                  child: Column(

                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [

                                      Text(
                                        HomeScreenCubit.get(context)
                                            .homeScreenModel
                                            .results![index]
                                            .name
                                            .toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18),
                                      )
                                    ],
                                  )),
                            );
                          })),
                ),
              );
      },
    );
  }
}
