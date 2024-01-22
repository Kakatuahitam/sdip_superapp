import 'dart:io';
import 'package:dartz/dartz.dart';

import 'package:pramukajaksel_or_id_fe/data/helper/failure_exception.dart';
import 'package:pramukajaksel_or_id_fe/data/source/stat_remote_data_source.dart';
import 'package:pramukajaksel_or_id_fe/domain/entity/get_home_stat_response.dart';
import 'package:pramukajaksel_or_id_fe/domain/repository/stat_repository.dart';

class StatRepositoryImp extends StatRepository {
  final StatRemoteDataSource remote;

  StatRepositoryImp({
    required this.remote,
  });

  @override
  Future<Either<FailureException, GetHomeStatResponse>> getHomeStat() async {
    try {
      final result = await remote.getHomeStat();
      
      return Right(result.toEntity());
    } on SocketException {
      return const Left(FailureException('No internet connection'));
    } catch (e) {
      return Left(FailureException(e.toString()));
    }
  }
}
