import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpoddemo/AllProviders.dart';


// 1. widget class now extends [ConsumerWidget]
class Demo1 extends ConsumerWidget {
  @override
  // 2. build method has an extra [WidgetRef] argument
  Widget build(BuildContext context, WidgetRef ref) {
    // 3. use ref.watch() to get the value of the provider
    final helloWorld = ref.watch(helloWorldProvider);
    return Text(helloWorld);
  }
}

class Demo2 extends ConsumerStatefulWidget {
  @override
  ConsumerState createState() => Demo2State();
}
// 2. extend [ConsumerState]
class Demo2State extends ConsumerState {
  @override
  void initState() {
    super.initState();
    // 3. if needed, we can read the provider inside initState
    final helloWorld = ref.read(helloWorldProvider);
    print(helloWorld); // "Hello world"
  }

  @override
  Widget build(BuildContext context) {
    // 4. use ref.watch() to get the value of the provider
    final helloWorld = ref.watch(helloWorldProvider);
    return Text(helloWorld);
  }
}

class Demo3 extends ConsumerWidget {
  @override
  // 2. build method has an extra [WidgetRef] argument
  Widget build(BuildContext context, WidgetRef ref) {
    // 3. use ref.watch() to get the value of the provider
    final counterpro = ref.watch(counterProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: () {
            counterpro.decrement();
          },
          tooltip: 'Decrement',
          child: Icon(Icons.exposure_minus_1),
        ),
        Text(counterpro.counter.toString()),
        FloatingActionButton(
          onPressed: () {
            counterpro.increment();
          },
          tooltip: 'Increment',
          child: Icon(Icons.exposure_plus_1),
        ),

      ],
    );
  }
}

