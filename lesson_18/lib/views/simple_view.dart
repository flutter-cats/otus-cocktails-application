import 'package:flutter/material.dart';
import 'package:lesson_18/states/simple_state.dart';
import 'package:provider/provider.dart';

class SimpleView extends StatelessWidget {
  const SimpleView({Key? key}) : super(key: key);

  Widget _cocktailBuilder(BuildContext context, int index) {
    final List<String> cocktails = context.select<SimpleState, List<String>>((value) => value.content).toList();
    final String cocktail = cocktails[index];
    return ListTile(
      title: Text(cocktail),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SimpleState>(
      builder: (BuildContext context, SimpleState state, Widget? child) {
        print('Rebuild simple view');
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                OutlinedButton(
                  onPressed: state.addContent,
                  child: const Text('Add content'),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: _cocktailBuilder,
                    itemCount: state.content.length,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
