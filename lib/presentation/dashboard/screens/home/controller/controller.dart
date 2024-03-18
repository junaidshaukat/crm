import 'package:flutter/material.dart';
import '/core/app_export.dart';
export './compaigns.dart';
export './recurring.dart';

class ChannelType {
  dynamic id;
  String label;
  String value;
  RxBool isSelectedSwitch;

  ChannelType({
    this.id,
    this.label = '',
    this.value = '',
    required this.isSelectedSwitch,
  });
}

class HomeController extends GetxController {
  EnvConfig env = EnvConfig();
  Props props = Props();

  Props propsProfile = Props();
  Rx<ProfileData> profile = Rx(ProfileData());

  Props propsOrganizations = Props();
  Rx<List<Organizations>> organizations = Rx([]);

  Props propsDonorsAndFollowers = Props();
  Rx<DonorsAndFollowers> donorsAndFollowers = Rx(
    DonorsAndFollowers(donors: 0, followers: 0),
  );

  Props propsTotalTransactions = Props();
  Rx<TotalTransactions> totalTransactions = Rx(
    TotalTransactions(total: 0),
  );

  Props propsThisYearTransactions = Props();
  Rx<ThisYearTransactions> thisYearTransactions = Rx(
    ThisYearTransactions(total: 0),
  );

  Props propsDonationSince = Props();
  Rx<DonationSince> donationSince = Rx(
    DonationSince(
      donation: '0',
      currencySymbol: '\$',
      signupDate: DateTime.now().formatYYYYMMDD,
    ),
  );

  Props propsDonationYear = Props();
  Rx<DonationYear> donationYear = Rx(
    DonationYear(
      donation: '0',
      currencySymbol: '\$',
      year: DateTime.now().year.toString(),
    ),
  );

  Props propsDonationDay = Props();
  Rx<DonationDay> donationDay = Rx(
    DonationDay(
      total: 0,
      currencySymbol: '\$',
      values: [],
    ),
  );

  Props propsDonationMonth = Props();
  Rx<DonationMonth> donationMonth = Rx(
    DonationMonth(
      total: 0,
      currencySymbol: '\$',
      values: [],
    ),
  );

  Rx<String> year = Rx(DateTime.now().year.toString());
  Rx<DateTime> date = Rx(DateTime.now());
  Rx<String> month = Rx(DateTime.now().month.toString().padLeft(2, '0'));

  @override
  void onInit() {
    super.onInit();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }

  @override
  void onReady() async {
    super.onReady();
    await ready();
  }

  Future ready() async {
    await Future.wait([
      getOrganizations(),
      getDonationDay(),
      getDonationMonth(),
      getDonationSince(),
      getDonationYear(),
      getDonorsAndFollowers(),
      getThisYearTransactions(),
      getTotalTransactions(),
    ]);
  }

  Future onRefresh() async {
    await ready();
  }

  Organizations get getOrganization {
    return organizations.value.singleWhere(
      (organization) => organization.tagNumber == profile.value.organizationTag,
    );
  }

  Future getOrganizations() async {
    try {
      propsProfile.useState(UseState.loading);
      propsOrganizations.useState(UseState.loading);

      ProfileRes response = await Get.find<Api>().dashboard.getOrganizations();
      if (response.result == true) {
        profile(response.data);
        for (var org in profile.value.organizations!) {
          if (org.tagNumber == profile.value.organizationTag) {
            await env.putAll({
              'gatewayNodeTag': org.gatewayNodeTag,
            });
          }
        }

        await env.putAll({
          'organizationTag': profile.value.organizationTag,
        });
        organizations(response.data?.organizations);
        propsProfile.useState(UseState.done);
        propsOrganizations.useState(UseState.done);
      } else {
        throw response;
      }
    } on ProfileRes catch (e) {
      propsProfile.useState(UseState.error);
      propsProfile.error(UseError(message: e.message));
      propsOrganizations.useState(UseState.error);
      propsOrganizations.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      propsProfile.useState(UseState.error);
      propsProfile.error(UseError(message: e.message));
      propsOrganizations.useState(UseState.error);
      propsOrganizations.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsProfile.useState(UseState.error);
      propsProfile.error(UseError(message: e.toString()));
      propsOrganizations.useState(UseState.error);
      propsOrganizations.error(UseError(message: e.toString()));
    } catch (e) {
      propsProfile.useState(UseState.error);
      propsProfile.error(UseError(message: e.toString()));
      propsOrganizations.useState(UseState.error);
      propsOrganizations.error(UseError(message: e.toString()));
    }
  }

