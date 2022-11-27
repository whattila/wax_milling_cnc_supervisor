import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wax_milling_cnc_supervisor/data/cnc_service_interface.dart';
import '../../bloc/add_operation/add_operation_bloc.dart';
import '../../bloc/add_operation/add_operation_event.dart';
import '../../bloc/add_operation/add_operation_state.dart';

class AddOperationDialog extends StatelessWidget {
  const AddOperationDialog({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => BlocProvider(
        create: (context) => AddOperationBloc(
          cncServiceInterface: context.read<CncServiceInterface>()
        ),
        child: const AddOperationDialog(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddOperationBloc, AddOperationState>(
      listenWhen: (previous, current) =>
      previous.status != current.status &&
          current.status == AddStatus.success,
      listener: (context, state) {
        const snackBarText = 'Operation added successfully';
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(content: Text(snackBarText)),
          );
        Navigator.of(context).pop();
      },
      child: const _AddOperationForm(),
    );
  }
}

class _AddOperationForm extends StatefulWidget {
  const _AddOperationForm({Key? key}) : super(key: key);

  @override
  _AddOperationFormState createState() => _AddOperationFormState();
}

class _AddOperationFormState extends State<_AddOperationForm> {
  final _key = GlobalKey<FormState>();
  late final TextEditingController _operationCodeController = TextEditingController();
  late final TextEditingController _machineCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final status = context.select((AddOperationBloc bloc) => bloc.state.status);

    const fabBackgroundColor = Colors.deepOrange;
    const fabForegroundColor = Colors.white;

    return Form(
      key: _key,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add operation'),
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          label: const Text('ADD'),
          backgroundColor: status.isLoadingOrSuccess
              ? fabBackgroundColor.withOpacity(0.5)
              : fabBackgroundColor,
          foregroundColor: fabForegroundColor,
          onPressed: status.isLoadingOrSuccess ?
          null
              : () => context.read<AddOperationBloc>().add(
              OperationSubmitted(
                  operationCode: _operationCodeController.value.text,
                  machineCode: _machineCodeController.value.text,
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
                    controller: _operationCodeController,
                    decoration: InputDecoration(
                        enabled: !status.isLoadingOrSuccess,
                        labelText: 'Operation code',
                        border: const OutlineInputBorder()
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _machineCodeController,
                    decoration: InputDecoration(
                        enabled: !status.isLoadingOrSuccess,
                        labelText: 'Machine code',
                        border: const OutlineInputBorder()
                    ),
                  ),
                  const SizedBox(height: 8),
                  const PressionRow(),
                  const SizedBox(height: 8),
                  const VelocityRow(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _operationCodeController.dispose();
    super.dispose();
  }
}


// TODO: check this
class PressionRow extends StatelessWidget {
  const PressionRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AddOperationBloc>().state;
    final pression = state.pression;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("${AddOperationBloc.pressionMinValue.round()} bar"),
        Expanded(
          child: Slider(
            value: pression,
            min: AddOperationBloc.pressionMinValue,
            max: AddOperationBloc.pressionMaxValue,
            label: "${pression.toString()} Bar",
            onChanged: (value) {
              context.read<AddOperationBloc>().add(PressionChanged(pression: value));
            },
          ),
        ),
        Text("${AddOperationBloc.pressionMaxValue.round()} Bar"),
      ],
    );
  }
}

// TODO: check this
class VelocityRow extends StatelessWidget {
  const VelocityRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AddOperationBloc>().state;
    final velocity = state.velocity;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("${AddOperationBloc.velocityMinValue.round()} mmps"),
        Expanded(
          child: Slider(
            value: velocity,
            min: AddOperationBloc.velocityMinValue,
            max: AddOperationBloc.velocityMaxValue,
            label: "${velocity.toString()} mmps",
            onChanged: (value) {
              context.read<AddOperationBloc>().add(VelocityChanged(velocity: value));
            },
          ),
        ),
        Text("${AddOperationBloc.velocityMaxValue.round()} mmps"),
      ],
    );
  }
}
