import 'package:flutter/material.dart';

class ScreenShop extends StatefulWidget {
  const ScreenShop({Key? key, required this.merchant_id}) : super(key: key);

  final int merchant_id;

  @override
  State<ScreenShop> createState() => _ScreenShopState();
}

class _ScreenShopState extends State<ScreenShop> {
  Map merchantDetails = {
    "id": 1,
    "owner": "rayannan",
    "address": "address",
    "distance": 2,
  };

  List<Map> products = [
    {
      "id": 1,
      "merchant_id": 2,
      "name": "amul",
      "price": 120,
    },
    {
      "id": 2,
      "merchant_id": 2,
      "name": "atta",
      "price": 12,
    },
    {
      "id": 3,
      "merchant_id": 2,
      "name": "frooty",
      "price": 10,
    },
    {
      "id": 4,
      "merchant_id": 2,
      "name": "lays",
      "price": 5,
    },
  ];

  List<Map> productQuery = [];

  @override
  void initState() {
    super.initState();
    getProductsQuery();
    print(productQuery);
  }

  void getProductsQuery() {
    for (var item in products) {
      if(item["merchant_id"]==widget.merchant_id) {
        productQuery.add(item);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            merchantDetails["owner"],
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
        ),
      body: Container(
        child: ListViewWidget(productQuery: productQuery,),
      ),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key, required this.productQuery}) : super(key: key);
  final List<Map> productQuery;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productQuery.length,
      itemBuilder: (context, index) {
        var product = productQuery[index];
        return ListTile(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) =>
            //           ScreenShop(
            //             merchant_id: result["merchant_id"],
            //           ),
            //     )
            // );
          },
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product["name"],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Rs ${product["price"]}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey[300],
                thickness: 5,
              )
            ],
          ),
        );
      },
    );
  }
}