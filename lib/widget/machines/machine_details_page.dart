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
              child: Row(
                children: [
                  const Text(
                    'Condition: ',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    machine.toolCondition.toString().split('.').last,
                    style: TextStyle(
                      fontSize: 30,
                      color: machine.toolCondition == WornType.worn ? Colors.red : Colors.green,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
              child: Row(
                children: [
                  const Text(
                    'Active? ',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    machine.isActive ? 'Yes' : 'No',
                    style: TextStyle(
                      fontSize: 30,
                      color: machine.isActive ? Colors.blue : Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Text(
                    'Is working now? ',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    machine.isWorking ? 'Yes' : 'No',
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ),
            Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Text(
                      'Activation time: ',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      machine.activationDate.toString().split('.').first,
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}