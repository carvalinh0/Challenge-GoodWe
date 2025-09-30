import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class WarningsCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? adcode = '',
    String? status = '',
    String? startTime = '',
    String? endTime = '',
    List<String>? listOfDevicesList,
    List<String>? listOfClassificationsList,
    List<String>? listOfFaultlevelList,
    String? region = 'eu',
    String? orgid = '',
    String? stationid = '',
    String? township = '',
    String? warninglevel = '7',
  }) async {
    final listOfDevices = _serializeList(listOfDevicesList);
    final listOfClassifications = _serializeList(listOfClassificationsList);
    final listOfFaultlevel = _serializeList(listOfFaultlevelList);

    return ApiManager.instance.makeApiCall(
      callName: 'warnings',
      apiUrl:
          'https://${region}.semsportal.com/api/SmartOperateMaintenance/GetPowerStationWariningInfoByMultiCondition',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json, text/javascript, */*; q=0.01',
        'Accept-Language': 'pt-BR,en-US;q=0.7,en;q=0.3',
        'Accept-Encoding': 'gzip, deflate, br, zstd',
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'token': '${token}',
        'neutral': '0',
        'X-Requested-With': 'XMLHttpRequest',
      },
      params: {
        'adcode': adcode,
        'device_type': listOfDevices,
        'endtime': endTime,
        'fault_classification': listOfClassifications,
        'orgid': orgid,
        'standard_faultLevel': listOfFaultlevel,
        'starttime': startTime,
        'stationid': stationid,
        'status': status,
        'township': township,
        'warninglevel': warninglevel,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? hasError(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.hasError''',
      ));
  static int? numeroDeAvisos(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.record''',
      ));
  static List<String>? sn(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].devicesn''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? inversor(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].deviceName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? status(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? falha(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].error_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? nivelDeFalha(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].warninglevel''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? planta(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].stationname''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? classificacaoDeFalha(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].error_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? datetime(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].happentime''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class OnlinePlantsCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? region = '',
  }) async {
    final ffApiRequestBody = '''
{"adcode":"","org_id":"","qry_type":1}''';
    return ApiManager.instance.makeApiCall(
      callName: 'onlinePlants',
      apiUrl:
          'https://${region}.semsportal.com/api/PowerStationMonitor/StatPowerStationKPI',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Accept-Language': 'pt-BR,en-US;q=0.7,en;q=0.3',
        'Accept-Encoding': 'gzip, deflate, br, zstd',
        'Content-Type': 'application/json',
        'token': '${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? plantasStatusQuantidade(dynamic response) => (getJsonField(
        response,
        r'''$.data.powerstation_status[:].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? plantasStatus(dynamic response) => (getJsonField(
        response,
        r'''$.data.powerstation_status[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static int? plantasNovasMes(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.today_add.count''',
      ));
  static double? geracaoTotal(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data.power_income.etotal''',
      ));
  static double? geracaoHoje(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data.power_income.eday''',
      ));
  static bool? hasError(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.hasError''',
      ));
  static double? rendaHoje(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.power_income.eday_income''',
      ));
  static double? rendaTotal(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data.power_income.etotal_income''',
      ));
  static String? moeda(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.result.currency''',
      ));
}

class PlantsListCall {
  static Future<ApiCallResponse> call({
    String? region = '',
    String? adcode = '',
    String? condition = '',
    String? key = '',
    String? orderby = '',
    String? orgId = '',
    String? powerstationId = '',
    String? powerstationStatus = '',
    String? powerstationType = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
"powerstation_id":"",
"key":"",
"orderby":"",
"powerstation_type":"",
"powerstation_status":"",
"page_index":1,
"page_size":1000,
"adcode":"",
"org_id":"",
"condition":""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'plantsList',
      apiUrl:
          'https://${region}.semsportal.com/api/PowerStationMonitor/QueryPowerStationMonitor',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json, text/javascript, */*; q=0.01',
        'Accept-Language': 'pt-BR,en-US;q=0.7,en;q=0.3',
        'Accept-Encoding': 'gzip, deflate, br, zstd',
        'Content-Type': 'application/json',
        'token': '${token}',
        'neutral': '1',
        'X-Requested-With': 'XMLHttpRequest',
        'DNT': '1',
        'Sec-Fetch-Dest': 'empty',
        'Sec-Fetch-Mode': 'cors',
        'Sec-Fetch-Site': 'same-origin',
        'Pragma': 'no-cache',
        'Cache-Control': 'no-cache',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? hasError(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.hasError''',
      ));
  static int? numeroDePlantas(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.record''',
      ));
  static List<String>? nomePlanta(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].stationname''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? producaoHoje(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].eday''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? localizacaoDaPlanta(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].location''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? producaoMes(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].emonth''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? preducaoTotal(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].etotal''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? classificacao(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].powerstation_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? condicaoClimaAgora(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].weather.HeWeather6[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? porcentagemNuvemAgora(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].weather.HeWeather6[:].now.cloud''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? climaAgora(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].weather.HeWeather6[:].now.cond_txt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? temperaturaAgora(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].weather.HeWeather6[:].now.tmp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? moeda(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].currency''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? potenciaAgora(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].pac''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? rendaHoje(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].eday_income''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? longitudePlanta(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].longitude''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? latitudePlanta(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].latitude''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? capacidadePlanta(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].capacity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<int>? statusPlanta(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? idPlanta(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].powerstation_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? rendimento(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].to_hour''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
}

class GetStatMonthCall {
  static Future<ApiCallResponse> call({
    String? region = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
''';
    return ApiManager.instance.makeApiCall(
      callName: 'getStatMonth',
      apiUrl: 'https://${region}.semsportal.com/api/BigScreen/StatMonth12',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Accept-Language': 'pt-BR,en-US;q=0.7,en;q=0.3',
        'Accept-Encoding': 'gzip, deflate, br, zstd',
        'ContentType': 'application/json',
        'token': '${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? mes(dynamic response) => (getJsonField(
        response,
        r'''$.data.month[:].date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? potencia(dynamic response) => (getJsonField(
        response,
        r'''$.data.month[:].power''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? renda(dynamic response) => (getJsonField(
        response,
        r'''$.data.month[:].income''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static bool? hasError(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.hasError''',
      ));
  static List? jsonChart(dynamic response) => getJsonField(
        response,
        r'''$.data.month''',
        true,
      ) as List?;
}

class DetalhesPlantaCall {
  static Future<ApiCallResponse> call({
    String? region = '',
    String? token = '',
    String? powerstationId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'detalhesPlanta',
      apiUrl:
          'https://${region}.semsportal.com/api/v3/PowerStation/GetPlantDetailByPowerstationId',
      callType: ApiCallType.POST,
      headers: {
        'token': '${token}',
        'Accept': 'application/json',
        'Accept-Language': 'pt-BR,en-US;q=0.7,en;q=0.3',
        'Accept-Encoding': 'gzip, deflate, br, zstd',
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'TE': 'trailers',
      },
      params: {
        'powerStationId': "${powerstationId}",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? powerStationId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.info.powerstation_id''',
      ));
  static String? horarioPlanta(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.info.time''',
      ));
  static String? nomePlanta(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.info.stationname''',
      ));
  static String? enderecoPlanta(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.info.address''',
      ));
  static double? capacidadePlanta(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data.info.capacity''',
      ));
  static String? dataCriacaoPlanta(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.info.create_time''',
      ));
  static double? capacidadeBateria(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data.info.battery_capacity''',
      ));
  static bool? hasError(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.hasError''',
      ));
  static String? tipoPlanta(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.info.powerstation_type''',
      ));
  static int? statusPlanta(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.info.status''',
      ));
  static double? geracaoPlantaMes(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data.kpi.month_generation''',
      ));
  static double? potenciaPlantaAgora(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data.kpi.power''',
      ));
  static double? potenciaTotalPlanta(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data.kpi.total_power''',
      ));
  static double? rendaTotalPlanta(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data.kpi.total_income''',
      ));
  static double? rendaPlantaHoje(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data.kpi.day_income''',
      ));
  static String? moedaPlanta(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.kpi.currency''',
      ));
  static bool? precisaDeGrafico(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.data.isPowerflow''',
      ));
  static List<String>? indicesChart(dynamic response) => (getJsonField(
        response,
        r'''$.data.chartsTypesByPlant[:].chartIndices[:].dateRange[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? valoresIndicesChart(dynamic response) => (getJsonField(
        response,
        r'''$.data.chartsTypesByPlant[:].chartIndices[:].dateRange[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? chartLabelTypes(dynamic response) => (getJsonField(
        response,
        r'''$.data.chartsTypesByPlant[:].chartIndices[:].indexLabel''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class DetalhesInversoresCall {
  static Future<ApiCallResponse> call({
    String? region = '',
    String? token = '',
    String? powerstationId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'detalhesInversores',
      apiUrl:
          'https://${region}.semsportal.com/api/v3/PowerStation/GetInverterAllPoint',
      callType: ApiCallType.POST,
      headers: {
        'token': '${token}',
        'Accept': 'application/json',
        'Accept-Language': 'pt-BR,en-US;q=0.7,en;q=0.3',
        'Accept-Encoding': 'gzip, deflate, br, zstd',
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'TE': 'trailers',
      },
      params: {
        'powerStationId': "${powerstationId}",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? nsInversor(dynamic response) => (getJsonField(
        response,
        r'''$.data.inverterPoints[:].sn''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? nomeInversor(dynamic response) => (getJsonField(
        response,
        r'''$.data.inverterPoints[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? ultimoReinicio(dynamic response) => (getJsonField(
        response,
        r'''$.data.inverterPoints[:].last_refresh_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? totalHorasLigado(dynamic response) => (getJsonField(
        response,
        r'''$.data.inverterPoints[:].hTotal''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? geracaoTotalInversor(dynamic response) => (getJsonField(
        response,
        r'''$.data.inverterPoints[:].etotal''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? geracaoHoje(dynamic response) => (getJsonField(
        response,
        r'''$.data.inverterPoints[:].eday''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? geracaoMes(dynamic response) => (getJsonField(
        response,
        r'''$.data.inverterPoints[:].emonth''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<int>? statusInversor(dynamic response) => (getJsonField(
        response,
        r'''$.data.inverterPoints[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static int? quantidadeInversores(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.data.count''',
      ));
  static List? informacoesInversores(dynamic response) => getJsonField(
        response,
        r'''$.data.inverterPoints''',
        true,
      ) as List?;
}

class PowerflowCall {
  static Future<ApiCallResponse> call({
    String? region = '',
    String? token = '',
    String? powerstationId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'powerflow',
      apiUrl:
          'https://${region}.semsportal.com/api/v2/PowerStation/GetPowerflow',
      callType: ApiCallType.POST,
      headers: {
        'token': '${token}',
        'Accept': 'application/json',
        'Accept-Language': 'pt-BR,en-US;q=0.7,en;q=0.3',
        'Accept-Encoding': 'gzip, deflate, br, zstd',
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
      params: {
        'powerStationId': "${powerstationId}",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? precisaDoDiagrama(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.data.hasPowerflow''',
      ));
  static String? ioBateria(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.powerflow.bettery''',
      ));
  static String? ioRede(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.powerflow.grid''',
      ));
  static String? ioRequisito(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.powerflow.load''',
      ));
  static String? ioProducao(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.powerflow.genset''',
      ));
  static String? pv(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.powerflow.pv''',
      ));
  static int? statusPV(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.powerflow.pvStatus''',
      ));
  static int? fluxoBateria(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.powerflow.betteryStatus''',
      ));
  static int? fluxoRequisicao(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.powerflow.loadStatus''',
      ));
  static String? porcentagemBateriaText(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.powerflow.socText''',
      ));
  static int? fluxoRede(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.powerflow.gridStatus''',
      ));
  static int? porcentagemBateria(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.data.powerflow.soc''',
      ));
}

class GraficoPlantaCall {
  static Future<ApiCallResponse> call({
    String? region = '',
    String? token = '',
    String? powerstationId = '',
    String? date = '',
  }) async {
    final ffApiRequestBody = '''
{id: "${powerstationId}", date: "${date}", full_script: false}''';
    return ApiManager.instance.makeApiCall(
      callName: 'graficoPlanta',
      apiUrl:
          'https://${region}.semsportal.com/api/v2/Charts/GetPlantPowerChart',
      callType: ApiCallType.POST,
      headers: {
        'token': '${token}',
        'acecpt': 'application/json, text/javascript, */*; q=0.01',
        'Accept-Language': 'pt-BR,en-US;q=0.7,en;q=0.3',
        'Accept-Encoding': 'gzip, deflate, br, zstd',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPowerStationWariningInfoByMultiConditionCall {
  static Future<ApiCallResponse> call({
    String? adcode = '',
    List<String>? deviceTypeListList,
    String? endDateEndExactTime = '',
    List<String>? faultClassificationListList,
    String? startDateStartExactTime = '',
    String? status = '',
    String? region = '',
    String? token = '',
    List<String>? standardFaultLevelListList,
  }) async {
    final deviceTypeList = _serializeList(deviceTypeListList);
    final faultClassificationList = _serializeList(faultClassificationListList);
    final standardFaultLevelList = _serializeList(standardFaultLevelListList);

    final ffApiRequestBody = '''
{
adcode: "${adcode}",
device_type: ${deviceTypeList},
endtime: "${endDateEndExactTime}",
fault_classification: ${faultClassificationList},
orgid: "",
page_size: 100,
standard_faultLevel: ${standardFaultLevelList},
starttime: "${startDateStartExactTime}",
stationid: "",
status: "${status}",
township: "",
warninglevel: 7
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetPowerStationWariningInfoByMultiCondition',
      apiUrl:
          'https://${region}.semsportal.com/api/SmartOperateMaintenance/GetPowerStationWariningInfoByMultiCondition',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'accept-encoding': 'gzip, deflate, br, zstd',
        'accept-language': 'pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7',
        'token': '${token}',
        'neutral': '0',
        'accept': 'application/json, text/javascript, */*; q=0.01',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? nomePlanta(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].stationname''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? snDispositivo(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].devicesn''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? nomeDispositivo(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].deviceName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tipoDispositivo(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].device_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? tipoDeAlarme(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? tipoDeFalha(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].error_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List? tipoDeCulpa(dynamic response) => getJsonField(
        response,
        r'''$.data.list[:].fault_classification''',
        true,
      ) as List?;
  static List<int>? tipoDeErro(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].error_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? precisaDeAtencao(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].attention''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? horaDeRecuperacao(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].recoverytime''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tipoDeEnergia(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].pw_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? codigoDeAviso(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].warning_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? nivelDeAviso(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].warninglevel''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? nomeDoAviso(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].warningname''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? idDaPlanta(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].stationId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? idDoAviso(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].warningid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? quandoAconteceu(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].happentime''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? regiao(dynamic response) => (getJsonField(
        response,
        r'''$.data.list[:].adcode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? quantidadeDeAvisos(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.data.record''',
      ));
}

class GetImageAndHomeKitLimitCall {
  static Future<ApiCallResponse> call({
    String? region = '',
    String? token = '',
    String? powerstationId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetImageAndHomeKitLimit',
      apiUrl:
          'https://${region}.semsportal.com/api/v3/PowerStation/GetImageAndHomeKitLimit',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json, text/javascript, */*; q=0.01',
        'Accept-Encoding': 'gzip, deflate, br, zstd',
        'Accept-Language': 'pt-BR,en-US;q=0.7,en;q=0.3',
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'DNT': '1',
        'neutral': '0',
        'token': '${token}',
      },
      params: {
        'powerStationId': "${powerstationId}",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? image(dynamic response) => (getJsonField(
        response,
        r'''$.data.images[0]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetPowerStationTotalDataCall {
  static Future<ApiCallResponse> call({
    String? region = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetPowerStationTotalData',
      apiUrl:
          'https://${region}.semsportal.com/api/BigScreen/GetPowerStationTotalData',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json, text/javascript, */*; q=0.01',
        'Accept-Encoding': 'gzip, deflate, br, zstd',
        'Accept-Language': 'pt-BR,en-US;q=0.7,en;q=0.3',
        'Content-Type': 'application/json',
        'dnt': '1',
        'neutral': '1',
        'token': '${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? co2(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.co2''',
      ));
  static double? tree(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.tree''',
      ));
  static double? coal(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.coal''',
      ));
}

class GetWeatherCall {
  static Future<ApiCallResponse> call({
    String? region = '',
    String? token = '',
    String? plantId = '',
  }) async {
    final ffApiRequestBody = '''
{powerStationId: "${escapeStringForJson(plantId)}"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetWeather',
      apiUrl: 'https://${region}.semsportal.com/api/v3/PowerStation/GetWeather',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json, text/javascript, */*; q=0.01',
        'Accept-Encoding': 'gzip, deflate, br, zstd',
        'Accept-Language': 'pt-BR,en-US;q=0.7,en;q=0.3',
        'Content-Type': 'application/json',
        'dnt': '1',
        'neutral': '0',
        'token': '${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? indiceUV(dynamic response) => (getJsonField(
        response,
        r'''$.data.weather.HeWeather6[:].daily_forecast[:].uv_index''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? clima(dynamic response) => (getJsonField(
        response,
        r'''$.data.weather.HeWeather6[:].daily_forecast[:].cond_txt_d''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? temperaturaMax(dynamic response) => (getJsonField(
        response,
        r'''$.data.weather.HeWeather6[:].daily_forecast[:].tmp_max''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? temperaturaMin(dynamic response) => (getJsonField(
        response,
        r'''$.data.weather.HeWeather6[:].daily_forecast[:].tmp_min''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
