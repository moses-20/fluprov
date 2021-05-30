import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyModel>(create: (context) => MyModel()),
        ChangeNotifierProvider<AnotherModel>(
            create: (context) => AnotherModel()),
      ],
      child: MaterialApp(
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.green[200],
                    child: Consumer<MyModel>(
                      builder: (context, value, child) {
                        return ElevatedButton(
                          onPressed: () {
                            value.doSomething();
                          },
                          child: Text('Do Something'),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(35),
                    color: Colors.blue,
                    child: Consumer<MyModel>(
                      builder: (context, value, child) {
                        return Text(value.someValue);
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.green[200],
                    child: Consumer<AnotherModel>(
                      builder: (context, value, child) {
                        return ElevatedButton(
                          onPressed: () {
                            value.doNumbers();
                          },
                          child: Text('Do Numbers'),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(35),
                    color: Colors.blue,
                    child: Consumer<AnotherModel>(
                      builder: (context, value, child) {
                        return Text('${value.someNumber}');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyModel with ChangeNotifier {
  String someValue = 'Hello';

  void doSomething() {
    someValue = 'Goodbye';
    print(someValue);
    notifyListeners();
  }
}

class AnotherModel with ChangeNotifier {
  int someNumber = 0;

  void doNumbers() {
    someNumber = 5;
    print(someNumber);
    notifyListeners();
  }
}
