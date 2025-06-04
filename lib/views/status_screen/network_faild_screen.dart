import 'package:flutter/material.dart';

class NetworkFaildScreen extends StatefulWidget {
  const NetworkFaildScreen({super.key});

  @override
  State<NetworkFaildScreen> createState() => _NetworkFaildScreenState();
}

class _NetworkFaildScreenState extends State<NetworkFaildScreen> {
  @override
  Widget build(BuildContext context) {
    return  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wifi_off,
                size: 80,
                color: Colors.grey,
              ),
              SizedBox(height: 20),
              Text(
                "No Internet Connection",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Please check your internet connection\nand try again",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 30),
      
            ],
          ),
        );
  }
}