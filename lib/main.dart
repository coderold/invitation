import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const Invitation());
}

class Invitation extends StatefulWidget {
  const Invitation({super.key});

  @override
  State<Invitation> createState() => _InvitationState();
}

class _InvitationState extends State<Invitation> {
  bool hasAccepted = false;
  int rejectionCount = 0; // The silent counter

  final List<String> noMessages = [
    "ahh may gamot? oki",
    "ahh aalis kayo? oki",
    "bat kayo aalis?",
    "sure ka na ba dyan??",
  ];

  void showNoPopup() {
    // Increment the counter every time the popup is triggered
    setState(() {
      rejectionCount++;
    });

    final randomMessage = noMessages[Random().nextInt(noMessages.length)];
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('X', style: TextStyle(fontWeight: FontWeight.bold)),
        content: Text(randomMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(98, 71, 170, 1.0),
          title: const Text(
            'Invitation ni Matthew Molina',
            style: TextStyle(
              color: Color.fromRGBO(16, 43, 63, 1.0),
              fontFamily: 'Poppins-Medium',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(
          child: hasAccepted ? buildPlansPage() : buildInvitePage(),
        ),
      ),
    );
  }

  Widget buildInvitePage() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(226, 207, 234, 1.0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Will you be my valentine?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(191, 26, 47, 1.0),
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                hasAccepted = true;
              });
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text('YES', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: showNoPopup, // Triggers the counter and the popup
            child: const Text('No', style: TextStyle(color: Color.fromARGB(255, 117, 0, 0))),
          ),
        ],
      ),
    );
  }

  Widget buildPlansPage() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(207, 234, 214, 1.0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Dapat Lang😎',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text('Di ko po alam anong oras ka pa available,'),
          const Text('basta may pasok ako bukas 1-7pm'),
          const Text('tapos pwede na tayo maglambingan 😘'),
          
          // The Funny Reveal: Only shows if she pressed "No" at least once
          if (rejectionCount > 0) ...[
            const SizedBox(height: 30),
            const Divider(color: Colors.black26),
            Text(
              'Ilang beses ka nag no hahah: $rejectionCount',
              style: const TextStyle(
                color: Colors.redAccent,
                fontSize: 13,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ],
      ),
    );
  }
}