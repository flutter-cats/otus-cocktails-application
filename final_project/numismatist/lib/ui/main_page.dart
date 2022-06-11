import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:numismatist/core/error_handler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:numismatist/state/catalogs_state.dart';
import 'package:numismatist/state/favorites_state.dart';
import 'package:numismatist/state/items_state.dart';
import 'package:numismatist/ui/component/catalog_list_item.dart';
import 'package:numismatist/ui/component/coin_list_item.dart';
import 'package:numismatist/ui/list_page.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with ErrorStatefullHandler {
  int _tabIndex = 0;

  final TextEditingController _controller = TextEditingController();
  final _focusNode = FocusNode();

  void sync(BuildContext context) {
    Navigator.of(context).pushNamed('/sync');
  }

  void goto(BuildContext context, String catalogId, String catalogName) {
    Navigator.of(context).pushNamed('/list', arguments: ListPageArguments(catalogId: catalogId, searchBy: catalogName));
  }

  void search(BuildContext context) {
    if (_controller.text.isEmpty || _controller.text.length < 3) {
      showError(context, ArgumentError("Введите минимум 3 символа для поиска"));
    } else {
      Navigator.of(context).pushNamed('/list', arguments: ListPageArguments(catalogId: '', searchBy: _controller.text));
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final syncState = Provider.of<CatalogsState>(context);
    return DefaultTabController(
        length: 2,
        initialIndex: _tabIndex,
        child: Scaffold(
            appBar: AppBar(
              title: const Text("НумизматЪ"),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                    icon: Observer(
                        builder: (context) => Badge(
                              animationType: BadgeAnimationType.slide,
                              badgeColor: Theme.of(context).colorScheme.secondary,
                              showBadge: syncState.needUpdate,
                              child: const Icon(Icons.sync),
                            )),
                    tooltip: 'Синхронизация',
                    onPressed: () => sync(context)),
              ],
            ),
            bottomNavigationBar: menu(context),
            body: TabBarView(
              children: [
                catalogsPage(context),
                searchPage(context),
                //favoritesPage(context),
              ],
            )));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<CatalogsState>(context).checkUpdate();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  Widget catalogsPage(BuildContext context) {
    final catalogsState = Provider.of<CatalogsState>(context);
    return SafeArea(
        child: Observer(
            builder: (context) => ListView.builder(
                  itemCount: catalogsState.catalogs.length,
                  itemBuilder: (_, index) => CatalogListItem(
                    catalogsState.catalogs[index],
                    onTap: () => goto(context, catalogsState.catalogs[index].id, catalogsState.catalogs[index].name),
                  ),
                )));
  }

  Widget searchPage(BuildContext context) {
    final itemsState = Provider.of<ItemsState>(context);
    return SafeArea(
        child: Column(children: [
      Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
              focusNode: _focusNode,
              controller: _controller,
              autofocus: false,
              onSubmitted: (value) {
                search(context);
                _focusNode.unfocus();
              },
              textInputAction: TextInputAction.search,
              keyboardType: TextInputType.streetAddress,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                  filled: true,
                  border: const OutlineInputBorder(),
                  hintText: 'Поиск монет...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _controller.clear();
                    },
                    icon: const Icon(Icons.clear),
                  )))),
    ]));
  }

  Widget favoritesPage(BuildContext context) {
    final favoritesState = Provider.of<FavoritesState>(context);
    return SafeArea(
        child: Observer(
      builder: (context) => ListView.builder(
        itemCount: favoritesState.favorites.length,
        itemBuilder: (_, index) => Text('F: ${favoritesState.favorites[index].id}'),
        //CoinListItem()
      ),
    ));
  }

  TabBar menu(BuildContext context) {
    final favoritesState = Provider.of<FavoritesState>(context);
    return TabBar(
      onTap: ((value) => setState(() => _tabIndex = value)),
      indicatorColor: Theme.of(context).colorScheme.primary,
      labelColor: Theme.of(context).colorScheme.primary,
      unselectedLabelColor: Theme.of(context).colorScheme.background,
      tabs: [
        const Tab(
          text: "Каталог",
          icon: Icon(Icons.list_alt),
        ),
        const Tab(
          text: "Поиск",
          icon: Icon(Icons.search),
        ),
        // Tab(
        //   text: "Избранное",
        //   icon: Badge(
        //       animationType: BadgeAnimationType.slide,
        //       badgeColor: Theme.of(context).colorScheme.secondary,
        //       showBadge: favoritesState.favorites.isNotEmpty,
        //       badgeContent: Text(
        //         favoritesState.favorites.length.toString(),
        //         style: Theme.of(context).textTheme.caption,
        //       ),
        //       child: const Icon(Icons.favorite_border)),
        // )
      ],
    );
  }
}