  Future setOrganization(option) async {
    try {
      Organizations org = option.value;
      if (org.status == true) {
        SetOrganizationReq request = SetOrganizationReq(
          organizationTag: org.tagNumber,
        );
        SetOrganizationRes response =
            await Get.find<Api>().dashboard.setOrganization(
                  requestData: request.toJson(),
                );
        if (response.result == true) {
          Get.offAllNamed(AppRoutes.splash, arguments: {
            'setOrganization': true,
          });
        } else {
          throw response;
        }
      } else {
        Toasts.warning(message: "user can't select this organization");
      }
    } on SetOrganizationRes catch (e) {
      propsDonorsAndFollowers.useState(UseState.error);
      propsDonorsAndFollowers.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      propsDonorsAndFollowers.useState(UseState.error);
      propsDonorsAndFollowers.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsDonorsAndFollowers.useState(UseState.error);
      propsDonorsAndFollowers.error(UseError(message: e.toString()));
    } catch (e) {
      propsDonorsAndFollowers.useState(UseState.error);
      propsDonorsAndFollowers.error(UseError(message: e.toString()));
    }
  }

  Future getDonorsAndFollowers() async {
    try {
      propsDonorsAndFollowers.useState(UseState.loading);
      DonorsAndFollowersRes response =
          await Get.find<Api>().dashboard.getDonorsAndFollowers();
      if (response.result == true) {
        donorsAndFollowers(response.data);
        propsDonorsAndFollowers.useState(UseState.done);
      } else {
        throw response;
      }
    } on DonorsAndFollowersRes catch (e) {
      propsDonorsAndFollowers.useState(UseState.error);
      propsDonorsAndFollowers.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      propsDonorsAndFollowers.useState(UseState.error);
      propsDonorsAndFollowers.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsDonorsAndFollowers.useState(UseState.error);
      propsDonorsAndFollowers.error(UseError(message: e.toString()));
    } catch (e) {
      propsDonorsAndFollowers.useState(UseState.error);
      propsDonorsAndFollowers.error(UseError(message: e.toString()));
    }
  }

  Future getTotalTransactions() async {
    try {
      propsTotalTransactions.useState(UseState.loading);

      TotalTransactionsRes response =
          await Get.find<Api>().dashboard.getTotalTransactions();
      if (response.result == true) {
        propsTotalTransactions.useState(UseState.done);
        totalTransactions(response.data);
      } else {
        throw response;
      }
    } on TotalTransactionsRes catch (e) {
      propsTotalTransactions.useState(UseState.error);
      propsTotalTransactions.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      propsTotalTransactions.useState(UseState.error);
      propsTotalTransactions.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsTotalTransactions.useState(UseState.error);
      propsTotalTransactions.error(UseError(message: e.toString()));
    } catch (e) {
      propsTotalTransactions.useState(UseState.error);
      propsTotalTransactions.error(UseError(message: e.toString()));
    }
  }

  Future getThisYearTransactions() async {
    try {
      propsThisYearTransactions.useState(UseState.loading);

      ThisYearTransactionsRes response =
          await Get.find<Api>().dashboard.getThisYearTransactions();

      if (response.result == true) {
        propsThisYearTransactions.useState(UseState.done);
        thisYearTransactions(response.data);
      } else {
        throw response;
      }
    } on ThisYearTransactionsRes catch (e) {
      propsThisYearTransactions.useState(UseState.error);
      propsThisYearTransactions.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      propsThisYearTransactions.useState(UseState.error);
      propsThisYearTransactions.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsThisYearTransactions.useState(UseState.error);
      propsThisYearTransactions.error(UseError(message: e.toString()));
    } catch (e) {
      propsThisYearTransactions.useState(UseState.error);
      propsThisYearTransactions.error(UseError(message: e.toString()));
    }
  }

