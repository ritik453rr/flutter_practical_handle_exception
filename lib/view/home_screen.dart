import 'package:exceptions_handle/data/response/api_response.dart';
import 'package:exceptions_handle/data/response/status.dart';
import 'package:exceptions_handle/utils/routes/routes_name.dart';
import 'package:exceptions_handle/view_model/home_view_model.dart';
import 'package:exceptions_handle/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // HomeViewModel homeViewModel = HomeViewModel();
  @override
  void initState() {
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false).fetchMoviesListApi();
  }

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                userPreferences.remove().then((value) {
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: const Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        body: Consumer<HomeViewModel>(
          builder: (context, value, child) {
            switch (value.moviesList.status) {
              case Status.loading:
                return Center(child: CircularProgressIndicator());
              case Status.errors:
                return Center(child: Text(value.moviesList.message.toString()));
              case Status.completed:
                return ListView.builder(
                    itemCount: value.moviesList.data!.movies!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(value
                              .moviesList.data!.movies![index].title
                              .toString()),
                          subtitle: Text(value
                              .moviesList.data!.movies![index].year
                              .toString()),
                        ),
                      );
                    });
              default:
                return Text("default");
            }
          },
        ));
  }
}
