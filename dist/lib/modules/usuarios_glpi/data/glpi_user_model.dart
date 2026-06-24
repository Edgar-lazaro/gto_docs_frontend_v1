class GlpiUserModel {
  final int id;
  final String name;
  final String firstname;
  final String realname;

  const GlpiUserModel({
    required this.id,
    required this.name,
    required this.firstname,
    required this.realname,
  });

  String get fullName {
    final first = firstname.trim();
    final last = realname.trim();
    if (first.isNotEmpty && last.isNotEmpty) return '$first $last';
    if (last.isNotEmpty) return last;
    if (first.isNotEmpty) return first;
    return name;
  }
}
