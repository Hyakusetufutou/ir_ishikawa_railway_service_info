class Station {
  static const itoigawa = Station(
    name: '糸魚川',
    order: 150,
    odptId: 'odpt.Station:AinokazeToyama.EtigoTokimeki.Itoigawa',
  );

  static const tomari = Station(
    name: '泊',
    order: 100,
    odptId: 'odpt.Station:AinokazeToyama.AinokazeToyama.Tomari',
  );

  static const kurobe = Station(
    name: '黒部',
    order: 80,
    odptId: 'odpt.Station:AinokazeToyama.AinokazeToyama.Kurobe',
  );

  static const toyama = Station(
    name: '富山',
    order: 60,
    odptId: 'odpt.Station:AinokazeToyama.AinokazeToyama.Toyama',
  );

  static const isurugi = Station(
    name: '石動',
    order: 40,
    odptId: 'odpt.Station:AinokazeToyama.AinokazeToyama.Isurugi',
  );

  static const wakuraonsen = Station(
    name: '和倉温泉',
    order: 202,
    odptId: 'odpt.Station:JRWest.Nanao.Wakuraonsen',
  );

  static const nanao = Station(
    name: '七尾',
    order: 200,
    odptId: 'odpt.Station:JRWest.Nanao.Nanao',
  );

  static const takamatsu = Station(
    name: '高松',
    order: 200,
    odptId: 'odpt.Station:JRWest.Nanao.Takamatsu',
  );

  static const nakatsubata = Station(
    name: '中津幡',
    order: 190,
    odptId: 'odpt.Station:JRWest.Nanao.Nakatsubata',
  );

  static const kurikara = Station(
    name: '倶利伽羅',
    order: 38,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Kurikara',
  );

  static const tsubata = Station(
    name: '津幡',
    order: 36,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Tsubata',
  );

  static const morimoto = Station(
    name: '森本',
    order: 34,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Morimoto',
  );

  static const higashiKanazawa = Station(
    name: '東金沢',
    order: 32,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Higashi-Kanazawa',
  );

  static const kanazawa = Station(
    name: '金沢',
    order: 30,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Kanazawa',
  );

  static const nishiKanazawa = Station(
    name: '西金沢',
    order: 28,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Nishi-Kanazawa',
  );

  static const nonoichi = Station(
    name: '野々市',
    order: 26,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Nonoichi',
  );

  static const matto = Station(
    name: '松任',
    order: 24,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Matto',
  );

  static const nishiMatto = Station(
    name: '西松任',
    order: 22,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Nishi-Matto',
  );

  static const kagaKasama = Station(
    name: '加賀笠間',
    order: 20,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Kaga-Kasama',
  );

  static const mikawa = Station(
    name: '美川',
    order: 18,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Mikawa',
  );

  static const komaiko = Station(
    name: '小舞子',
    order: 16,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Komaiko',
  );

  static const nomiNeagari = Station(
    name: '能美根上',
    order: 14,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Nomi-Neagari',
  );

  static const meiho = Station(
    name: '明峰',
    order: 12,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Meiho',
  );

  static const komatsu = Station(
    name: '小松',
    order: 10,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Komatsu',
  );

  static const awazu = Station(
    name: '粟津',
    order: 8,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Awazu',
  );

  static const iburihashi = Station(
    name: '動橋',
    order: 6,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Iburihashi',
  );

  static const kagaonsen = Station(
    name: '加賀温泉',
    order: 4,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Kagaonsen',
  );

  static const daishoji = Station(
    name: '大聖寺',
    order: 2,
    odptId: 'odpt.Station:IRIshikawa.IRIshikawa.Daishoji',
  );

  static const ushinoya = Station(
    name: '牛ノ谷',
    order: 0,
    odptId: 'odpt.Station:HapilineFukui.HapilineFukui.Ushinoya',
  );

  static const fukui = Station(
    name: '福井',
    order: 900,
    odptId: 'odpt.Station:HapilineFukui.HapilineFukui.Fukui',
  );

  static const tsuruga = Station(
    name: '敦賀',
    order: 1000,
    odptId: 'odpt.Station:HapilineFukui.HapilineFukui.Tsuruga',
  );

  const Station({
    required this.name,
    required this.order,
    required this.odptId,
  });

  final String name;
  final int order;
  final String odptId;

  static const List<Station> namedStations = [
    tsuruga,
    fukui,
    ushinoya,
    daishoji,
    kagaonsen,
    iburihashi,
    awazu,
    komatsu,
    meiho,
    nomiNeagari,
    komaiko,
    mikawa,
    kagaKasama,
    nishiMatto,
    matto,
    nonoichi,
    nishiKanazawa,
    kanazawa,
    higashiKanazawa,
    morimoto,
    tsubata,
    kurikara,
    toyama,
    kurobe,
    tomari,
    itoigawa,
    nakatsubata,
    takamatsu,
    nanao,
    wakuraonsen,
  ];

  static final Map<String, Station> _byOdptId = {
    for (final station in namedStations) station.odptId: station,
  };

  static Station? fromOdptId(String id) {
    return _byOdptId[id];
  }

  static Station? terminalOdptId(String id) {
    return _byOdptId[id];
  }

  /// 画面に表示する順番
  ///
  /// 駅と駅の間にも列車を配置できるよう、
  /// orderを1ずつ増やしている。
  static const List<Station> irIshikawaStations = [
    daishoji,
    kagaonsen,
    iburihashi,
    awazu,
    komatsu,
    meiho,
    nomiNeagari,
    komaiko,
    mikawa,
    kagaKasama,
    nishiMatto,
    matto,
    nonoichi,
    nishiKanazawa,
    kanazawa,
    higashiKanazawa,
    morimoto,
    tsubata,
    kurikara,
  ];
}
