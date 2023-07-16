import 'dart:io';
import 'package:blnk_task/core/app_colors.dart';
import 'package:blnk_task/data/models/user_data_model.dart';
import 'package:blnk_task/data/repo/user_data_repo.dart';
import 'package:blnk_task/presentation/cubits/user_data_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class UserDataCubit extends Cubit<UserDataStates> {
  UserDataCubit(this.userDataRepo) : super(InitState());

  static UserDataCubit cubit(context) =>
      BlocProvider.of<UserDataCubit>(context);

  File? frontCard;
  File? backCard;
  File? croppedFrontCard;
  File? croppedBackCard;
  UserDataRepo userDataRepo;
  String scannedFrontCardId = '';
  String scannedBackCardId = '';
  UserModel userModel = UserModel();
  

  Future<void> pickFrontCardImage() async {
    XFile? picker = await ImagePicker().pickImage(source: ImageSource.gallery); 
    if (picker != null) {
      frontCard = File(picker.path);
    }
  }

  Future<void> pickBackCardImage() async {
    XFile? picker = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picker != null) {
      backCard = File(picker.path);
    }
  }

  Future<void> croppedFrontCartImage(
      {required BuildContext context, required String frontCardPath}) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: frontCardPath,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: AppColors.deepOrange,
            toolbarWidgetColor: AppColors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
    croppedFrontCard = File(croppedFile!.path);
  }

  Future<void> croppedBackCartImage(
      {required BuildContext context, required String backCardPath}) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: backCardPath,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: AppColors.deepOrange,
            toolbarWidgetColor: AppColors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
    croppedBackCard = File(croppedFile!.path);
  }

  Future <void> scanFrontCardId(
      {required String imagePath}) async {
    emit(ScanTextLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    var result = await userDataRepo.getRecognizedIdCard(imagePath: imagePath);
    result.fold((scannedText) {
      scannedFrontCardId = scannedText;
      emit(ScanTextSuccessState('Front ID Card Scanned Successfully'));
    }, (failure) {
      emit(ScanTextErrorState(failure.errMessage));
    });
  }


  Future <void> scanBackCardId(
      {required String imagePath}) async {
    emit(ScanTextLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    var result = await userDataRepo.getRecognizedIdCard(imagePath: imagePath);
    result.fold((scannedText) {
      scannedBackCardId = scannedText;
      emit(ScanTextSuccessState('Back ID Card Scanned Successfully'));
    }, (failure) {
      emit(ScanTextErrorState(failure.errMessage));
    });
  }
}
