import 'package:flutter/material.dart';
import 'package:slashkey/core/fonts.dart';
import 'package:slashkey/presentation/search/screen_search.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Find products",
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w700,
                fontFamily: primaryFont,
                color: Colors.black
              ),
            ),
            Text(
              "from shops nearby",
              style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: primaryFont,
                  color: Colors.black
              ),
            ),
            SizedBox(height: 30.0,),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  showSearch(
                    context: context,
                    delegate: CustomSearch()
                  );
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      Text(
                        'Search for products...',
                        style: TextStyle(
                          color: Colors.black
                        ),
                      ),
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  primary: Colors.grey[200]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {
  List<String> allData = [
    'Aashirvaad atta',
    'atta',
    'ice cream',
    'amul'
  ];
  // List<Map> allData= [
  //   {
  //     "product": "Aashirvaad atta",
  //     "merchant_id": "1"
  //   },
  //   {
  //     "product": "Amul",
  //     "merchant_id": "2"
  //   },
  //   {
  //     "product": "Ice cream",
  //     "merchant_id": "3"
  //   },
  // ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: (){
            query = '';
          },
          icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
          close(context, null);
        },
        icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (query.length!=0) {
        if(item.toLowerCase().contains(query.toLowerCase())) {
          matchQuery.add(item);
        }
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenSearch(
                  result: result,
                ),
              )
            );
          },
          title: Text(
            result,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.0
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }
}