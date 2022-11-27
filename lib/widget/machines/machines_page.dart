import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wax_milling_cnc_supervisor/data/cnc_service_interface.dart';

import '../../bloc/machines/machines_bloc.dart';
import '../../bloc/machines/machines_event.dart';
import '../../bloc/machines/machines_state.dart';
import '../../models/machine.dart';
import 'machine_details_page.dart';
import 'machine_list_tile.dart';

class MachinesPage extends StatelessWidget {
  const MachinesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MachinesBloc(
          cncServiceInterface: context.read<CncServiceInterface>()
      )..add(const MachinesSubscriptionRequested()),
      child: const MachinesView(),
    );
  }
}

class MachinesView extends StatelessWidget {
  const MachinesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Machines'),
      ),
      body: BlocListener<MachinesBloc, MachinesState>(
        listenWhen: (previous, current) =>
        previous.status != current.status,
        listener: (context, state) {
          if (state.status == MachinesStatus.failure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text('An error occurred while loading machines data'),
                ),
              );
          }
        },
        child: BlocBuilder<MachinesBloc, MachinesState>(
          builder: (context, state) {
            if (state.machines.isEmpty) {
              if (state.status == MachinesStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.status != MachinesStatus.success) {
                return const SizedBox();
              } else {
                return const Center(
                  child: Text(
                    'No machines are in the database',
                    style: TextStyle(fontSize: 20),
                  ),
                );
              }
            }

            return Scrollbar(
              child: ListView(
                children: [
                  for (final machine in state.filteredMachines)
                    MachineListTile(
                      machine: machine,
                      onDismissed: (_) {
                        context
                            .read<MachinesBloc>()
                            .add(MachineDeleted(machine));
                      },
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (context) => MachineDetailsPage(machine: machine)
                            )
                        );
                      },
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

