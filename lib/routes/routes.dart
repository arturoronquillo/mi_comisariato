import 'package:get/route_manager.dart';
import 'package:mi_comisariato/pages/cupones.dart';
import 'package:mi_comisariato/pages/escanearGiftCard.dart';
import 'package:mi_comisariato/pages/home.dart';
import 'package:mi_comisariato/pages/itempreciosBajosDetalle.dart';
import 'package:mi_comisariato/pages/login.dart';
import 'package:mi_comisariato/pages/preciosBajos.dart';
import 'package:mi_comisariato/pages/signup.dart';
import 'package:mi_comisariato/pages/tarjetaAfiliadoPage.dart';

class Routes {
  static List<GetPage> getRoutes() => [
        GetPage(name: "/", page: () => HomePage()),
        GetPage(
            name: "/home", page: () => HomePage(), transition: Transition.fade),
        GetPage(name: "/login", page: () => LoginPage()),
        GetPage(
            name: "/signup",
            page: () => SignupPage(),
            transition: Transition.fade),
        GetPage(
            name: "/itemPreciosBajosDetalle",
            page: () => ItemPreciosBajosDetalle(),
            transition: Transition.fade),
        GetPage(
            name: "/preciosBajos",
            page: () => PreciosBajosPage(),
            transition: Transition.fade),
        GetPage(
            name: "/escanearGiftCardPage",
            page: () => EscanearGiftCardPage(),
            transition: Transition.fade),
        GetPage(
            name: "/tarjetaAfiliadoPage",
            page: () => TarjetaAfiliadoPage(),
            transition: Transition.fade),
        GetPage(
            name: "/cuponesPage",
            page: () => CuponesPage(),
            transition: Transition.fade),
      ];
}
