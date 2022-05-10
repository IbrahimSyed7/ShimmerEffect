import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shimmer_example/Model/Universities.dart';
import 'package:shimmer_example/Network/NetworkClient.dart';

class ShimmerExample extends StatefulWidget {
  const ShimmerExample({Key? key}) : super(key: key);

  @override
  State<ShimmerExample> createState() => _ShimmerExampleState();
}

class _ShimmerExampleState extends State<ShimmerExample> {
  late Future<List<Universities>> universitiesList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    universitiesList = new NetworkClient().getUniversities();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xffeceded),
      child: FutureBuilder<List<Universities>>(
        future: universitiesList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, position) {
                  return Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data![position].name.toString(),
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        SizedBox(height: 6,),
                        Text(
                          snapshot.data![position].domains.toString(),
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(height: 4,),
                        Text(
                          snapshot.data![position].country.toString(),
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return Shimmer.fromColors(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (_, __) {
                    return Container(
                      padding: EdgeInsets.all(6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.65,
                            height: 50,
                            margin: EdgeInsets.only(top: 5),
                            color: Colors.grey,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 20,
                            color: Colors.grey,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 6),
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: 10,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    );
                  }),
              baseColor: Color(0xffd3cfcf),
              highlightColor: Color(0xfff3eeee),
            );
          }
        },
      ),
    );
  }
}
