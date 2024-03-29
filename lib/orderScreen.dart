import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food/utils/ThemeManager.dart';
import 'package:food/utils/app_const.dart';
import 'package:food/utils/text_style.dart';

import 'model/customerInfoModel.dart';
import 'package:http/http.dart' as http;

class orderScreen extends StatefulWidget {
  const orderScreen({super.key});

  @override
  State<orderScreen> createState() => _orderScreenState();
}

class _orderScreenState extends State<orderScreen> {
  List<CustomerInfo> userList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      //----------------------------appbar--------------------------------
      appBar: AppBar(
        title: Text('Order List',
            textAlign: TextAlign.center,
            style: aveNirLTProBlack.copyWith(
              fontSize: width * 0.05,
              fontWeight: FontWeight.w600,
              color: ThemeManager().getBlackColor,
            )),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: (context, AsyncSnapshot<List<CustomerInfo>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      final user = userList[index];
                      return Slidable(
                        startActionPane: ActionPane(
                          motion: const BehindMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {},
                              backgroundColor: Colors.green,
                              icon: Icons.update,
                              label: 'Update',
                            ),
                          ],
                        ),
                        endActionPane: ActionPane(
                          motion: const BehindMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {},
                              backgroundColor: Colors.red,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                          ],
                        ),
                        child: Container(
                          child: ListTile(
                            // leading: Text(user.id.toString()),
                            minLeadingWidth: kIsWeb ? 200 : null,
                            leading: Container(
                                child: Image.network(
                              user.url.toString(),
                              height: kIsWeb ? 200 : null,
                              width: kIsWeb ? 180 : null,
                              scale: kIsWeb ? 1.0 : 0.3,
                              fit: BoxFit.cover,
                            )),

                            title: Container(
                              color: Colors.red[200],
                              child: Column(
                                children: [
                                  Text(user.id.toString(),
                                      textAlign: TextAlign.center,
                                      style: aveNirLTProBlack.copyWith(
                                          fontSize: width * 0.033,
                                          fontWeight: FontWeight.w600,
                                          color: ThemeManager().getBlackColor)),
                                  Text(user.title.toString(),
                                      textAlign: TextAlign.center,
                                      style: aveNirLTProBlack.copyWith(
                                        fontSize: width * 0.05,
                                        fontWeight: FontWeight.w600,
                                        overflow: TextOverflow.ellipsis,
                                        color: ThemeManager().getBlackColor,
                                      )),
                                ],
                              ),
                            ),
                            // subtitle: Text(user.company.toString()),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  //-------------------------------get user api--------------------------------
  Future<List<CustomerInfo>> getUserApi() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (var i in data) {
        userList.add(CustomerInfo.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }
}

class ReusbaleRow extends StatelessWidget {
  String url;

  String id;
  String title;

  ReusbaleRow(
      {Key? key, required this.url, required this.id, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(url),
              Column(
                children: [
                  Text(id),
                  Text(title),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
