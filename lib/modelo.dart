final String table = "my_table";

class ModelDatabase {
  static final List<String> values = [
    'id',
    'name',
    'age'
  ];
   static final String id = "id";
   static final String name = "name";
   static final String age = "age";

}

class Model {
  final int? id;
  final String name;
  final int age;

  const Model({
    this.id,
    required this.name,
    required this.age,
  });

  Model copy({
    int? id,
    String? name,
    int? age,
  }) =>
      Model(
        id: id ?? this.id,
        name: name ?? this.name,
        age: age ?? this.age,
      );

  static Model fromJson(Map<String, Object?> json) => Model(
        id: json[ModelDatabase.id] as int?,
        name: json[ModelDatabase.name] as String,
        age: json[ModelDatabase.age] as int,
      );

  Map<String, Object?> toJson() => {
        ModelDatabase.id: id,
        ModelDatabase.name: name,
        ModelDatabase.age: age,
      };
}