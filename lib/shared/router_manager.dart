import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:perfection_structure/core/base_network/network_lost/network_info.dart';
import 'package:perfection_structure/core/base_network/network_lost/network_lost_service.dart';
import 'package:perfection_structure/core/base_network/network_lost/widget/network_lost_widget.dart';
import 'package:perfection_structure/core/constants/app_router.dart';
import 'package:perfection_structure/features/courses_list/presentation/pages/courses_screen.dart';
import 'package:perfection_structure/features/home/ui/views/home_screen.dart';
import 'package:perfection_structure/features/login/ui/views/login_screen.dart';

 GoRouter routerManager({bool networkStatus = true}){
   return GoRouter(
     initialLocation:AppRouter.initial,
     navigatorKey: navigatorKey,
     routes: [
       GoRoute(
         path:AppRouter.initial,
         builder: (context, state) =>  const HomeScreen(title:'Strucure',),
       ),
       GoRoute(
         path: AppRouter.login,
         builder: (context, state) => const LoginScreen(),
       ),
       // GoRoute(
       //   path: AppRouter.noInternet,
       //   builder: (context, state) =>  ConnectivityListenerWidget(),
       // ),
       GoRoute(
         path: AppRouter.courses,
         builder: (context, state) =>  CoursesScreen(),
       ),
       GoRoute(
         path:AppRouter.noInternet,
         builder: (context, state) =>  NetworkErrorPage(onRetry:() {

         },),
       ),
     ],
     redirect:(context, state) {
       // if(!networkStatus){
       //   if(state.name!=AppRouter.noInternet){
       //     NetworkLostService().showNetworkLostScreen();
       //   }
       // }else{
       //   if(state.name==AppRouter.noInternet){
       //     NetworkLostService().removeNetworkLostScreen();
       //   }
       // }
       // return null;
     },
     // redirect:(context, state) {
     //   List<ConnectivityResult>?connectivityResult;
     //   // NetworkManager().connectivityStream.listen((value) {
     //   //   connectivityResult=value;
     //   // },);
     //   // if (connectivityResult!.contains(ConnectivityResult.mobile)) {
     //   //   // Mobile network available.
     //   //   return null;
     //   // } else if (connectivityResult!.contains(ConnectivityResult.wifi)) {
     //   //   // Wi-fi is available.
     //   //   // Note for Android:
     //   //   // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
     //   //   return  null;
     //   // } else if (connectivityResult!.contains(ConnectivityResult.ethernet)) {
     //   //   // Ethernet connection available.
     //   //   return null;
     //   // } else if (connectivityResult!.contains(ConnectivityResult.vpn)) {
     //   //   // Vpn connection active.
     //   //   // Note for iOS and macOS:
     //   //   // There is no separate network interface type for [vpn].
     //   //   // It returns [other] on any device (also simulator)
     //   //   return null;
     //   // } else if (connectivityResult!.contains(ConnectivityResult.bluetooth)) {
     //   //   // Bluetooth connection available.
     //   //   return null;
     //   // } else if (connectivityResult!.contains(ConnectivityResult.other)) {
     //   //   // Connected to a network which is not in the above mentioned networks.
     //   //   return null;
     //   // } else if (connectivityResult!.contains(ConnectivityResult.none)) {
     //   //   // No available network types
     //   //   return AppRouter.noInternet;
     //   // }
     //   print('pathIs>>'+state.path.toString());
     //   return state.path;
     // },
   );
 }