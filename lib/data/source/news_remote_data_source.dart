import 'package:pramukajaksel_or_id_fe/data/service/api_service.dart';
import 'package:pramukajaksel_or_id_fe/data/model/get_news_details_model.dart';
import 'package:pramukajaksel_or_id_fe/data/model/post_news_details_model.dart';

abstract class NewsRemoteDataSource {
  Future<GetNewsDetailsModel> getNewsDetails(news_id);
  Future<PostNewsDetailsModel> postNewsDetails(news_id, news_content);
}

class NewsRemoteDataSourceImp implements NewsRemoteDataSource {
  final ApiService apiService;

  NewsRemoteDataSourceImp(
    this.apiService,
  );

  @override
  Future<GetNewsDetailsModel> getNewsDetails(news_id) async {
    final response = await apiService.getNewsDetails(news_id);
    return response;
  }

  @override
  Future<PostNewsDetailsModel> postNewsDetails(news_id, news_content) async {
    final response = await apiService.postNewsDetails(news_id, news_content);
    return response;
  }
}
