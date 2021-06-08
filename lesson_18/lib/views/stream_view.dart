import 'package:flutter/material.dart';
import 'package:lesson_18/states/stream_state.dart';
import 'package:provider/provider.dart';

class StreamView extends StatelessWidget {
  const StreamView({Key? key}) : super(key: key);

  Widget _cocktailBuilder(BuildContext context, int index) {
    return Builder(
      builder: (BuildContext context) {
        final List<String> cocktails = context.select<StreamState, List<String>>((value) => value.content).toList();
        final String cocktail = cocktails[index];
        return ListTile(
          title: Text(cocktail),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Builder(
        builder: (BuildContext context) {
          print('Rebuild stream parent');
          return Consumer<StreamState>(
            builder: (BuildContext context, StreamState state, Widget? child) {
              print('Rebuild stream view');
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
        },
      ),
    );
  }
}
