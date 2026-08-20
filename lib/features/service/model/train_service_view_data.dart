class TrainServiceViewData {
  final String number;
  final String type;
  final String delay;
  final String startingStation;
  final String terminalStation;
  final String fromStation;
  final String toStation;
  final String railDirection;

  const TrainServiceViewData({
    required this.number,
    required this.type,
    required this.delay,
    required this.startingStation,
    required this.terminalStation,
    required this.fromStation,
    required this.toStation,
    required this.railDirection,
  });
}

enum Station {
  kurikara(name: '倶利伽羅'),
  tsubata(name: '津幡'),
  morimoto(name: '森本'),
  higashikanazawa(name: '東金沢'),
  kanazawa(name: '金沢'),
  nishikanazawa(name: '西金沢'),
  nonoichi(name: '野々市'),
  matto(name: '松任'),
  nishimatto(name: '西松任'),
  kagakasama(name: '加賀笠間'),
  mikawa(name: '美川'),
  komaiko(name: '小舞子'),
  nomineagari(name: '能美根上'),
  meiho(name: '明峰'),
  komatsu(name: '小松'),
  awazu(name: '粟津'),
  iburihashi(name: '動橋'),
  kagaonsen(name: '加賀温泉'),
  daishoji(name: '大聖寺');

  const Station({required this.name});

  final String name;
}

extension StaionMapper on String {
  Station? toStation() {
    switch (this) {
      case 'odpt.Station:IRIshikawa.IRIshikawa.Kurikara':
        return Station.kurikara;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Tsubata':
        return Station.tsubata;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Morimoto':
        return Station.morimoto;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Higashi-Kanazawa':
        return Station.higashikanazawa;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Kanazawa':
        return Station.kanazawa;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Nishi-Kanazawa':
        return Station.nishikanazawa;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Nonoichi':
        return Station.nonoichi;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Matto':
        return Station.matto;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Nishi-Matto':
        return Station.nishimatto;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Kagakasama':
        return Station.kagakasama;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Mikawa':
        return Station.mikawa;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Komaiko':
        return Station.komaiko;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Nomi-Neagari':
        return Station.nomineagari;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Meiho':
        return Station.meiho;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Komatsu':
        return Station.komatsu;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Awazu':
        return Station.awazu;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Iburihashi':
        return Station.iburihashi;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Kagaonsen':
        return Station.kagaonsen;
      case 'odpt.Station:IRIshikawa.IRIshikawa.Daishoji':
        return Station.daishoji;
      default:
        return null;
    }
  }
}
