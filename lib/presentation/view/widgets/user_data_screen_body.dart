



import 'package:blnk_task/core/app_colors.dart';
import 'package:blnk_task/core/app_paddings.dart';
import 'package:blnk_task/core/app_styles.dart';
import 'package:blnk_task/core/extensions/media_query_extension.dart';
import 'package:blnk_task/core/extensions/validation_extension.dart';
import 'package:blnk_task/core/utils/constants.dart';
import 'package:blnk_task/data/repo/google_sheet_repo.dart';
import 'package:blnk_task/presentation/cubits/user_data_cubit.dart';
import 'package:blnk_task/presentation/cubits/user_data_states.dart';
import 'package:blnk_task/presentation/view/widgets/custom_card.dart';
import 'package:blnk_task/presentation/view/widgets/custom_material_button.dart';
import 'package:blnk_task/presentation/view/widgets/custom_pop_up.dart';
import 'package:blnk_task/presentation/view/widgets/custom_snck_bar.dart';
import 'package:blnk_task/presentation/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDataScreenBody extends StatefulWidget {
  const UserDataScreenBody({super.key});

  @override
  State<UserDataScreenBody> createState() => _UserDataScreenBodyState();
}

class _UserDataScreenBodyState extends State<UserDataScreenBody> {
  var formKey = GlobalKey<FormState>();
  int popUpSelectedItem = 0;

  @override
  Widget build(BuildContext context) {
    UserDataCubit userCubit = UserDataCubit.cubit(context);
    return BlocConsumer<UserDataCubit, UserDataStates>(
      listener: (context, state) {
        if (state is ScanTextSuccessState) {
          showSnackBar(
              context: context,
              content: state.message,
              backgroundColor: AppColors.green);
        }

        if (state is ScanTextErrorState) {
          showSnackBar(context: context, content: state.errMessage);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppPaddings.p30),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: context.width(context) * 0.5,
                      height: context.height(context) * 0.15,
                      child: FittedBox(
                          child: Text('Welcome',
                              style: AppStyles.mainTextStyle
                                  .copyWith(fontWeight: FontWeight.bold)))),
                  CustomTextFormField(
                    hintText: 'first name',
                    prefixWidget: const Icon(Icons.person),
                    maxLength: 15,
                    onChanged: (value) {
                      userCubit.userModel.firstName = value.trim();
                    },
                  ),
                  CustomTextFormField(
                    hintText: 'last name',
                    prefixWidget: const Icon(Icons.person),
                    maxLength: 15,
                    onChanged: (value) {
                      userCubit.userModel.lastName = value.trim();
                    },
                  ),
                  CustomTextFormField(
                    hintText: 'address',
                    prefixWidget: const Icon(Icons.location_city),
                    maxLength: 100,
                    onChanged: (value) {
                      userCubit.userModel.address = value.trim();
                    },
                  ),
                  CustomTextFormField(
                    hintText: 'landline',
                    prefixWidget: const Icon(Icons.phone_android),
                    maxLength: 15,
                    textInputType: TextInputType.number,
                    onChanged: (value) {
                      userCubit.userModel.landline = value.trim();
                    },
                  ),
                  CustomTextFormField(
                    hintText: 'phone number',
                    prefixWidget: const Icon(Icons.phone),
                    textInputType: TextInputType.phone,
                    onChanged: (value) {
                      userCubit.userModel.phoneNumber = value.trim();
                    },
                  ),
                  CustomPopUp(
                    popUpSelectedItem: popUpSelectedItem,
                    onSelected: (value) {
                      popUpSelectedItem = value;
                      userCubit.userModel.area =
                          AppConstants.popUpListItem[value];
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 40),
                  const CustomIdCard(),
                  const SizedBox(height: 50),
                  Visibility(
                    visible: state is! ScanTextLoadingState,
                    replacement: const Text(
                      'Waiting For Scanning Card ....',
                      style: AppStyles.textStyle15,
                    ),
                    child: CustomMaterialButton(onPressed: () {
                      sendButton(userCubit);
                      setState(() {
                        
                      });
                    }),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void sendButton(UserDataCubit userCubit) {
    if (userCubit.croppedFrontCard == null &&
        userCubit.croppedBackCard == null) {
      showSnackBar(
          context: context, content: 'Cropped Card Front And Back It is Must');
      return;
    }

    userCubit.userModel.cardID = userCubit.scannedFrontCardId;

    if (0.isValidate(formKey)) {
      GoogleSheetRepo.insertNewRowDataToGoogleSheet(
          userCubit.userModel.toMap());
    }

    showSnackBar(
        context: context,
        content: 'Data Send Successfully',
        backgroundColor: AppColors.green);
  }
}