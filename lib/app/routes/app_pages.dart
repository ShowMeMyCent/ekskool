import 'package:get/get.dart';

import '../modules/about_page/bindings/about_page_binding.dart';
import '../modules/about_page/views/about_page_view.dart';
import '../modules/absensi/bindings/absensi_binding.dart';
import '../modules/absensi/views/absensi_view.dart';
import '../modules/admin_page/bindings/admin_page_binding.dart';
import '../modules/admin_page/views/admin_page_view.dart';
import '../modules/detail_user_page/bindings/detail_user_page_binding.dart';
import '../modules/detail_user_page/views/detail_user_page_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/landing_screen_view.dart';
import '../modules/info/bindings/info_binding.dart';
import '../modules/info/views/info_view.dart';
import '../modules/isi_data_user_page/bindings/isi_data_user_page_binding.dart';
import '../modules/isi_data_user_page/views/isi_data_user_page_view.dart';
import '../modules/list_users_page/bindings/list_users_page_binding.dart';
import '../modules/list_users_page/views/list_users_page_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/tambah_informasi/bindings/tambah_informasi_binding.dart';
import '../modules/tambah_informasi/views/tambah_informasi_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => LandingScreenView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ABSENSI,
      page: () => const AbsensiView(),
      binding: AbsensiBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.INFO,
      page: () => const InfoView(),
      binding: InfoBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_PAGE,
      page: () => AdminPageView(),
      binding: AdminPageBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_INFORMASI,
      page: () => const TambahInformasiView(),
      binding: TambahInformasiBinding(),
    ),
    GetPage(
      name: _Paths.ISI_DATA_USER_PAGE,
      page: () => IsiDataUserPageView(),
      binding: IsiDataUserPageBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_PAGE,
      page: () => const AboutPageView(),
      binding: AboutPageBinding(),
    ),
    GetPage(
      name: _Paths.LIST_USERS_PAGE,
      page: () => const ListUsersPageView(),
      binding: ListUsersPageBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_USER_PAGE,
      page: () => const DetailUserPageView(),
      binding: DetailUserPageBinding(),
    ),
  ];
}
