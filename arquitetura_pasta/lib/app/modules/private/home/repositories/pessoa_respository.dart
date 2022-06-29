import 'dart:developer';

import 'package:arquitetura_pasta/app/modules/private/home/models/pessoa_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/appClient/app_client.dart';
import '../../../../core/models/result_model.dart';
import 'abstract/pessoa_respository_abstract.dart';

class PessoaRepository implements IPessoaRepository {
  final String endpoint = "pessoa";
  final ApiClient _client;
  PessoaRepository({
    required ApiClient client,
  }) : _client = client;

  @override
  Future<List<PessoaModel>> getAllPessoas() async {
    Response response;
    try {
      response = await _client.dio.get(
        endpoint,
      );
      if (response.statusCode == 200) {
        final PagedResult<PessoaModel> pagedResult =
            PagedResult<PessoaModel>.fromJson(
                response.data, (json) => PessoaModel.fromJson(json));

        return pagedResult.resultado!;
      }
    } catch (exception, stackTrace) {
      log(
        "Erro ",
        error: exception,
        stackTrace: stackTrace,
      );
      return [];
    }
    return [];
  }
}
