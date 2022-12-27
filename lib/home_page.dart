import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
  String urlImage = "https://images.unsplash.com/photo-1663339198008-cf114a706df7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzMXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hello App",
          style: TextStyle(
            color: Colors.orange,
            fontSize: 30,
          ),
        ),
        leading: Icon(
          Icons.menu,
          color: Colors.orange,
          size: 40,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(

                "Hello Word",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 30
                ),
              ),
              Text(
                "Welcom to app",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                ),
              ),
              Row(
                children:  [
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 30,

                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 30,

                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 30,

                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 30,

                  ),
                  Icon(
                    Icons.star,
                    color: Colors.grey,
                    size: 30,

                  ),
                  Text(
                    "50 ratings",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                    ),
                  )
                ],
              ),
              Image.network(urlImage),
              Image.asset("assets/images/IMG_1777.jpg")
  
            ],
          ),
        ),
      ),
    );
  }
}
