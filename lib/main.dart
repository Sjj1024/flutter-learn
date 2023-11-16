import 'package:flutter/material.dart';
import 'package:flutter_app/pages/car.dart';
import 'package:flutter_app/pages/search.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/my.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 返回素材组件
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.deepPurple),
      // 其实要返回一个对象的，但是在flutter中，new可以省略，所以const MyHomePage()
      home: const Home(),
    );
  }
}

// 创建一个有状态的组件
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // tabbar
  var tabIndex = 0;

  // 页面组件
  var pageList = [HomePage(), SearchPage(), CarPage(), MyPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("电影频道"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              child: Center(
                child: Text("1024小神"),
              ),
              height: 100,
              // color: Colors.blue,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blue),
            ),
            ListTile(
              title: Text("淘宝购物"),
              leading: Icon(Icons.shop),
              trailing: Icon(Icons.legend_toggle),
            ),
            ListTile(
              title: Text("拼多多商城"),
              leading: Icon(Icons.piano),
              trailing: Icon(Icons.legend_toggle),
            ),
            ListTile(
              title: Text("京东优选"),
              leading: Icon(Icons.generating_tokens_sharp),
              trailing: Icon(Icons.legend_toggle),
            ),
            ListTile(
              title: Text("随便买买"),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.legend_toggle),
            ),
          ],
        ),
      ),
      body: pageList[tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "搜索"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded), label: "购物车"),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), label: "我的"),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: tabIndex,
        // backgroundColor: Colors.blue,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        selectedItemColor: Colors.blue,
        selectedLabelStyle: TextStyle(color: Colors.blue),
        onTap: (index) {
          print(index);
          setState(() {
            tabIndex = index;
          });
        },
      ),
    );
  }
}
