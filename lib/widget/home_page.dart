import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

          //Init Floating Action Bubble
          floatingActionButton: FloatingActionButton(
            key: const Key('homeView_uploadTodo_floatingActionButton'),
            onPressed: () {},
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            child: const Icon(Icons.upload),
          ),
          body: TabBarView(
            children: <Widget>[
              Scaffold(
                appBar: AppBar(
                    title: const Text('Engines'),
                    backgroundColor: Colors.lightBlueAccent
                ),
                body: const Center(
                  child: Text("Engines"),
                ),
              ),
              Scaffold(
                appBar: AppBar(
                    title: const Text('Operations'),
                    backgroundColor: Colors.lightGreenAccent
                ),
                body: const Center(
                  child: Text("Operations"),
                ),
              ),
            ],
          ),
          bottomNavigationBar: const BottomAppBar(
            child: TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              tabs: <Widget>[
                Tab(
                    text: "Engines"
                ),
                Tab(
                    text: "Operations"
                ),
              ],
            ),
          )
      ),
    );
  }
}