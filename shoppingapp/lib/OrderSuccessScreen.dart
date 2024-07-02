import 'package:flutter/material.dart';
import 'package:shoppingapp/homepage.dart';

class Ordersuccessscreen extends StatelessWidget {
  const Ordersuccessscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.verified,
              size: 60,
              color: Colors.purple,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Order Successful",
              style: TextStyle(color: Colors.purple.shade600, fontSize: 28),
            ),
            SizedBox(
              height: 70,
            ),
            SizedBox(
              width: 300,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade800,
                ),
                onPressed: () {
                  Navigator.of(context).pop(
                    MaterialPageRoute(
                      builder: (context) => Homepage(),
                    ),
                  );
                },
                child: Text(
                  'Back To Home',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
