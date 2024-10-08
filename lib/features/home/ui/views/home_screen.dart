import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:perfection_structure/core/base_network/network_lost/network_lost_service.dart';
import 'package:perfection_structure/core/component/p_button.dart';
import 'package:perfection_structure/core/component/text/p_text.dart';
import 'package:perfection_structure/core/component/text_field/p_textfield.dart';
import 'package:perfection_structure/core/constants/app_colors.dart';
import 'package:perfection_structure/core/constants/app_router.dart';
import 'package:perfection_structure/core/global/global_enum.dart';
import 'package:perfection_structure/main.dart';
import 'package:perfection_structure/shared/router_manager.dart';
import 'package:perfection_structure/shared/theme/theme_manager.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    context.push(AppRouter.courses);
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            //
            // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
            // action in the IDE, or press "p" in the console), to see the
            // wireframe for each widget.
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoButton(child:Text('data'), onPressed:() {
      
              },),
              TextButton(child:Text('data'), onPressed:() {
      
              },),
              PTextField(hintText:'User Name', feedback:(value) {
      
              }, validator:(value) {
      
              },),
              PText(title:'عمر عبدالعزيز', size:PSize.large,
                fontWeight:FontWeight.w900,),
              PButton(onPressed:() {
      
              },title:'click me',),
      
              const Text(
                'You have pushed the button this many times:',
                style:TextStyle(color:AppColors.whiteColor),
              ),
              Text(
                '$_counter',
                style:Theme.of(context).textTheme.titleMedium,
              ),
      
              ThemeSwitcher(
                clipper: const ThemeSwitcherCircleClipper(),
                builder: (context) {
                  return IconButton(
                    icon: Icon(
                      ThemeModelInheritedNotifier.of(context).theme.brightness ==
                          Brightness.light
                          ? Icons.dark_mode
                          : Icons.light_mode,
                    ),
                    onPressed: () {
                      var brightness =
                          ThemeModelInheritedNotifier.of(context).theme.brightness;
                      ThemeSwitcher.of(context).changeTheme(
                        theme:
                        brightness == Brightness.light ? Themes.darkTheme : Themes.lightTheme,
                        isReversed: brightness == Brightness.light ? true : false,
                        // isReversed: false,
                        // isReversed: true,
                      );
                    },
                  );
                },
              ),
      
              SwitchListTile(
                title: const Text('Toggle Theme'),
                value:ThemeManager.instance.currentThemeEnum == ThemeEnum.LIGHT,
                onChanged: (value) {
                  // if(ThemeManager.instance.currentThemeEnum == ThemeEnum.LIGHT){
                  //   ThemeManager.instance.changeTheme(ThemeEnum.DARK);
                  // }else{
                  //   ThemeManager.instance.changeTheme(ThemeEnum.LIGHT);
                  // }
                  ThemeManager.instance.switchTheme();
                  setState(() {

                  });
                  // themeProvider.toggleTheme();
                },
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

