



abstract class Failure {
   final String errMessage ;

  Failure(this.errMessage);
} 



class ScanFailure extends Failure {
    ScanFailure(super.errMessage);
}

class GoogleSheetFailure extends Failure {
  GoogleSheetFailure(super.errMessage);
    
}