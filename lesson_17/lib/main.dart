import 'package:flutter/material.dart';
import 'package:lesson_17/entity_fabric.dart';
import 'package:lesson_17/model/entity.dart';
import 'package:lesson_17/repository/cocktail/file_cocktail_repository.dart';
import 'package:lesson_17/repository/cocktail/hive_cocktail_repository.dart';
import 'package:lesson_17/repository/cocktail/shared_prefs_cocktail_repository.dart';
import 'package:lesson_17/repository/cocktail/sql_cocktail_repository.dart';
import 'package:lesson_17/repository/entity_repository.dart';
import 'package:lesson_17/repository_testing_view.dart';

const int INITIAL_INDEX = 0;

void main() {
  EntityFabric().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Databases',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int index = 0;
  String type = '';
  TabController? tabController;
  final List<String> types = ['File', 'Shared Prefs', 'Hive', 'SQL'];
  List<EntityRepository<Entity>> repositories = [];

  void selectRepository(int repoIndex) {
    setState(() {
      index = repoIndex;
      type = types[index];
      repositories.forEach((EntityRepository<Entity> repo) => repo.saveIndex(index));
    });
  }

  Future<void> initRepositories() async {
    await Future.wait(repositories.map((EntityRepository<Entity> repo) => repo.init()));
    final int savedIndex = await repositories[index].readIndex();
    selectRepository(savedIndex);
    tabController!.animateTo(savedIndex);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Repositories initialized')));
  }

  @override
  void initState() {
    super.initState();
    repositories.addAll([FileCocktailRepository(), SharedPrefsCocktailRepository(), HiveCocktailRepository(), SqlCocktailRepository()]);
    tabController = TabController(length: repositories.length, vsync: this, initialIndex: index);
    WidgetsBinding.instance?.addPostFrameCallback((_) => initRepositories());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: index,
      length: repositories.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Databases - $type'),
          bottom: TabBar(
            controller: tabController,
            tabs: const [
              Tab(text: 'File'),
              Tab(text: 'Shared Prefs'),
              Tab(text: 'Hive'),
              Tab(text: 'SQL Lite'),
            ],
            onTap: selectRepository,
          ),
        ),
        body: TabBarView(
          controller: tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            RepositoryTestingView(repository: repositories[0]),
            RepositoryTestingView(repository: repositories[1]),
            RepositoryTestingView(repository: repositories[2]),
            RepositoryTestingView(repository: repositories[3]),
          ],
        ),
      ),
    );
  }
}
