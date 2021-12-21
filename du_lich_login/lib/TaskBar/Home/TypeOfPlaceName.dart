import 'package:flutter/material.dart';

class TypeOfPlaceName extends StatefulWidget {
  const TypeOfPlaceName({ Key? key }) : super(key: key);

  @override
  _TypeOfPlaceNameState createState() => _TypeOfPlaceNameState();
}

class _TypeOfPlaceNameState extends State<TypeOfPlaceName> {

  List<String> typeofplacename = ["Phượt", "Nghĩ dưỡng", "Dã ngoại", "Cắm trại"];
  int selecindex = 0; 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: typeofplacename.length,
        itemBuilder: (context, index) => text_typeofplacename(index)
        ),
    );
  }

  Widget text_typeofplacename(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selecindex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kRadialReactionRadius),
        child: Text(
          typeofplacename[index], style: TextStyle(
            fontSize: 15, 
            color: selecindex == index ? Colors.blue : Colors.grey,
            fontWeight: FontWeight.bold,
            ),
        ),
      ),
    );
  }
}
