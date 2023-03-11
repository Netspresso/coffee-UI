import 'package:flutter/material.dart';

class CoffeTile extends StatelessWidget {
  final String coffeImagePath;
  final String coffeName;
  final String coffeDetails;
  final String coffePrice;

  CoffeTile({
    required this.coffeImagePath,
    required this.coffeName,
    required this.coffeDetails,
    required this.coffePrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black54,
        ),
        child: Column(
          children: [
            // image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                this.coffeImagePath,
                width: 160,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),

            // coffe name
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    this.coffeName,
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    this.coffeDetails,
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                ],
              ),
            ),

            // price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$ ${this.coffePrice}"),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(
                      Icons.add,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
