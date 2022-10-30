import 'package:flutter/cupertino.dart';
import 'package:search_with_bloc/service/network_service.dart';

class SearchViewModel{
  final _networkService=NetworkService();
  Future search(BuildContext context,String name){
    return _networkService.get({}, context, name);
  }
}
class NetworkError extends Error{
  
}