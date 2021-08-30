import 'package:covid/utils/styles.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _isScrolled = false;
  final ScrollController _scrollController = new ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _scrollController.addListener(() {
      double curPos = _scrollController.position.pixels;
      setState(() {
        _isScrolled = curPos > 150 ? true : false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 42,
        backgroundColor: AppStyles.primaryColor,
        title: !_isScrolled
            ? Text(
                "MySejahtera",
                style: TextStyle(fontSize: 30),
              )
            : Center(
                child: Text("MySejahtera"),
              ),
        leading: Container(),
        leadingWidth: 0,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                  color: AppStyles.primaryColor,
                ),
                height: 150,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Card(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
