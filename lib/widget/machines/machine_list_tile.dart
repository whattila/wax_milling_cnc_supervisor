import 'package:flutter/material.dart';

import '../../models/machine.dart';
import '../add/edit_machine_dialog.dart';

class MachineListTile extends StatelessWidget {
  const MachineListTile({
    super.key,
    required this.machine,
    this.onDismissed,
    this.onTap,
  });

  final Machine machine;
  final DismissDirectionCallback? onDismissed;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dismissible(
      key: Key('machineListTile_dismissible_${machine.id}'),
      onDismissed: onDismissed,
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        color: theme.colorScheme.error,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Icon(
          Icons.delete,
          color: Color(0xAAFFFFFF),
        ),
      ),
      child: Card(
        child: ListTile(
          tileColor: machine.toolCondition == WornType.worn ? Colors.red : Colors.green,
          onTap: onTap,
          title: Text(
            machine.machineCode,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            machine.isActive ? 'Active' : 'Not active',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: IconButton(
              onPressed: () => Navigator.of(context).push(EditMachineDialog.route(initialMachine: machine)),
              icon: const Icon(Icons.mode_edit)
          )
        ),
      ),
    );
  }
}