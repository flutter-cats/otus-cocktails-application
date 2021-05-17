import 'package:flutter/material.dart';
import 'package:lesson_18/states/future_state.dart';
import 'package:provider/provider.dart';

class FutureView extends StatelessWidget {
  const FutureView({Key? key}) : super(key: key);

  Widget _cocktailBuilder(BuildContext context, int index) {
    return Builder(
      builder: (BuildContext context) {
        final List<String> cocktails = context.select<FutureState, List<String>>((value) => value.content).toList();
        final String cocktail = cocktails[index];
        return ListTile(
          title: Text(cocktail),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FutureState>(
      builder: (BuildContext context, FutureState state, Widget? child) {
        print('Rebuild future view');
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
