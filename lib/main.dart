import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 返回素材组件
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.deepPurple),
      // 其实要返回一个对象的，但是在flutter中，new可以省略，所以const MyHomePage()
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // 为了提高性能
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 返回一个Scaffold脚手架：带有title，appbar，body，底部按钮的脚手架
    return Scaffold(
        appBar: AppBar(
          title: const Text('电影列表'),
          // 标题居中
          centerTitle: true,
          // 右边的搜索按钮行为：一个widget数组，
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                print("点击了搜索");
              },
            ),
            IconButton(
                onPressed: () {
                  print("点击了发送");
                },
                icon: const Icon(Icons.send))
          ],
        ),
        // body: Image.asset("images/squick.png"),
        body: Image.network(
            "https://img-blog.csdnimg.cn/ba8cec54e8fc4e0193c100470b1eb24d.png"));
  }
}
