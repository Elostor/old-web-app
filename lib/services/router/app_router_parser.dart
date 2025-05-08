import 'package:MaydaNozzle/constants/paths.dart';
import 'package:MaydaNozzle/services/bloc/app_page/app_page_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../bloc/app_page/app_page_bloc.dart';

class AppRouterParser extends RouteInformationParser<AppPageState> {
  final AppPageBloc appPageBloc;

  const AppRouterParser({required this.appPageBloc});

  // Parse AppPageState based on the upcoming url.
  @override
  Future<AppPageState> parseRouteInformation(RouteInformation routeInformation) {
    final uri = routeInformation.uri;

    if (uri.pathSegments.isNotEmpty) {
      return SynchronousFuture(parseStateFromUri(uri));
    } else {
      return SynchronousFuture(const HomePage(isLoading: false));
    }
  }

  AppPageState parseStateFromUri(Uri uri) {
    List<String> pathSegments = uri.pathSegments;
    
    if (pathSegments.contains(materialsInfoPath)) {
      return const MaterialsPage(isLoading: false);
    } else if (pathSegments.contains(aboutUsPath)) {
      return const AboutUsPage(isLoading: false);
    } else if (pathSegments.contains(uploadPath)) {
      return const UploadPage(isLoading: false,);
    } else if (pathSegments.contains(modelsPath)) {
      return const MyModelsPage(isLoading: false);
    } else if (pathSegments.contains(cartPath)) {
      return const MyCartPage(isLoading: false);
    } else if (pathSegments.contains(materialPath)) {
      if (appPageBloc.selectedModels.isNotEmpty && appPageBloc.uploadedModels.isNotEmpty) {
        return const ChooseProductionMaterialPage(isLoading: false);
      } else {
        return const UploadPage(isLoading: false);
      }
    } else if (pathSegments.contains(finishingPath)) {
      if (appPageBloc.state is! ChooseProductionMaterialPage) {
        return const UploadPage(isLoading: false);
      } else {
        return const ChooseProductionFinishingPage(isLoading: false);
      }
    } else if (pathSegments.contains(colorPath)) {
      if (appPageBloc.state is! ChooseProductionFinishingPage) {
        return const UploadPage(isLoading: false);
      } else {
        return const ChooseProductionColorPage(isLoading: false);
      }
    } else if (pathSegments.contains(producerPath)) {
      if (appPageBloc.state is! ChooseProductionColorPage) {
        return const UploadPage(isLoading: false);
      } else {
        return const ChooseProductionProducerPage(isLoading: false);
      }
    } else if (pathSegments.contains(checkoutPath)) {
      if (appPageBloc.state is! MyCartPage) {
        return const HomePage(isLoading: false);
      } else {
        return const CheckOutPage(isLoading: false);
      }
    } else if (pathSegments.contains(checkoutSuccessPath)) {
      if (appPageBloc.state is! CheckOutPage) {
        return const HomePage(isLoading: false);
      } else {
        return const SuccessfulTransactionPage(isLoading: false);
      }
    } else if (pathSegments.contains(checkoutFailurePath)) {
      if (appPageBloc.state is! CheckOutPage) {
        return const HomePage(isLoading: false);
      } else {
        return const FailedTransactionPage(isLoading: false);
      }
    } else if (pathSegments.contains(helpPath)) {
      return const FooterHelpPage(isLoading: false);
    } else if (pathSegments.contains(imprintPath)) {
      return const FooterImprintPage(isLoading: false);
    } else if (pathSegments.contains(confidentialityPath)) {
      return const FooterConfidentialityPage(isLoading: false);
    } else if (pathSegments.contains(dataProtectionPath)) {
      return const FooterDataProtectionPage(isLoading: false);
    } else if (pathSegments.contains(privacyPath)) {
      return const FooterPrivacyPage(isLoading: false);
    } else if (pathSegments.contains(tacPath)) {
      return const FooterTACPage(isLoading: false);
    } else {
      return const HomePage(isLoading: false);
    }
  }

  // Update the browser history and browser url section.
  // Maybe this function can be shortened?
  @override
  RouteInformation restoreRouteInformation(AppPageState configuration) {
    String path = homePath;

    if (configuration is HomePage) {
      path = configuration.urlPath;
    } else if (configuration is MaterialsPage) {
      path = configuration.urlPath;
    } else if (configuration is AboutUsPage) {
      path = configuration.urlPath;
    } else if (configuration is UploadPage) {
      path = configuration.urlPath;
    } else if (configuration is MyModelsPage) {
      path = configuration.urlPath;
    } else if (configuration is MyCartPage) {
      path = configuration.urlPath;
    } else if (configuration is ChooseProductionMaterialPage) {
      path = configuration.urlPath;
    } else if (configuration is ChooseProductionFinishingPage) {
      path = configuration.urlPath;
    } else if (configuration is ChooseProductionColorPage) {
      path = configuration.urlPath;
    } else if (configuration is ChooseProductionProducerPage) {
      path = configuration.urlPath;
    } else if (configuration is CheckOutPage) {
      path = configuration.urlPath;
    } else if (configuration is SuccessfulTransactionPage) {
      path = configuration.urlPath;
    } else if (configuration is FailedTransactionPage) {
      path = configuration.urlPath;
    } else if (configuration is FooterHelpPage) {
      path = configuration.urlPath;
    } else if (configuration is FooterImprintPage) {
      path = configuration.urlPath;
    } else if (configuration is FooterConfidentialityPage) {
      path = configuration.urlPath;
    } else if (configuration is FooterDataProtectionPage) {
      path = configuration.urlPath;
    } else if (configuration is FooterPrivacyPage) {
      path = configuration.urlPath;
    } else if (configuration is FooterTACPage) {
      path = configuration.urlPath;
    }

    return RouteInformation(uri: Uri.parse(path));
  }
}