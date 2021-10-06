import 'package:hive/hive.dart';

part 'details.g.dart';

@HiveType(typeId: 0)
class Details {

  @HiveField(0)
  final String productID;

  @HiveField(1)
  final int quantity;

  Details(this.productID,this.quantity);
}
