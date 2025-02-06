class Category {
  String? id;
  String title;
  int tasks;
  String icon;

  Category({
    this.id,
    required this.title,
    required this.tasks,
    required this.icon,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'tasks': tasks,
      'icon': icon,
    };
  }

  factory Category.fromJson(Map<String, dynamic> json, String id) {
    return Category(
      id: id,
      title: json['title'],
      tasks: json['tasks'],
      icon: json['icon'],
    );
  }
}
