import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wax_milling_cnc_supervisor/data/cnc_service_interface.dart';

import '../../bloc/operations/operations_bloc.dart';
import '../../bloc/operations/operations_event.dart';
import '../../bloc/operations/operations_state.dart';
import 'operation_list_tile.dart';
import 'operation_details_page.dart';

class OperationsPage extends StatelessWidget {
  const OperationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OperationsBloc(
          cncServiceInterface: context.read<CncServiceInterface>()
      )..add(const OperationsSubscriptionRequested()),
      child: const OperationsView(),
    );
  }
}

class OperationsView extends StatelessWidget {
  const OperationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Operations'),
      ),
      body: BlocListener<OperationsBloc, OperationsState>(
        listenWhen: (previous, current) =>
        previous.status != current.status,
        listener: (context, state) {
          if (state.status == OperationsStatus.failure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text('An error occurred while loading operations data'),
                ),
              );
          }
        },
        child: BlocBuilder<OperationsBloc, OperationsState>(
          builder: (context, state) {
            if (state.operations.isEmpty) {
              if (state.status == OperationsStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.status != OperationsStatus.success) {
                return const SizedBox();
              } else {
                return const Center(
                  child: Text(
                    'No operations are in the database',
                    style: TextStyle(fontSize: 20),
                  ),
                );
              }
            }

            return Scrollbar(
              child: ListView(
                children: [
                  for (final operation in state.operations)
                    OperationListTile(
                      operation: operation,
                      onDismissed: (_) {
                        context
                            .read<OperationsBloc>()
                            .add(OperationDeleted(operation));
                      },
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (context) => OperationDetailsPage(operation: operation)
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

