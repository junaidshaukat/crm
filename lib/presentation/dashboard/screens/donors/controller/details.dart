import 'package:flutter/material.dart';
import '/core/app_export.dart';

class DonorDetailsController extends GetxController {
  Props props = Props();
  Props propsYearly = Props();
  Props propsLifetime = Props();
  Props propsKeyDates = Props();
  Props propsLastNthSummary = Props();
  Props propsRecentTransactions = Props();
  Props propsTotalDonationsAmount = Props();
  Props propsCampaignsDistributions = Props();

  Rx<YearlyData> yearly = Rx(YearlyData());
  Rx<LifetimeData> lifetime = Rx(LifetimeData());
  Rx<KeyDatesData> keyDates = Rx(KeyDatesData());
  Rx<LastNthSummaryData> lastNthSummary = Rx(LastNthSummaryData());
  Rx<RecentTransactions> recentTransactions = Rx(RecentTransactions());
  Rx<CampaignsDistribution> campaignsDistributions =
      Rx(CampaignsDistribution());
  Rx<TotalDonationsAmount> totalDonationsAmount = Rx(TotalDonationsAmount());

  Rx<String?> email = Rx('');

  Rx<String> noOfYears = Rx('05');
  Rx<String> noOfMonths = Rx('20');
  Rx<String> noOfTransactions = Rx('05');

  Rx<String> year1 = Rx(DateTime.now().year.toString());
  Rx<String> year2 = Rx(DateTime.now().year.toString());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void setEmail(String? mail) {
    email.value = mail;
    update();
  }

  Future getLifetime() async {
    try {
      propsLifetime.error(UseError(message: null));
      propsLifetime.useState(UseState.processing);

      LifetimeReq request = LifetimeReq(
        email: email.value,
      );

      LifetimeRes response = await Get.find<Api>().highlights.lifetime(
            requestData: request.toJson(),
          );

      if (response.result == true) {
        lifetime(response.data);
        propsLifetime.useState(UseState.done);
      } else {
        throw response;
      }
    } on LifetimeRes catch (e) {
      propsLifetime.useState(UseState.none);
      propsLifetime.error(UseError(message: e.message.toString()));
      Toasts.error(
        message: e.message.toString(),
      );
    } on DioResponse catch (e) {
      propsLifetime.useState(UseState.none);
      propsLifetime.error(UseError(message: e.message.toString()));
      Toasts.error(
        message: e.message.toString(),
      );
    } on NoInternetException catch (e) {
      propsLifetime.useState(UseState.none);
      propsLifetime.error(UseError(message: e.toString()));
      Toasts.error(
        message: e.toString(),
      );
    } catch (e) {
      propsLifetime.useState(UseState.none);
      propsLifetime.error(UseError(message: e.toString()));
      Toasts.error(
        message: e.toString(),
      );
    }
  }

  Future getKeyDates() async {
    try {
      propsKeyDates.error(UseError(message: null));
      propsKeyDates.useState(UseState.processing);

      KeyDatesReq request = KeyDatesReq(
        email: email.value,
      );

      KeyDatesRes response = await Get.find<Api>().highlights.keyDates(
            requestData: request.toJson(),
          );

      if (response.result == true) {
        keyDates(response.data);
        propsKeyDates.useState(UseState.done);
      } else {
        throw response;
      }
    } on KeyDatesRes catch (e) {
      propsKeyDates.useState(UseState.none);
      propsKeyDates.error(UseError(message: e.message.toString()));
      Toasts.error(
        message: e.message.toString(),
      );
    } on DioResponse catch (e) {
      propsKeyDates.useState(UseState.none);
      propsKeyDates.error(UseError(message: e.message.toString()));
      Toasts.error(
        message: e.message.toString(),
      );
    } on NoInternetException catch (e) {
      propsKeyDates.useState(UseState.none);
      propsKeyDates.error(UseError(message: e.toString()));
      Toasts.error(
        message: e.toString(),
      );
    } catch (e) {
      propsKeyDates.useState(UseState.none);
      propsKeyDates.error(UseError(message: e.toString()));
      Toasts.error(
        message: e.toString(),
      );
    }
  }

  Future getYearly() async {
    try {
      propsYearly.error(UseError(message: null));
      propsYearly.useState(UseState.processing);

      YearlyReq request = YearlyReq(
        email: email.value,
        year: year1.value,
      );

      YearlyRes response = await Get.find<Api>().highlights.yearly(
            requestData: request.toJson(),
          );

      if (response.result == true) {
        yearly(response.data);
        propsYearly.useState(UseState.done);
      } else {
        throw response;
      }
    } on YearlyRes catch (e) {
      propsYearly.useState(UseState.none);
      propsYearly.error(UseError(message: e.message.toString()));
      Toasts.error(
        message: e.message.toString(),
      );
    } on DioResponse catch (e) {
      propsYearly.useState(UseState.none);
      propsYearly.error(UseError(message: e.message.toString()));
      Toasts.error(
        message: e.message.toString(),
      );
    } on NoInternetException catch (e) {
      propsYearly.useState(UseState.none);
      propsYearly.error(UseError(message: e.toString()));
      Toasts.error(
        message: e.toString(),
      );
    } catch (e) {
      propsYearly.useState(UseState.none);
      propsYearly.error(UseError(message: e.toString()));
      Toasts.error(
        message: e.toString(),
      );
    }
  }

