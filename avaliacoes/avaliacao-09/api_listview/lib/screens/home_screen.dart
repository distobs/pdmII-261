import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/user_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
extends State<HomeScreen> {

  List<User> users = [];

  bool loading = true;

  String? error;

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {

    try {

      setState(() {
        loading = true;
        error = null;
      });

      users =
          await UserService.fetchUsers();

    } catch (e) {

      error = e.toString();

    } finally {

      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(
      BuildContext context
  ) {

    Widget body;

    if (loading) {

      body =
          const Center(
            child:
              CircularProgressIndicator(),
          );

    } else if (
        error != null
    ) {

      body =
          Center(
            child:
              Text(error!),
          );

    } else {

      body =
          RefreshIndicator(

            onRefresh: load,

            child:
                ListView.builder(

              itemCount:
                  users.length,

              itemBuilder:
                  (_, i) {

                final u =
                    users[i];

                return Card(

                  margin:
                      const EdgeInsets.all(
                          10),

                  child:
                      ListTile(

                    leading:
                        const CircleAvatar(

                      backgroundImage:
                          AssetImage(
                            "assets/images/user.png",
                          ),
                    ),

                    title:
                        Text(u.name),

                    subtitle:
                        Text(u.login),
                  ),
                );
              },
            ),
          );
    }

    return Scaffold(

      appBar: AppBar(
        title:
            const Text(
                "Usuários"),
      ),

      body: body,
    );
  }
}
