import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpoddemo/CounterValue.dart';

final helloWorldProvider = Provider((ref)=>'Hello world');
final counterProvider = ChangeNotifierProvider((ref)=>CounterValue());