abstract class UserDataStates {}

class InitState extends UserDataStates {}


class ScanTextLoadingState extends UserDataStates {}
class ScanTextSuccessState extends UserDataStates {
   final String message ;

  ScanTextSuccessState(this.message);
}
class ScanTextErrorState extends UserDataStates {
   final String errMessage ;

  ScanTextErrorState(this.errMessage);
}

class UserDataLoadingState extends UserDataStates {}

class UserDataSuccessState extends UserDataStates {}

class UserDataErrorState extends UserDataStates {}
