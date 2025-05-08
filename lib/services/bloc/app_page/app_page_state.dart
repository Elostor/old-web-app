import 'package:OldWebApp/constants/paths.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
sealed class AppPageState extends Equatable {
  final bool isLoading;
  final String loadingText;

  const AppPageState({
    required this.isLoading,
    this.loadingText = 'Lütfen kısa bir süre bekleyiniz.'
  });

  @override
  List<Object?> get props => [loadingText];
}

final class AppPageUninitialized extends AppPageState {
  const AppPageUninitialized({required bool isLoading})
      : super(isLoading: isLoading);
}

final class HomePage extends AppPageState {
  String get urlPath => homePath;

  const HomePage({required bool isLoading}) : super(isLoading: isLoading);
}

final class MaterialsPage extends AppPageState {
  String get urlPath => materialsInfoPath;

  const MaterialsPage({required bool isLoading}) : super(isLoading: isLoading);
}

final class AboutUsPage extends AppPageState {
  String get urlPath => aboutUsPath;

  const AboutUsPage({required bool isLoading}) : super(isLoading: isLoading);
}

final class UploadPage extends AppPageState {
  final List<Object>? uploadedModels;
  final List<Object>? selectedModels;

  String get urlPath => uploadPath;

  const UploadPage({
    required bool isLoading,
    this.uploadedModels,
    this.selectedModels,
  }) : super(isLoading: isLoading);

  @override
  List<Object?> get props => [uploadedModels, selectedModels];
}

final class MyModelsPage extends AppPageState {
  final List<Object>? userModels;

  String get urlPath => modelsPath;

  const MyModelsPage({required bool isLoading, this.userModels})
      : super(isLoading: isLoading);

  @override
  List<Object?> get props => [userModels];
}

final class MyCartPage extends AppPageState {
  final List<Object>? selectedModels;
  final List<Object>? chosenMaterial;
  final List<Object>? chosenFinishing;
  final List<Object>? chosenColor;
  final List<String>? chosenProducer;

  String get urlPath => cartPath;

  const MyCartPage({
    required bool isLoading,
    String loadingText = 'Please wait while we\'re getting prices',
    this.selectedModels,
    this.chosenMaterial,
    this.chosenFinishing,
    this.chosenColor,
    this.chosenProducer
  }) : super(isLoading: isLoading, loadingText: loadingText);

  @override
  List<Object?> get props => [
    loadingText,
    selectedModels,
    chosenMaterial,
    chosenFinishing,
    chosenColor,
    chosenProducer
  ];
}

final class ChooseProductionMaterialPage extends AppPageState {
  final List<Object>? selectedModels;
  final String? chosenMaterial;
  final String? chosenFinishing;
  final String? chosenColor;

  String get urlPath => materialPath;

  const ChooseProductionMaterialPage({
    required bool isLoading,
    String loadingText = 'Please wait while we\'re loading your setup',
    this.selectedModels,
    this.chosenMaterial,
    this.chosenFinishing,
    this.chosenColor
  }) : super(isLoading: isLoading, loadingText: loadingText);

  @override
  List<Object?> get props => [
    loadingText,
    selectedModels,
    chosenMaterial,
    chosenFinishing,
    chosenColor
  ];
}

final class ChooseProductionFinishingPage extends AppPageState {
  final List<Object>? selectedModels;
  final String? chosenMaterial;
  final String? chosenFinishing;
  final String? chosenColor;

  String get urlPath => finishingPath;

  const ChooseProductionFinishingPage({
    required bool isLoading,
    this.selectedModels,
    this.chosenMaterial,
    this.chosenFinishing,
    this.chosenColor
  }) : super(isLoading: isLoading,);

  @override
  List<Object?> get props => [
    selectedModels,
    chosenMaterial,
    chosenFinishing,
    chosenColor
  ];
}

final class ChooseProductionColorPage extends AppPageState {
  final List<Object>? selectedModels;
  final String? chosenMaterial;
  final String? chosenFinishing;
  final String? chosenColor;

  String get urlPath => colorPath;

  const ChooseProductionColorPage({
    required bool isLoading,
    this.selectedModels,
    this.chosenMaterial,
    this.chosenFinishing,
    this.chosenColor
  }) : super(isLoading: isLoading,);

  @override
  List<dynamic> get props => [
    selectedModels,
    chosenMaterial,
    chosenFinishing,
    chosenColor
  ];
}

final class ChooseProductionProducerPage extends AppPageState {
  final List<Object>? selectedModels;
  final String? chosenMaterial;
  final String? chosenFinishing;
  final String? chosenColor;

  String get urlPath => producerPath;

  const ChooseProductionProducerPage({
    required bool isLoading,
    this.selectedModels,
    this.chosenMaterial,
    this.chosenFinishing,
    this.chosenColor
  }) : super(isLoading: isLoading,);

  @override
  List<Object?> get props => [
    selectedModels,
    chosenMaterial,
    chosenFinishing,
    chosenColor
  ];
}

final class CheckOutPage extends AppPageState {
  final Map<int, List<Object>>? allSelectedModels;
  final List<String>? allChosenMaterials;
  final List<String>? allChosenFinishings;
  final List<String>? allChosenColors;
  final List<String>? allChosenProducers;

  String get urlPath => checkoutPath;

  const CheckOutPage({
    required bool isLoading,
    String loadingText = 'Please wait while we\'re loading your setup',
    this.allSelectedModels,
    this.allChosenMaterials,
    this.allChosenFinishings,
    this.allChosenColors,
    this.allChosenProducers
  }) : super(isLoading: isLoading, loadingText: loadingText);

  @override
  List<Object?> get props => [
    loadingText,
    allSelectedModels,
    allChosenMaterials,
    allChosenFinishings,
    allChosenColors,
    allChosenFinishings
  ];
}

final class SuccessfulTransactionPage extends AppPageState {
  final Map<List<Object>, List<Object>>? boughtProducts;

  String get urlPath => checkoutSuccessPath;

  const SuccessfulTransactionPage({
    required bool isLoading,
    this.boughtProducts
  }) : super(isLoading: isLoading);
}

final class FailedTransactionPage extends AppPageState {
  final Exception? exception;

  String get urlPath => checkoutFailurePath;

  const FailedTransactionPage({
    required isLoading,
    this.exception
  }) : super(isLoading: isLoading);

  @override
  List<Exception?> get props => [exception];
}

final class FooterHelpPage extends AppPageState {
  String get urlPath => helpPath;

  const FooterHelpPage({required bool isLoading}) : super(isLoading: isLoading);
}

final class FooterImprintPage extends AppPageState {
  String get urlPath => imprintPath;

  const FooterImprintPage({required bool isLoading})
      : super(isLoading: isLoading);
}

final class FooterConfidentialityPage extends AppPageState {
  String get urlPath => confidentialityPath;

  const FooterConfidentialityPage({required bool isLoading})
      : super(isLoading: isLoading);
}

final class FooterDataProtectionPage extends AppPageState {
  String get urlPath => dataProtectionPath;

  const FooterDataProtectionPage({required bool isLoading})
      : super(isLoading: isLoading);
}

final class FooterPrivacyPage extends AppPageState {
  String get urlPath => privacyPath;

  const FooterPrivacyPage({required bool isLoading}) : super(isLoading: isLoading);
}

final class FooterTACPage extends AppPageState {
  String get urlPath => tacPath;

  const FooterTACPage({required bool isLoading}) : super(isLoading: isLoading);
}
