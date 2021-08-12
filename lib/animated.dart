import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int? selectedIndex = 0;
  List<bool> selected = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            
            
            setState(() {
              selected[index] = !selected[index];
              

            });
          },
          child: Center(
            child: AnimatedContainer(
              margin: EdgeInsets.all(10),
              width: selected[index] ? 343.0 : 343.0,
              height: selected[index]? 250.0 : 145.0,
              color: selected[index] ? Colors.red : Colors.blue,
              alignment:
                  selected[index] ? Alignment.center : AlignmentDirectional.topCenter,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: const FlutterLogo(size: 75),
            ),
          ),
        );
      },
      itemCount: 10,
    );
  }
}
