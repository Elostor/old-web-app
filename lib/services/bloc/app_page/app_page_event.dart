import 'package:flutter/foundation.dart' show immutable;

@immutable
sealed class AppPageEvent {
  const AppPageEvent();
}

final class AppPageInitializeApp extends AppPageEvent {
  final dynamic requestedState;

  const AppPageInitializeApp({this.requestedState});
}

final class AppPageInitializeHome extends AppPageEvent {
  const AppPageInitializeHome();
}

final class AppPageInitializeMaterials extends AppPageEvent {
  const AppPageInitializeMaterials();
}

final class AppPageInitializeAboutUs extends AppPageEvent {
  const AppPageInitializeAboutUs();
}

final class AppPageInitializeUpload extends AppPageEvent {
  const AppPageInitializeUpload();
}

final class AppPageInitializeMyModels extends AppPageEvent {
  const AppPageInitializeMyModels();
}

final class AppPageInitializeMyCart extends AppPageEvent {
  const AppPageInitializeMyCart();
}

final class AppPageMyCartInitialized extends AppPageEvent {
  const AppPageMyCartInitialized();
}

final class AppPageInitializeChooseMaterial extends AppPageEvent {
  const AppPageInitializeChooseMaterial();
}

final class AppPageChooseMaterialInitialized extends AppPageEvent {
  const AppPageChooseMaterialInitialized();
}

final class AppPageInitializeChooseFinishing extends AppPageEvent {
  final String chosenMaterial;

  const AppPageInitializeChooseFinishing({
    required this.chosenMaterial
  });
}

final class AppPageInitializeChooseColor extends AppPageEvent {
  final String chosenFinishing;

  const AppPageInitializeChooseColor({
    required this.chosenFinishing
  });
}

final class AppPageInitializeAllOffers extends AppPageEvent {
  final String chosenColor;

  const AppPageInitializeAllOffers({
    required this.chosenColor
  });
}

final class AppPageInitializeGuestAddressCheckout extends AppPageEvent {
  const AppPageInitializeGuestAddressCheckout();
}

final class AppPageInitializeCheckOut extends AppPageEvent {
  const AppPageInitializeCheckOut();
}

final class AppPageTransactionSuccess extends AppPageEvent {
  const AppPageTransactionSuccess();
}

final class AppPageTransactionFail extends AppPageEvent {
  final Exception? exception;

  const AppPageTransactionFail({this.exception});
}

final class AppPageInitializePayment extends AppPageEvent {
  const AppPageInitializePayment();
}

final class AppPageInitializeHelp extends AppPageEvent {
  const AppPageInitializeHelp();
}

final class AppPageInitializeImprint extends AppPageEvent {
  const AppPageInitializeImprint();
}

final class AppPageInitializeConfidentiality extends AppPageEvent {
  const AppPageInitializeConfidentiality();
}

final class AppPageInitializeDataProtection extends AppPageEvent {
  const AppPageInitializeDataProtection();
}

final class AppPageInitializePrivacy extends AppPageEvent {
  const AppPageInitializePrivacy();
}

final class AppPageInitializeTAC extends AppPageEvent {
  const AppPageInitializeTAC();
}
