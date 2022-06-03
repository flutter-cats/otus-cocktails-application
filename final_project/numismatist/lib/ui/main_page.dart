import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:numismatist/core/error_handler.dart';
import 'package:numismatist/ui/list_page.dart';

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

  void goto(BuildContext context, int list) {
    Navigator.of(context).pushNamed('/list', arguments: ListPageArguments(list, ''));
  }

  void search(BuildContext context) {
    if (_controller.text.isEmpty || _controller.text.length < 3) {
      showError(context, ArgumentError("Введите минимум 3 символа для поиска"));
    } else {
      Navigator.of(context).pushNamed('/list', arguments: ListPageArguments(0, _controller.text));
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: _tabIndex,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("НумизматЪ"),
            centerTitle: true,
            actions: <Widget>[
              Badge(
                  animationType: BadgeAnimationType.slide,
                  badgeColor: Theme.of(context).colorScheme.secondary,
                  badgeContent: Text(
                    '10',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  child: IconButton(icon: const Icon(Icons.sync), tooltip: 'Sync', onPressed: () => sync(context))),
            ],
          ),
          bottomNavigationBar: menu(context, 5),
          body: SafeArea(
              child: Center(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
                    child: TextField(
                        focusNode: _focusNode,
                        controller: _controller,
                        autofocus: false,
                        onSubmitted: (value) {
                          search(context);
                          _focusNode.unfocus();
                        },
                        textInputAction: TextInputAction.search,
                        keyboardType: TextInputType.number,
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
                // SliverList(
                //   delegate: SliverChildBuilderDelegate(
                //       (context, index) => TicketShortListItem(
                //             tabTickets[index],
                //             onTap: () => goto(context, tabTickets[index].id),
                //           ),
                //       childCount: tabTickets.length),
                // )
              ],
            ),
          )),
        ));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  TabBar menu(BuildContext context, int count) {
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
        Tab(
          text: "Избранное",
          icon: Badge(
              animationType: BadgeAnimationType.slide,
              badgeColor: Theme.of(context).colorScheme.secondary,
              badgeContent: Text(
                count.toString(),
                style: Theme.of(context).textTheme.caption,
              ),
              child: const Icon(Icons.favorite_border)),
        )
      ],
    );
  }
}
