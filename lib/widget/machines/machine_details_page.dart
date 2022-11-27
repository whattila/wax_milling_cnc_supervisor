import 'package:flutter/material.dart';

import '../../models/machine.dart';

class MachineDetailsPage extends StatelessWidget {
  const MachineDetailsPage({Key? key, required this.machine}) : super(key: key);

  final Machine machine;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: const Text('Machine details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                machine.machineCode,
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                machine.machineDescription,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
              child: Text(
                'Condition: ${machine.toolCondition}',
                style: TextStyle(
                  fontSize: 30,
                  color: machine.toolCondition == WornType.worn ? Colors.red : Colors.green,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
              child: Text(
                'Active? ${machine.isActive ? 'Yes' : 'No'}',
                style: TextStyle(
                  fontSize: 30,
                  color: machine.isActive ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Is working now: ${machine.isWorking ? 'Yes' : 'No'}',
                style: TextStyle(
                  fontSize: 30,
                  color: machine.isWorking ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}