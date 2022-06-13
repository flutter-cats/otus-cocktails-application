import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:numismatist/core/error_handler.dart';
import 'package:numismatist/state/catalogs_state.dart';
import 'package:numismatist/state/load_process_state.dart';
import 'package:numismatist/ui/component/coin_progress_indicator.dart';
import 'package:numismatist/ui/component/default_button.dart';
import 'package:numismatist/ui/style/colors.dart';

import 'package:provider/provider.dart';

class SyncPage extends StatefulWidget {
  const SyncPage({Key? key}) : super(key: key);

  @override
  State<SyncPage> createState() => _SyncPageState();
}

class _SyncPageState extends State<SyncPage> with ErrorStatefullHandler {
  @override
  Widget build(BuildContext context) {
    final catalogsState = Provider.of<CatalogsState>(context);
    catalogsState.count();
    return ReactionBuilder(
      builder: ((context) => reaction(
            (_) => catalogsState.errorMessage,
            (String message) => context.showErrorText(message),
          )),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Обновление каталогов"),
            centerTitle: true,
          ),
          body: SafeArea(child: Observer(builder: (_) {
            switch (catalogsState.countState) {
              case LoadProcessState.initial:
              case LoadProcessState.loading:
                return buildSearchCatalogs();
              case LoadProcessState.loaded:
                if (catalogsState.needUpdateCount <= 0 && catalogsState.updateState != LoadProcessState.loading) {
                  return buildNotUpdateRequere(catalogsState);
                }
                switch (catalogsState.updateState) {
                  case LoadProcessState.initial:
                    return buildUpdateRequere(catalogsState);
                  case LoadProcessState.loading:
                    return buildLoading(catalogsState.needUpdateCount);
                  case LoadProcessState.loaded:
                    return buildLoaded();
                }
            }
          }))),
    );
  }

  Widget buildSearchCatalogs() => Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
        Text('Поиск обновлений каталогов', style: Theme.of(context).textTheme.headline6),
        const CoinProgressIndicator(color: primaryColor),
      ]));

  Widget buildNotUpdateRequere(CatalogsState catalogsState) => Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('Обновление не требуется', style: Theme.of(context).textTheme.headline6),
          DefaultButton(
            text: 'Все равно обновить',
            icon: Icons.sync,
            onPressed: () => catalogsState.update(),
          )
        ],
      ));

  Widget buildUpdateRequere(CatalogsState catalogsState) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Требуется обновление ${catalogsState.needUpdateCount} каталогов', style: Theme.of(context).textTheme.headline6),
            DefaultButton(
              text: 'Обновить сейчас',
              icon: Icons.sync,
              onPressed: () => catalogsState.update(),
            )
          ],
        ),
      );

  Widget buildLoading(int count) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Обновление ${count > 0 ? count.toString() : "всех"} каталогов', style: Theme.of(context).textTheme.headline6),
            const CoinProgressIndicator(color: primaryColor),
          ],
        ),
      );

  Widget buildLoaded() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Обновление каталогов завершено', style: Theme.of(context).textTheme.headline6),
          ],
        ),
      );
}
