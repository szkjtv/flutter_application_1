import 'package:flutter/material.dart';
import './study/list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: '首页的标题'),
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // 导航条区域
        appBar: AppBar(
          //首页导航栏
          title: const Text("首页"),
          centerTitle: true, //导航栏文字是否居中bool类型真假
          actions: <Widget>[
            IconButton(onPressed: (() {}), icon: Icon(Icons.search)) //这icon图标
          ],
        ),
        //隐藏的侧边栏内容区域
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0), //侧边栏贴紧边框不留缝
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              const UserAccountsDrawerHeader(
                accountName: Text("大爷"), //名称
                accountEmail: Text("test@outlook.com"), //邮箱
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(//这是网站图片路径
                      'https://img0.baidu.com/it/u=2926715223,1445444764&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500'),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, //图片宽度占满
                        image: NetworkImage(//这是网站图片路径
                            "https://img1.baidu.com/it/u=950982967,3309398304&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500"))),
              ),
              const ListTile(
                title: Text('用户反馈'),
                trailing: Icon(
                  (Icons.feedback),
                ),
              ),
              const ListTile(
                title: Text('系统设置'),
                trailing: Icon(
                  (Icons.settings),
                ),
              ),
              const ListTile(
                title: Text('我要发布'),
                trailing: Icon(
                  (Icons.send),
                ),
              ),
              const Divider(
                color: Colors.black,
              ), //分隔线
              const ListTile(
                title: Text('注销'),
                trailing: Icon(
                  (Icons.exit_to_app),
                ),
              )
            ],
          ),
        ),
        // 底部区域
        // ignore: prefer_const_literals_to_create_immutables
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.blue), //美化当前页面的内容
          height: 50, //底部菜单的高度
          child: const TabBar(
              labelStyle: TextStyle(
                height: 0, //底部菜单的高度
                fontSize: 10, //底部菜单字体的大小
              ),
              tabs: [
                Tab(
                  icon: Icon(Icons.movie_filter), //菜单图标
                  text: "学习", //菜单名称
                ),
                Tab(
                  icon: Icon(Icons.movie_creation), //菜单图标
                  text: "单词", //菜单名称
                ),
                Tab(
                  icon: Icon(Icons.local_atm), //菜单图标
                  text: "设置", //菜单名称
                ),
              ]),
        ),
        body: const TabBarView(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            Study(
              mt: '22222222',
            ),
            Study(
              mt: '333333',
            ),
            Study(
              mt: '44444',
            ),
          ],
        ),
      ),
    );
  }
}