  Future getDonationSince() async {
    try {
      propsDonationSince.useState(UseState.loading);

      DonationSinceRes response =
          await Get.find<Api>().dashboard.getDonationSince();
      if (response.result == true) {
        propsDonationSince.useState(UseState.done);
        donationSince(response.data);
      } else {
        throw response;
      }
    } on DonationSinceRes catch (e) {
      propsDonationSince.useState(UseState.error);
      propsDonationSince.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      propsDonationSince.useState(UseState.error);
      propsDonationSince.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsDonationSince.useState(UseState.error);
      propsDonationSince.error(UseError(message: e.toString()));
    } catch (e) {
      propsDonationSince.useState(UseState.error);
      propsDonationSince.error(UseError(message: e.toString()));
    }
  }

  Future getDonationYear() async {
    try {
      propsDonationYear.useState(UseState.loading);

      DonationYearReq request = DonationYearReq(
        year: year.value,
      );
      DonationYearRes response = await Get.find<Api>()
          .dashboard
          .getDonationYear(requestData: request.toJson());
      if (response.result == true) {
        propsDonationYear.useState(UseState.done);
        donationYear(response.data);
      } else {
        throw response;
      }
    } on DonationYearRes catch (e) {
      propsDonationYear.useState(UseState.error);
      propsDonationYear.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      propsDonationYear.useState(UseState.error);
      propsDonationYear.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsDonationYear.useState(UseState.error);
      propsDonationYear.error(UseError(message: e.toString()));
    } catch (e) {
      propsDonationYear.useState(UseState.error);
      propsDonationYear.error(UseError(message: e.toString()));
    }
  }

  Future setDonationYear() async {
    Get.back();
    await getDonationYear();
  }

  Future getDonationDay() async {
    try {
      propsDonationDay.useState(UseState.loading);
      DonationDayReq request = DonationDayReq(
        date: date.value.formatYYYYMMDD.replaceAll('/', '-'),
      );
      DonationDayRes response = await Get.find<Api>().dashboard.getDonationDay(
            requestData: request.toJson(),
          );
      if (response.result == true) {
        propsDonationDay.useState(UseState.done);
        donationDay(response.data);
      } else {
        throw response;
      }
    } on DonationDayRes catch (e) {
      console.log(e);

      propsDonationDay.useState(UseState.error);
      propsDonationDay.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      console.log(e);

      propsDonationDay.useState(UseState.error);
      propsDonationDay.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      console.log(e);

      propsDonationDay.useState(UseState.error);
      propsDonationDay.error(UseError(message: e.toString()));
    } catch (e) {
      console.log(e);

      propsDonationDay.useState(UseState.error);
      propsDonationDay.error(UseError(message: e.toString()));
    }
  }

  Future setDonationDay() async {
    Get.back();
    await getDonationDay();
  }

  Future getDonationMonth() async {
    try {
      propsDonationMonth.useState(UseState.loading);

      DonationMonthReq request = DonationMonthReq(
        year: year.value,
        month: month.value,
      );
      DonationMonthRes response = await Get.find<Api>()
          .dashboard
          .getDonationMonth(requestData: request.toJson());
      if (response.result == true) {
        propsDonationMonth.useState(UseState.done);
        donationMonth(response.data);
      } else {
        throw response;
      }
    } on DonationMonthRes catch (e) {
      console.log(e);
      propsDonationMonth.useState(UseState.error);
      propsDonationMonth.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      console.log(e);

      propsDonationMonth.useState(UseState.error);
      propsDonationMonth.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      console.log(e);

      propsDonationMonth.useState(UseState.error);
      propsDonationMonth.error(UseError(message: e.toString()));
    } catch (e) {
      console.log(e);

      propsDonationMonth.useState(UseState.error);
      propsDonationMonth.error(UseError(message: e.toString()));
    }
  }

  Future setDonationMonth() async {
    Get.back();
    await getDonationMonth();
  }
}
