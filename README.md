# IRいしかわ鉄道 運行情報アプリ

## 概要
IRいしかわ鉄道の運行情報および列車走行位置を確認できる
Flutter製のモバイルアプリです。

## スクリーンショット
<img width="400" alt="Image" src="https://github.com/user-attachments/assets/46dfe387-736a-4260-874f-b7c6d24a10e6" />

<img width="400" alt="Image" src="https://github.com/user-attachments/assets/92ee184a-ad60-48ae-af74-d2ea530e56cb" />


列車の現在位置を駅・駅間に分けて表示し、
列車をタップすることで行き先・種別・遅延情報を確認できます。

## 主な機能

- 運行情報の表示
- 列車走行位置の表示
- 上り・下り列車の表示
- 駅・駅間への列車位置表示
- 列車の詳細情報表示
  - 列車番号
  - 行き先
  - 種別
  - 遅延情報
- データの手動更新
- タブによる画面切り替え

## 技術スタック

- Flutter
- Dart
- Riverpod
- riverpod_generator
- HTTP
- REST API

## アーキテクチャ

Repositoryパターンを採用し、
UI・状態管理・データ取得の責務を分離しています。

```text
UI
 │
 ▼
Riverpod Provider
 │
 ▼
Repository
 │
 ▼
API DataSource
 │
 ▼
REST API
```

## ディレクトリ構成

```text
lib/
├── features/
│   ├── info/
│   │   ├── data_source/
│   │   │   └── train_info_api.dart
│   │   ├── model/
│   │   │   └── train_information.dart
│   │   ├── repository/
│   │   │   └── train_info_repository.dart
│   │   ├── provider/
│   │   │   ├── train_info_provider.dart
│   │   │   └── train_info_provider.g.dart
│   │   └── widget
│   │       └── info_page.dart
│   │
│   └── position/
│       ├── data_source/
│       │   └── train_api.dart
│       ├── model/
│       │   ├── driving_train.dart
│       │   ├── rail_view_item.dart
│       │   ├── station.dart
│       │   ├── train_location.dart
│       │   ├── train_service_view_data.dart
│       │   ├── train_service.dart
│       │   └── train.dart
│       ├── repository/
│       │   └── train_service_repository.dart
│       ├── provider/
│       │   ├── train_service_provider.dart
│       │   └── train_service_provider.g.dart
│       └── widget
│           └── train_page.dart
│
└── main.dart
```



### 列車走行位置の表示

APIから取得した列車情報を、そのままUIに渡すのではなく、
画面表示用のモデルに変換しています。

列車の位置は以下の2種類に分類しています。

- 駅に停車中
- 駅と駅の間を走行中

## 工夫した点

### APIレスポンスとUIモデルの分離

APIから取得したデータを直接Widgetで扱わず、
画面表示用のモデルへ変換しています。

### 駅と駅間を別のモデルとして表現

列車が「駅にいる」のか「駅間を走行している」のかを
`TrainLocation` として表現しています。

### Riverpodによる状態管理

API通信をProviderから切り離し、
Repositoryを経由してデータを取得しています。

### 列車情報の詳細表示

列車アイコンをタップすると、
行き先・種別・遅延情報を確認できるようにしています。

## 今後の改善

- 列車走行位置のリアルタイム更新
- 運行情報のプッシュ通知
- 対応路線の追加
- ダークモード対応
- エラーハンドリングの改善
- テストコード作成

## セットアップ

### 必要環境

- Flutter 3.x
- Dart 3.x

### 起動

```bash
git clone https://github.com/Hyakusetufutou/ir_ishikawa_railway_service_info.git

cd ir_ishikawa_railway_service_info

flutter pub get

dart run build_runner build --delete-conflicting-outputs

flutter run
```
