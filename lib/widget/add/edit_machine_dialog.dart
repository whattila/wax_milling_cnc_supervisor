import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/edit/machine/edit_machine_bloc.dart';
import '../../bloc/edit/machine/edit_machine_event.dart';
import '../../bloc/edit/machine/edit_machine_state.dart';
import '../../data/cnc_service_interface.dart';
import '../../models/machine.dart';

class EditMachineDialog extends StatelessWidget {
  const EditMachineDialog({Key? key}) : super(key: key);

  static Route<void> route({Machine? initialMachine}) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => BlocProvider(
        create: (context) => EditMachineBloc(
          cncServiceInterface: context.read<CncServiceInterface>(),
          initialMachine: initialMachine,
        ),
        child: const EditMachineDialog(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditMachineBloc, EditMachineState>(
      listenWhen: (previous, current) =>
      previous.status != current.status &&
          current.status == EditStatus.success,
      listener: (context, state) {
        final snackBarText = state.isNewMachine ? 'Machine added successfully' : 'Machine updated successfully';
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(content: Text(snackBarText)),
          );
        Navigator.of(context).pop();
      },
      child: const _EditMachineForm(),
    );
  }
}

class _EditMachineForm extends StatefulWidget {
  const _EditMachineForm({Key? key}) : super(key: key);

  @override
  _EditMachineFormState createState() => _EditMachineFormState();
}

class _EditMachineFormState extends State<_EditMachineForm> {
  final _key = GlobalKey<FormState>();
  late final TextEditingController _codeController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController(text: context.read<EditMachineBloc>().state.initialMachine?.machineCode);
    _descriptionController = TextEditingController(text: context.read<EditMachineBloc>().state.initialMachine?.machineDescription);
  }

  @override
  Widget build(BuildContext context) {
    final status = context.select((EditMachineBloc bloc) => bloc.state.status);
    final isNewMachine = context.select(
          (EditMachineBloc bloc) => bloc.state.isNewMachine,
    );

    const fabBackgroundColor = Colors.deepOrange;
    const fabForegroundColor = Colors.white;

    return Form(
      key: _key,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            isNewMachine
                ? 'Add new machine'
                : 'Edit machine',
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.check),
          label: Text(isNewMachine ? 'ADD' : 'UPDATE'),
          backgroundColor: status.isLoadingOrSuccess
              ? fabBackgroundColor.withOpacity(0.5)
              : fabBackgroundColor,
          foregroundColor: fabForegroundColor,
          onPressed: status.isLoadingOrSuccess ?
          null
              : () => context.read<EditMachineBloc>().add(
              MachineSaved(
                  machineCode: _codeController.value.text,
                  machineDescription: _descriptionController.value.text
              )
          ),
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _codeController,
                    decoration: InputDecoration(
                        enabled: !status.isLoadingOrSuccess,
                        labelText: 'Machine code',
                        border: const OutlineInputBorder()
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                        enabled: !status.isLoadingOrSuccess,
                        labelText: 'Machine description',
                        border: const OutlineInputBorder()
                    ),
                  ),
                  if (!isNewMachine)
                    const SizedBox(height: 8),
                  if (!isNewMachine)
                    const IsActiveRow(),
                  if (!isNewMachine)
                    const SizedBox(height: 8),
                  if (!isNewMachine)
                    const ToolConditionRow()
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _codeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}

class IsActiveRow extends StatelessWidget {
  const IsActiveRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isActive = context
        .watch<EditMachineBloc>()
        .state
        .isActive;
    return Row(
      children: [
        const Text("Is the machine in active service"),
        Switch(
          value: isActive,
          onChanged: (value) {
            context
                .read<EditMachineBloc>()
                .add(IsActiveChanged(isActive: value));
          },
        )
      ],
    );
  }
}

class ToolConditionRow extends StatelessWidget {
  const ToolConditionRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final toolCondition = context
        .watch<EditMachineBloc>()
        .state
        .toolCondition;

    return Row(
      children: [
        const Text("Is the tool worn"),
        Switch(
          value: toolCondition == WornType.worn ? true : false,
          onChanged: (value) {
            context
                .read<EditMachineBloc>()
                .add(ToolConditionChanged(toolCondition: value ? WornType.worn : WornType.unworn));
          },
        )
      ],
    );
  }
}