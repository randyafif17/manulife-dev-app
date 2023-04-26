import 'package:get/get.dart';

import '../modules/AgencyLink/bindings/agency_link_binding.dart';
import '../modules/AgencyLink/views/agency_link_view.dart';

import '../modules/form_link/bindings/form_link_binding.dart';
import '../modules/form_link/views/form_link_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/mieclaim/bindings/mieclaim_binding.dart';
import '../modules/mieclaim/views/mieclaim_view.dart';
import '../modules/mipos/bindings/mipos_binding.dart';
import '../modules/mipos/views/mipos_view.dart';
import '../modules/nasabah/bindings/nasabah_binding.dart';
import '../modules/nasabah/views/nasabah_view.dart';
import '../modules/partnerlink/bindings/partnerlink_binding.dart';
import '../modules/partnerlink/views/partnerlink_view.dart';
import '../modules/tenaga_pemasar/bindings/tenaga_pemasar_binding.dart';
import '../modules/tenaga_pemasar/views/tenaga_pemasar_view.dart';
import '../modules/vlc_video/bindings/vlc_video_binding.dart';
import '../modules/vlc_video/views/vlc_video_view.dart';
import '../modules/web_manulife/bindings/web_manulife_binding.dart';
import '../modules/web_manulife/views/web_manulife_view.dart';
import '../modules/web_miaccount/bindings/web_miaccount_binding.dart';
import '../modules/web_miaccount/views/web_miaccount_view.dart';

// ignore_for_file: constant_identifier_names, prefer_const_constructors

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NASABAH,
      page: () => const NasabahView(),
      binding: NasabahBinding(),
    ),
    GetPage(
      name: _Paths.TENAGA_PEMASAR,
      page: () => const TenagaPemasarView(),
      binding: TenagaPemasarBinding(),
    ),
    GetPage(
      name: _Paths.WEB_MIACCOUNT,
      page: () => WebMiAccount(),
      binding: WebMiaccountBinding(),
    ),
    GetPage(
      name: _Paths.MIECLAIM,
      page: () => const MieclaimView(),
      binding: MieclaimBinding(),
    ),
    GetPage(
      name: _Paths.WEB_MANULIFE,
      page: () => const WebManulifeView(),
      binding: WebManulifeBinding(),
    ),
    GetPage(
      name: _Paths.AGENCY_LINK,
      page: () => const AgencyLinkView(),
      binding: AgencyLinkBinding(),
    ),
    GetPage(
      name: _Paths.PARTNERLINK,
      page: () => const PartnerlinkView(),
      binding: PartnerlinkBinding(),
    ),
    GetPage(
      name: _Paths.MIPOS,
      page: () => const MiposView(),
      binding: MiposBinding(),
    ),
    // GetPage(
    //   name: _Paths.CUSTOM_APPBAR,
    //   page: () => const CustomAppbarView(),
    //   binding: CustomAppbarBinding(),
    // ),
    GetPage(
      name: _Paths.VLC_VIDEO,
      page: () => VlcVideoView(),
      binding: VlcVideoBinding(),
    ),
    GetPage(
      name: _Paths.FORM_LINK,
      page: () =>  FormLinkView(),
      binding: FormLinkBinding(),
    ),
  ];
}
