







import 'package:blnk_task/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

abstract class UserDataRepo {
 
  Future <Either<String , Failure>> getRecognizedIdCard ({required String imagePath}) ;
  

}


class UserDataRepoImpl implements UserDataRepo {
  @override
  Future<Either<String, Failure>> getRecognizedIdCard({required String imagePath}) async {
      try {
         final inputImage = InputImage.fromFilePath(imagePath);
      final textDirector = GoogleMlKit.vision.textRecognizer();
      final RecognizedText recognizedText = await textDirector.processImage(inputImage);
      textDirector.close();
      String scannedText = ''; 
      for (TextBlock block in recognizedText.blocks) {
           for ( TextLine line in block.lines ) {
               scannedText = '$scannedText${line.text}\n' ;
           }
      }
      return left(scannedText) ;
      } catch (e) {
       return right(ScanFailure(e.toString()));  
      }
  }


  
    
}