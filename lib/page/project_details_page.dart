import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:homework5/models/project.dart';

class ProjectDetailsPage extends StatelessWidget {
  final Project project;

  const ProjectDetailsPage({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var descriptionStyle = const TextStyle(
      fontSize: 12.0,
      color: Colors.black54,
    );
    var amountStyle = const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.black54,
    );

    var formatter = NumberFormat('#,###,000');
    var target = formatter.format(project.targetAmount);
    var percentText =
    ((project.receiveAmount / project.targetAmount) * 100)
        .toStringAsFixed(0);
    var percent = int.tryParse(percentText);
    var recieve = formatter.format(project.receiveAmount);
    var cart = ' หยิบใส่รถเข็น';
    var donate = ' บริจาค';


    return Scaffold(

      appBar: AppBar(
          title: Text(
            project.title,
            overflow: TextOverflow.ellipsis,
          )),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.yellow[50],
            ),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child:
                    Text(
                      project.title,
                      style: TextStyle(fontSize: 22,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset(
                      project.imageURL,
                      height: 240,
                      width: 500,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            project.detail,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ระยะเวลาโครงการ',
                          style: TextStyle(fontSize: 15, color: Colors.black45),
                        ),
                        Expanded(
                          child: Text(
                            project.time,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'พื้นที่ดำเนินโครงการ',
                          style: TextStyle(fontSize: 15, color: Colors.black45),
                        ),
                        Expanded(
                          child: Text(
                            project.place,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 15,
                    offset: const Offset(0, 15),
                  )
                ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 4.0),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('ยอดบริจาคขณะนี้', style: TextStyle(fontSize: 18.0, color: Colors.black),
                                ),
                                Text('$recieve บาท', style: TextStyle(fontSize: 20.0, color: Colors.deepOrangeAccent,),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('เป้าหมาย', style: descriptionStyle),
                                Text('$target บาท', style: amountStyle),
                              ],
                            ),
                            Text('$percentText%', style: descriptionStyle),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: percent!,
                              child: Container(
                                height: 10.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 0.0),
                                color: Colors.orange,
                              ),
                            ),
                            Expanded(
                              flex: 100 - percent,
                              child: Container(
                                height: 10.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 0.0),
                                color: const Color(0xFFE8E8E8), //Colors.grey[200],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('${project.duration} วัน', style: descriptionStyle),
                            Row(
                              children: [
                                const Icon(Icons.person, size: 14.0),
                                Text('${project.donateCount}',
                                    style: descriptionStyle),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: ElevatedButton(
                                    onPressed: (){},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.favorite_border, size: 12.0,),
                                        Text('$donate', style: TextStyle(color: Colors.white),),
                                      ],
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: ElevatedButton(
                                    onPressed: (){},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.shopping_cart,size: 12.0,),
                                        Text('$cart',style: TextStyle(color: Colors.white),),
                                      ],
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 15,
                    offset: const Offset(0, 15),
                  )
                ]
            ),
            child: Column(
              children: [
                Text('แชร์ให้เพื่อน'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Line(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Facebook(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Twitter(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget Line(){
  return IconButton(
    // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
      icon: FaIcon(FontAwesomeIcons.line),
      color: Colors.grey,
      onPressed: () {  }
  );
}

Widget Facebook(){
  return IconButton(
    // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
      icon: FaIcon(FontAwesomeIcons.facebook),
      color: Colors.grey,
      onPressed: () {  }
  );
}

Widget Twitter(){
  return IconButton(
    // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
      icon: FaIcon(FontAwesomeIcons.twitter),
      color: Colors.grey,
      onPressed: () {  }
  );
}