import 'package:dartz/dartz.dart';

import '../../../../core/class/api/failures.dart';
import '../models/search_model.dart';

abstract class SearchRepo {
  Future<Either<Failure,SearchModel>> getSearchData(String text);
   }