  Future getLastNthSummary() async {
    try {
      propsLastNthSummary.error(UseError(message: null));
      propsLastNthSummary.useState(UseState.processing);

      LastNthSummaryReq request = LastNthSummaryReq(
        email: email.value,
        n: noOfMonths.value,
      );

      LastNthSummaryRes response =
          await Get.find<Api>().highlights.lastNthSummary(
                requestData: request.toJson(),
              );

      if (response.result == true) {
        lastNthSummary(response.data);
        propsLastNthSummary.useState(UseState.done);
      } else {
        throw response;
      }
    } on LastNthSummaryRes catch (e) {
      propsLastNthSummary.useState(UseState.none);
      propsLastNthSummary.error(UseError(message: e.message.toString()));
      Toasts.error(
        message: e.message.toString(),
      );
    } on DioResponse catch (e) {
      propsLastNthSummary.useState(UseState.none);
      propsLastNthSummary.error(UseError(message: e.message.toString()));
      Toasts.error(
        message: e.message.toString(),
      );
    } on NoInternetException catch (e) {
      propsLastNthSummary.useState(UseState.none);
      propsLastNthSummary.error(UseError(message: e.toString()));
      Toasts.error(
        message: e.toString(),
      );
    } catch (e) {
      propsLastNthSummary.useState(UseState.none);
      propsLastNthSummary.error(UseError(message: e.toString()));
      Toasts.error(
        message: e.toString(),
      );
    }
  }

  Future getRecentTransactions() async {
    try {
      propsRecentTransactions.error(UseError(message: null));
      propsRecentTransactions.useState(UseState.processing);

      RecentTransactionsReq request = RecentTransactionsReq(
        email: email.value,
        n: noOfTransactions.value,
      );

      RecentTransactionsRes response =
          await Get.find<Api>().highlights.recentTransactions(
                requestData: request.toJson(),
              );

      if (response.result == true) {
        recentTransactions(response.data);
        propsRecentTransactions.useState(UseState.done);
      } else {
        throw response;
      }
    } on RecentTransactionsRes catch (e) {
      propsRecentTransactions.useState(UseState.none);
      propsRecentTransactions.error(UseError(message: e.message.toString()));
      Toasts.error(
        message: e.message.toString(),
      );
    } on DioResponse catch (e) {
      propsRecentTransactions.useState(UseState.none);
      propsRecentTransactions.error(UseError(message: e.message.toString()));
      Toasts.error(
        message: e.message.toString(),
      );
    } on NoInternetException catch (e) {
      propsRecentTransactions.useState(UseState.none);
      propsRecentTransactions.error(UseError(message: e.toString()));
      Toasts.error(
        message: e.toString(),
      );
    } catch (e) {
      propsRecentTransactions.useState(UseState.none);
      propsRecentTransactions.error(UseError(message: e.toString()));
      Toasts.error(
        message: e.toString(),
      );
    }
  }

  Future getTotalDonationsAmount() async {
    try {
      propsTotalDonationsAmount.error(UseError(message: null));
      propsTotalDonationsAmount.useState(UseState.processing);

      TotalDonationsAmountReq request = TotalDonationsAmountReq(
        email: email.value,
        numberOfYears: noOfYears.value,
      );

      TotalDonationsAmountRes response =
          await Get.find<Api>().highlights.totalDonationsAmount(
                requestData: request.toJson(),
              );

      if (response.result == true) {
        totalDonationsAmount(response.data);
        propsTotalDonationsAmount.useState(UseState.done);
      } else {
        throw response;
      }
    } on TotalDonationsAmountRes catch (e) {
      propsTotalDonationsAmount.useState(UseState.none);
      propsTotalDonationsAmount.error(UseError(message: e.message.toString()));
      Toasts.error(
        message: e.message.toString(),
      );
    } on DioResponse catch (e) {
      propsTotalDonationsAmount.useState(UseState.none);
      propsTotalDonationsAmount.error(UseError(message: e.message.toString()));
      Toasts.error(
        message: e.message.toString(),
      );
    } on NoInternetException catch (e) {
      propsTotalDonationsAmount.useState(UseState.none);
      propsTotalDonationsAmount.error(UseError(message: e.toString()));
      Toasts.error(
        message: e.toString(),
      );
    } catch (e) {
      propsTotalDonationsAmount.useState(UseState.none);
      propsTotalDonationsAmount.error(UseError(message: e.toString()));
      Toasts.error(
        message: e.toString(),
      );
    }
  }

  Future getCampaignsDistributions() async {
    try {
      propsCampaignsDistributions.error(UseError(message: null));
      propsCampaignsDistributions.useState(UseState.processing);

      CampaignsDistributionReq request = CampaignsDistributionReq(
        email: email.value,
        year: year2.value,
      );

      CampaignsDistributionRes response =
          await Get.find<Api>().highlights.campaignsDistributions(
                requestData: request.toJson(),
              );

      if (response.result == true) {
        campaignsDistributions(response.data);
        propsCampaignsDistributions.useState(UseState.done);
      } else {
        throw response;
      }
    } on CampaignsDistributionRes catch (e) {
      propsCampaignsDistributions.useState(UseState.none);
      propsCampaignsDistributions
          .error(UseError(message: e.message.toString()));
      Toasts.error(
        message: e.message.toString(),
      );
    } on DioResponse catch (e) {
      propsCampaignsDistributions.useState(UseState.none);
      propsCampaignsDistributions
          .error(UseError(message: e.message.toString()));
      Toasts.error(
        message: e.message.toString(),
      );
    } on NoInternetException catch (e) {
      propsCampaignsDistributions.useState(UseState.none);
      propsCampaignsDistributions.error(UseError(message: e.toString()));
      Toasts.error(
        message: e.toString(),
      );
    } catch (e) {
      propsCampaignsDistributions.useState(UseState.none);
      propsCampaignsDistributions.error(UseError(message: e.toString()));
      Toasts.error(
        message: e.toString(),
      );
    }
  }
}
