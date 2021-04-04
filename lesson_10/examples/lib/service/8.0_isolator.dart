import 'package:dio/dio.dart';
import 'package:isolator/isolator.dart';

bool isInit = false;
final ExampleFrontend exampleFrontend = ExampleFrontend();

Future<void> runCase(bool useChunks) async {
  if (!isInit) {
    isInit = true;
    await exampleFrontend.init();
  }
  exampleFrontend.loadDataFromAPI(useChunks);
}

enum Event { loadData }

class ExampleFrontend with Frontend<Event> {
  final List<Member> members = [];

  Future<void> init() async {
    await initBackend(ExampleBackend.create, backendType: ExampleBackend);
  }

  void loadDataFromAPI(bool useChunks) {
    send(Event.loadData, useChunks);
  }

  void _setData(List<Member> members) {
    this.members.clear();
    this.members.addAll(members);
    print('Set ${members.length} Members');
  }

  @override
  Map<Event, Function> get tasks => {
        Event.loadData: _setData,
      };
}

class ExampleBackend extends Backend<Event> {
  ExampleBackend(BackendArgument<void> argument, this.dio) : super(argument);

  final Dio dio;

  Future<void> _loadData(bool useChunks) async {
    final Response<dynamic> response = await dio.get('https://opencollective.com/webpack/members/all.json');
    final List<dynamic> data = response.data as List<dynamic>;
    final List<Member> members = [
      for (int i = 0; i < 100; i++) ...data,
    ].map((dynamic map) => Member.fromMap(map)).toList();
    if (useChunks) {
      sendChunks(Event.loadData, members, itemsPerChunk: 100, delay: const Duration(milliseconds: 2));
    } else {
      send(Event.loadData, members);
    }
  }

  @override
  Map<Event, Function> get operations => {
        Event.loadData: _loadData,
      };

  static create(BackendArgument<void> argument) {
    ExampleBackend(argument, Dio());
  }
}

class Member {
  final int id;
  final DateTime date;
  final String type;
  final String role;
  final bool isActive;
  final String name;
  final String? company;
  final String? description;
  final String? image;
  final String github;

  const Member({
    required this.id,
    required this.date,
    required this.type,
    required this.role,
    required this.isActive,
    required this.name,
    required this.github,
    this.company,
    this.description,
    this.image,
  });

  factory Member.fromMap(Map<String, dynamic> map) {
    return new Member(
      id: map['MemberId'] as int,
      date: DateTime.parse(map['createdAt']),
      type: map['type'] as String,
      role: map['role'] as String,
      isActive: map['isActive'] as bool,
      name: map['name'] as String,
      company: map['company'] as String?,
      description: map['description'] as String?,
      image: map['image'] as String?,
      github: map['github'] as String,
    );
  }

  @override
  String toString() {
    return 'Member{id: $id, date: $date, type: $type, role: $role, isActive: $isActive, name: $name, company: $company, description: $description, image: $image, github: $github}';
  }
}
