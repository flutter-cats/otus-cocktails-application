import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:numismatist/core/error_handler.dart';
import 'package:numismatist/state/sync_state.dart';
import 'package:numismatist/ui/component/coin_progress_indicator.dart';
import 'package:numismatist/ui/component/default_button.dart';
import 'package:provider/provider.dart';

class SyncPage extends StatefulWidget {
  const SyncPage({Key? key}) : super(key: key);

  @override
  State<SyncPage> createState() => _SyncPageState();
}

class _SyncPageState extends State<SyncPage> with ErrorStatefullHandler {
  @override
  Widget build(BuildContext context) {
    final syncState = Provider.of<SyncState>(context);
    syncState.count();
    return ReactionBuilder(
      builder: ((context) => reaction(
            (_) => syncState.errorMessage,
            (String message) => context.showErrorText(message),
          )),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Обновление каталогов"),
            centerTitle: true,
          ),
          body: SafeArea(child: Observer(builder: (_) {
            switch (syncState.countState) {
              case SyncProcessState.initial:
              case SyncProcessState.loading:
                return Center(
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
                  Text('Проверка обновлений1', style: Theme.of(context).textTheme.headline6),
                  CoinProgressIndicator(color: Theme.of(context).colorScheme.primary),
                ]));
              case SyncProcessState.loaded:
                if (syncState.needUpdateCount <= 0 && syncState.updateState != SyncProcessState.loading) {
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Обновление не требуется', style: Theme.of(context).textTheme.headline6),
                      DefaultButton(
                        text: 'Все равно обновить',
                        icon: Icons.sync,
                        onPressed: () => syncState.update(),
                      )
                    ],
                  ));
                }
                switch (syncState.updateState) {
                  case SyncProcessState.initial:
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('Требуется обновление ${syncState.needUpdateCount} каталогов', style: Theme.of(context).textTheme.headline6),
                          DefaultButton(
                            text: 'Обновить сейчас',
                            icon: Icons.sync,
                            onPressed: () => syncState.update(),
                          )
                        ],
                      ),
                    );
                  case SyncProcessState.loading:
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('Обновление ${syncState.needUpdateCount > 0 ? syncState.needUpdateCount.toString() : "всех"} каталогов', style: Theme.of(context).textTheme.headline6),
                          CoinProgressIndicator(color: Theme.of(context).colorScheme.primary)
                        ],
                      ),
                    );
                  case SyncProcessState.loaded:
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('Обновление каталогов завершено', style: Theme.of(context).textTheme.headline6),
                        ],
                      ),
                    );
                }
            }
          }))),
    );

    // return Center(
    //   child: Text('Ошибка проверки обновлений', style: Theme.of(context).textTheme.bodyMedium),
    // );
  }
}
