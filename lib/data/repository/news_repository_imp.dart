import 'dart:io';
import 'package:dartz/dartz.dart';

import 'package:sdip_superapp/data/helper/failure_exception.dart';
import 'package:sdip_superapp/data/source/news_remote_data_source.dart';
import 'package:sdip_superapp/domain/entity/get_news_details_response.dart';
import 'package:sdip_superapp/domain/entity/post_news_details_response.dart';
import 'package:sdip_superapp/domain/repository/news_repository.dart';

class NewsRepositoryImp extends NewsRepository {
  final NewsRemoteDataSource remote;

  NewsRepositoryImp({
    required this.remote,
  });

  @override
  Future<Either<FailureException, GetNewsDetailsResponse>> getNewsDetails(news_id) async {
    try {
      final result = await remote.getNewsDetails(news_id);

      return Right(result.toEntity());
    } on SocketException {
      return const Left(FailureException('No internet connection'));
    } catch (e) {
      return Left(FailureException(e.toString()));
    }
  }

  @override
  Future<Either<FailureException, PostNewsDetailsResponse>> postNewsDetails(news_id, news_content) async {
    try {
      final result = await remote.postNewsDetails(news_id, news_content);
      return Right(result.toEntity());
    } on SocketException {
      return const Left(FailureException('No internet connection'));
    } catch (e) {
      return Left(FailureException(e.toString()));
    }
  }
}
