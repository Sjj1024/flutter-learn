import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/dialog.dart';
import 'package:flutter_app/pages/car.dart';
import 'package:flutter_app/pages/cate.dart';
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
  var count = 0;
  var age = 18;

  // 添加状态
  var inputRes = "";

  // tabbar
  var tabIndex = 0;

  // 页面组件
  var pageList = [HomePage(), CatePage(), CarPage(), MyPage()];

  void addCount() {
    setState(() {
      count += 1;
    });
    age += 1;
  }

  // 输入框控制器
  void showDia() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("确定退出登录吗"),
            content: Text("退出登录将不保存记录退出登录将不保存记录退出登录将不保存记录"),
            actions: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("确认")),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("取消"))
                  ],
                ),
              )
            ],
          );
        });
  }

  // 发送网络请求
  void getInfo() async {
    Dio dio = Dio();
    var res = await dio.get("http://192.168.1.171:5000/control");
    print(res.data.toString());
  }

  // 登录请求
  void login() async {
    Dio dio = Dio();
    var res = await dio.post("http://192.168.1.171:5000/login",
        data: {"username": "xugaoxiang", "password": "xugaoxiang"});
    print(res.data.toString());
    Get.snackbar("返回数据", res.data.toString());
  }

  // 跳转到我的主页
  void toMyPage() {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return MyPage();
    }));
  }

  // 我的组件弹窗
  void showMyDia() {
    showDialog(
        context: context,
        builder: (_) {
          return const MyDialog();
        });
  }

  // 展示从底部的弹窗
  void showBottom() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            height: 100,
            alignment: Alignment.center,
            child: const Text(
              "底部内容",
              style: TextStyle(color: Colors.red),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("电影频道"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [IconButton(icon: const Icon(Icons.add), onPressed: addCount)],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text("抽屉首页")),
            ListTile(
              title: Text("我的首页"),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.legend_toggle),
            ),
            ListTile(
              title: Text("我的首页"),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.legend_toggle),
            ),
            ListTile(
              title: Text("我的首页"),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.legend_toggle),
            ),
            ListTile(
              title: Text("我的首页"),
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
        currentIndex: tabIndex,
        backgroundColor: Colors.blue,
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
