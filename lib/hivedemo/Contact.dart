import 'package:hive/hive.dart';
part 'Contact.g.dart';
@HiveType(typeId: 1)
class Contact extends HiveObject
{
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? phone;
  @HiveField(2)
  String? email;
  Contact(this.name,this.phone,this.email);
}