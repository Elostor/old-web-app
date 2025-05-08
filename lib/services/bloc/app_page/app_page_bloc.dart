import 'package:OldWebApp/services/bloc/app_page/app_page_event.dart';
import 'package:OldWebApp/services/bloc/app_page/app_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPageBloc extends Bloc<AppPageEvent, AppPageState> {
  List<Object> uploadedModels = [];
  List<Object> selectedModels = [];
  String currentChosenMaterial = '';
  String currentChosenFinishing = '';
  String currentChosenColor = '';
  String emptyValue = '';

  AppPageBloc() : super(
      const AppPageUninitialized(isLoading: true)
  ) {
    on<AppPageInitializeApp>((event, emit) async {
      await Future.delayed(const Duration(seconds: 2)); // TODO <= check internet connection instead of this.

      if (event.requestedState == null) {
        add(const AppPageInitializeHome());
      } else {
        if (event.requestedState is ChooseProductionMaterialPage ||
            event.requestedState is ChooseProductionFinishingPage ||
            event.requestedState is ChooseProductionColorPage ||
            event.requestedState is ChooseProductionProducerPage ||
            event.requestedState is AppPageInitializeUpload
        ) {
          add(const AppPageInitializeUpload());
        } else if (event.requestedState is MyModelsPage) {
          // TODO add auth here
          add(const AppPageInitializeHome());
        } else if (event.requestedState is MyCartPage) {
          add(const AppPageInitializeMyCart());
        } else if (event.requestedState is CheckOutPage ||
            event.requestedState is SuccessfulTransactionPage ||
            event.requestedState is FailedTransactionPage
        ) {
          add(const AppPageInitializeHome());
        } else {
          return emit(event.requestedState(isLoading: false));
        }
      }
    });

    on<AppPageInitializeHome>((event, emit) => emit(const HomePage(isLoading: false)));

    on<AppPageInitializeMaterials>((event, emit) => emit(const MaterialsPage(isLoading: false)));

    on<AppPageInitializeAboutUs>((event, emit) => emit(const AboutUsPage(isLoading: false)));

    on<AppPageInitializeUpload>((event, emit) {
      selectedModels = [];
      currentChosenMaterial = emptyValue;
      currentChosenFinishing = emptyValue;
      currentChosenColor = emptyValue;

      return emit(UploadPage(
        isLoading: false,
        uploadedModels: uploadedModels,
        selectedModels: const [],
      ));}
    );

    on<AppPageInitializeMyModels>(
        (event, emit) => emit(const MyModelsPage(isLoading: false)));

    on<AppPageInitializeMyCart>((event, emit) =>
        emit(const MyCartPage(
            isLoading: true,
            loadingText: 'Please wait while we\'re getting prices'
        )));

    on<AppPageMyCartInitialized>((event, emit) =>
        emit(const MyCartPage(
            isLoading: false,
            loadingText: 'Success'
        )));

    on<AppPageInitializeChooseMaterial>((event, emit) {
      selectedModels = uploadedModels;

      // TODO implement a working function here. A placeholder, this is.
      selectedModels.removeWhere((element) => element.toString().length == 2);

      return emit(ChooseProductionMaterialPage(
          isLoading: true,
          loadingText: 'Please wait while we\'re getting prices.',
          selectedModels: selectedModels,
          chosenMaterial: emptyValue,
          chosenFinishing: emptyValue,
          chosenColor: emptyValue
      ));
    });

    on<AppPageChooseMaterialInitialized>((event, emit) =>
        emit(ChooseProductionMaterialPage(
            isLoading: false,
            loadingText: 'Done',
            selectedModels: selectedModels,
            chosenMaterial: emptyValue,
            chosenFinishing: emptyValue,
            chosenColor: emptyValue
        )));

    on<AppPageInitializeChooseFinishing>((event, emit) {
      currentChosenMaterial = event.chosenMaterial;

      return emit(ChooseProductionMaterialPage(
          isLoading: false,
          loadingText: emptyValue,
          selectedModels: selectedModels,
          chosenMaterial: event.chosenMaterial,
          chosenFinishing: emptyValue,
          chosenColor: emptyValue
      ));}
    );

    on<AppPageInitializeChooseColor>((event, emit) {
      currentChosenFinishing = event.chosenFinishing;

      return emit(ChooseProductionColorPage(
        isLoading: false,
        selectedModels: selectedModels,
        chosenMaterial: currentChosenMaterial,
        chosenFinishing: event.chosenFinishing,
      ));}
    );

    on<AppPageInitializeAllOffers>((event, emit) {
      currentChosenColor = event.chosenColor;

      return emit(ChooseProductionColorPage(
        isLoading: false,
        selectedModels: selectedModels,
        chosenMaterial: currentChosenMaterial,
        chosenFinishing: currentChosenColor,
      ));}
    );

    on<AppPageInitializeCheckOut>((event, emit) => // TODO implement this
        emit(const CheckOutPage(isLoading: false,)));

    on<AppPageTransactionSuccess>((event, emit) => emit(
        const SuccessfulTransactionPage(isLoading: false, boughtProducts: {})));

    on<AppPageTransactionFail>((event, emit) => emit(FailedTransactionPage(
        isLoading: false,
        exception: event.exception
    )));

    on<AppPageInitializeHelp>((event, emit) => emit(const FooterHelpPage(isLoading: false)));

    on<AppPageInitializeImprint>((event, emit) => emit(const FooterImprintPage(isLoading: false)));

    on<AppPageInitializeConfidentiality>((event, emit) => emit(const FooterConfidentialityPage(isLoading: false)));

    on<AppPageInitializeDataProtection>((event, emit) => emit(const FooterDataProtectionPage(isLoading: false)));

    on<AppPageInitializePrivacy>((event, emit) => emit(const FooterPrivacyPage(isLoading: false)));

    on<AppPageInitializeTAC>((event, emit) => emit(const FooterTACPage(isLoading: false)));

  }

  // TODO add authentication
  Future<void> setNewRoutePath(AppPageState configuration) async {
    if (state is AppPageUninitialized) {
      add(AppPageInitializeApp(requestedState: configuration));
    } else if (configuration == state) {
      return;
    } else {
      if (configuration is HomePage) {
        add(const AppPageInitializeHome());
      } else if (configuration is MaterialsPage) {
        add(const AppPageInitializeMaterials());
      } else if (configuration is AboutUsPage) {
        add(const AppPageInitializeAboutUs());
      } else if (configuration is UploadPage) {
        add(const AppPageInitializeUpload());
      } else if (configuration is MyModelsPage) {
        add(const AppPageInitializeMyModels()); // TODO add a myModels hydrated bloc} else if (configuration is MyCartPage) {
        add(const AppPageInitializeMyCart());
      } else if (configuration is ChooseProductionMaterialPage) {
        if (state is ChooseProductionFinishingPage) {
          add(const AppPageChooseMaterialInitialized());
        } else {
          add(const AppPageInitializeUpload());
        }
      } else if (configuration is ChooseProductionFinishingPage) {
        if (state is ChooseProductionColorPage) {
          add(AppPageInitializeChooseFinishing(
            chosenMaterial: currentChosenMaterial,
          ));
        } else if (state is ChooseProductionMaterialPage &&
            currentChosenMaterial != emptyValue
        ) {
          add(AppPageInitializeChooseFinishing(chosenMaterial: currentChosenMaterial));
        } else {
          add(const AppPageInitializeUpload());
        }
      } else if (configuration is ChooseProductionColorPage) {
        if (state is ChooseProductionProducerPage) {
          add(AppPageInitializeChooseColor(chosenFinishing: currentChosenColor));
        } else if ((state is ChooseProductionMaterialPage ||
            state is ChooseProductionFinishingPage) &&
            currentChosenFinishing != emptyValue &&
            currentChosenMaterial != emptyValue
        ) {
          add(AppPageInitializeChooseColor(chosenFinishing: currentChosenFinishing));
        } else {
          add(const AppPageInitializeUpload());
        }
      } else if (configuration is ChooseProductionProducerPage) {
        if ((state is ChooseProductionMaterialPage ||
            state is ChooseProductionFinishingPage ||
            state is ChooseProductionColorPage) &&
            currentChosenColor != emptyValue &&
            currentChosenMaterial != emptyValue &&
            currentChosenFinishing != emptyValue
        ) {
          add(AppPageInitializeAllOffers(chosenColor: currentChosenColor));
        } else {
          add(const AppPageInitializeUpload());
        }
      } else if (configuration is CheckOutPage) {
        add(const AppPageInitializeMyCart()); // TODO check this again
      } else if (configuration is SuccessfulTransactionPage) {
        if (state is! CheckOutPage) {
          add(const AppPageInitializeMyCart());
        } else {
          add(const AppPageTransactionSuccess());
        }
      } else if (configuration is FailedTransactionPage) {
        if (state is! CheckOutPage) {
          add(const AppPageInitializeMyCart());
        } else {
          add(const AppPageTransactionFail());
        }
      } else if (configuration is FooterHelpPage) {
        add(const AppPageInitializeHelp());
      } else if (configuration is FooterImprintPage) {
        add(const AppPageInitializeImprint());
      } else if (configuration is FooterConfidentialityPage) {
        add(const AppPageInitializeConfidentiality());
      } else if (configuration is FooterDataProtectionPage) {
        add(const AppPageInitializeDataProtection());
      } else if (configuration is FooterPrivacyPage) {
        add(const AppPageInitializePrivacy());
      } else if (configuration is FooterTACPage) {
        add(const AppPageInitializeTAC());
      }
    }
  }
}
