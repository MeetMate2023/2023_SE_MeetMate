import 'package:app_1/hobbylist.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  final int index;
  const Search({required this.index});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _search_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      appBar: AppBar(title: Text(Hobbys[widget.index])),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width*0.7,
            height: 50,
            child: TextField(controller: _search_controller),
          ),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.3,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemCount: detail_hobbys[widget.index].length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.25,
                    width: MediaQuery.of(context).size.width*0.25,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(child: Text(detail_hobbys[widget.index][index])),
                  ),
                );
              },
            ),
          ),

        ],
      ),

    )
    );
  }
}
