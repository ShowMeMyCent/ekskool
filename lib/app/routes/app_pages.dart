import 'package:get/get.dart';

import '../modules/absensi/bindings/absensi_binding.dart';
import '../modules/absensi/views/absensi_view.dart';
import '../modules/admin_page/bindings/admin_page_binding.dart';
import '../modules/admin_page/views/admin_page_view.dart';
import '../modules/detail_ekskul/bindings/detail_ekskul_binding.dart';
import '../modules/detail_ekskul/views/detail_ekskul_view.dart';
import '../modules/detail_history/bindings/detail_history_binding.dart';
import '../modules/detail_history/views/detail_history_view.dart';
import '../modules/detail_informasi/bindings/detail_informasi_binding.dart';
import '../modules/detail_informasi/views/detail_informasi_view.dart';
import '../modules/detail_user_page/bindings/detail_user_page_binding.dart';
import '../modules/detail_user_page/views/detail_user_page_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/ekskulmenu/bindings/ekskulmenu_binding.dart';
import '../modules/ekskulmenu/views/ekskulmenu_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/landing_screen_view.dart';
import '../modules/isi_data_user_page/bindings/isi_data_user_page_binding.dart';
import '../modules/isi_data_user_page/views/isi_data_user_page_view.dart';
import '../modules/list_users_page/bindings/list_users_page_binding.dart';
import '../modules/list_users_page/views/list_users_page_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/tambah_ekskul/bindings/tambah_ekskul_binding.dart';
import '../modules/tambah_ekskul/views/tambah_ekskul_view.dart';
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
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ABSENSI,
      page: () => AbsensiView(),
      binding: AbsensiBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_PAGE,
      page: () => const AdminPageView(),
      binding: AdminPageBinding(),
    ),
    GetPage(
      name: _Paths.ISI_DATA_USER_PAGE,
      page: () => IsiDataUserPageView(),
      binding: IsiDataUserPageBinding(),
    ),
    GetPage(
      name: _Paths.LIST_USERS_PAGE,
      page: () => const ListUsersPageView(),
      binding: ListUsersPageBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_USER_PAGE,
      page: () => DetailUserPageView(),
      binding: DetailUserPageBinding(),
    ),
    GetPage(
      name: _Paths.EKSKULMENU,
      page: () => const EkskulmenuView(),
      binding: EkskulmenuBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_EKSKUL,
      page: () => TambahEkskulView(),
      binding: TambahEkskulBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_INFORMASI,
      page: () => const TambahInformasiView(),
      binding: TambahInformasiBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_HISTORY,
      page: () => DetailHistoryView(),
      binding: DetailHistoryBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_EKSKUL,
      page: () => DetailEkskulView(),
      binding: DetailEkskulBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_INFORMASI,
      page: () => DetailInformasiView(),
      binding: DetailInformasiBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
  ];
}
