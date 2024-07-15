import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/loaders/circular_loader.dart';
import '../../../common/widgets/loaders/loaders.dart';
import '../../../data/repositories/addresses/address_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../models/address_model.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final street = TextEditingController();
  final country = TextEditingController();
  final postalCode = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final addressRepository = Get.put(AddressRepository());
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;

  /// Fetch all user specific addresses
  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere((element) => element.selectedAddress, orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      ZLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
        title: '',
        onWillPop: () async {
          return false;
        },
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const ZCircularLoader(),
      );

      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(newSelectedAddress.id, false);
      }

      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      await addressRepository.updateSelectedField(newSelectedAddress.id, true);

      Get.back();
    } catch (e) {
      ZLoaders.errorSnackBar(title: 'Error in selection', message: e.toString());
    }
  }

  Future addNewAddress() async {
    try {
      ZFullScreenLoader.openLoadingDialog('Storing Address...', ZImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ZFullScreenLoader.stopLoading();
        return;
      }

      if (!addressFormKey.currentState!.validate()) {
        ZFullScreenLoader.stopLoading();
        return;
      }

      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        street: street.text.trim(),
        country: country.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        postalCode: postalCode.text.trim(),
        selectedAddress: true,
      );
      final id = await addressRepository.addAddress(address);

      address.id = id;
      await selectAddress(address);

      ZFullScreenLoader.stopLoading();

      ZLoaders.successSnackBar(title: 'Congratulations', message: 'Your address has been saved successfully.');

      refreshData.toggle();

      resetFormFields();

      Navigator.of(Get.context!).pop();
    } catch (e) {
      ZFullScreenLoader.stopLoading();
      ZLoaders.errorSnackBar(title: 'Something went wrong', message: e.toString());
    }
  }

  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }
}
