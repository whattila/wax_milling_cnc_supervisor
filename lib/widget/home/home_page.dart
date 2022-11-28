import 'package:flutter/material.dart';
import 'package:wax_milling_cnc_supervisor/widget/add/edit_machine_dialog.dart';

import '../add/add_operation_dialog.dart';
import '../machines/machines_page.dart';
import '../operations/operations_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            key: const Key('homeView_uploadTodo_floatingActionButton'),
            onPressed: ()
            {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Expanded(
                    child: SimpleDialog(
                      title:const Text('Add machine or operation'),
                      children: <Widget>[
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(EditMachineDialog.route());
                            },
                          child:const Text('Add machine'),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(AddOperationDialog.route());
                          },
                          child: const Text('Add operation'),
                        ),
                      ],
                    ),
                  );
                },
              );

            },
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            child: const Icon(Icons.add),
          ),
          body: const TabBarView(
            children: <Widget>[
              MachinesPage(),
              OperationsPage(),
            ],
          ),
          bottomNavigationBar: const BottomAppBar(
            child: TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              tabs: <Widget>[
                Tab(
                    text: "Machines"
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