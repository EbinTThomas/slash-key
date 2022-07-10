import 'package:flutter/material.dart';
import 'package:slashkey/presentation/shop/screen_shop.dart';

class ScreenSearch extends StatefulWidget {
  ScreenSearch({Key? key, required this.result}) : super(key: key);

  final String result;

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  List<Map> allData= [
    {
      "product": "Aashirvaad atta",
      "merchant_id": 1,
      "shop_name": "sabumonte kada",
      "distance": 2
    },
    {
      "product": "Amul",
      "merchant_id": 2,
      "shop_name": "shibunte kada",
      "distance": 1.4
    },
    {
      "product": "Ice cream",
      "merchant_id": 3,
      "shop_name": "kunjappante kada",
      "distance": 5.2
    },
    {
      "product": "Amul",
      "mechant_id": 4,
      "shop_name": "rayannante kada",
      "distance": 1.1
    }
  ];

  List<Map> matchQuery = [];

  @override
  void initState() {
    super.initState();
    getQuery();
  }

  void getQuery() {
    for (var item in allData) {
      if(item["product"].toLowerCase().contains(widget.result.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    // for (var i=0; i<matchQuery.length; i++) {
    //   Map temp;
    //   if(matchQuery[i]["distance"]>matchQuery[i+1]["distance"]) {
    //     temp=matchQuery[i];
    //     matchQuery[i+1]=matchQuery[i];
    //     matchQuery[i]=temp;
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Search Results for ", style: TextStyle(fontSize: 12, color: Colors.black),),
            Text('"${widget.result}"', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, color: Colors.black),),
          ],
        ),
      ),
      body: Container(
        child: ListViewWidget(matchQuery: matchQuery,)
      )
    );
  }
}

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key, required this.matchQuery}) : super(key: key);
  final List<Map> matchQuery;
  @override
  Widget build(BuildContext context) {
    if (matchQuery.length != 0) {
      return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ScreenShop(
                          merchant_id: result["merchant_id"],
                        ),
                  )
              );
            },
            title: Text(
              result["shop_name"],
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0
              ),
            ),
          );
        },
      );
    } else {
      return Text("0 Results");
    }
  }
}
