import 'package:flutter/material.dart';

void main(){
  runApp( Invitation() );
}

class Invitation extends StatelessWidget {
  const Invitation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(98, 71, 170, 100),
          title: const Text('Invitation ni Matthew Molina',
            style: TextStyle(
              color: Color.fromRGBO(16, 43, 63, 100),
              fontFamily: 'Poppins-Medium',
              fontSize: 16,
              fontWeight: FontWeight.bold

            ),
          ),
        ),

        body: Center(   
          child: Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(226, 207, 234, 1.0),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Will you be my valentine?',
                style: TextStyle(
                  color: Color.fromRGBO(191, 26, 47, 1.0),
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),
                ),
                const Text('some other text'),
                //button
              ],
            ),
          ),                                                                           
        )


      ),
    );
  }
}

Widget Text1(String data){
  return Text(data,
    style: TextStyle(
        color: Color.fromRGBO(16, 43, 63, 100),
        fontFamily: 'Poppins-Medium',
        fontSize: 16,
        fontWeight: FontWeight.bold
    ),
  );
}