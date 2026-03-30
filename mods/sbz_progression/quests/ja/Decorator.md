# Questline: デコレーター

機械だけの島はとても退屈に見えます！デコレータークエストラインの知識を使って島を彩りましょう！これらのクエストは進行に必須ではありませんが、空っぽで荒涼とした暗い島ではゲームがつまらなくなります。だからこのクエストラインを無視しないでくださいね？ :P

## 圧縮コアダスト
### ID: qid_compressed_core_dust

### Text

宇宙ステーションを拡張し続けると、「このコアダストをどうすればいいの？」と思うかもしれません。答えは...

圧縮することです！圧縮コアダストは建築材料として使えます。

### Meta

Requires: qid_a_bigger_platform

## さらなる反物質
### ID: qid_more_antimatter

### Text

反物質ブロブもクラフトできます。非常にかすかな光を放ち、島を照らすための照明ノードを解放します。
いくつかの装飾ブロックの反物質バージョンも作れます！

以前は通常のマターの隣に置くと爆発しましたが、新しいアップデートでそれはなくなりました。

### Meta

Requires: qid_antimatter

## 反物質消滅機
### ID: qid_anti_annihilator

### Text

残念ながら、またしても設置したノード[反物質ノード]を壊すほどの力がないようです。それを壊せるものをクラフトしましょう。

### Meta

Requires: qid_more_antimatter

## スクリュードライバー
### ID: qid_screwdriver

### Text

スクリュードライバーはクリックするとノードを回転させます。
TIP: Minetest Gameのスクリュードライバーと同様に機能します。

### Meta

Requires: qid_antimatter, qid_introduction

## CNC機械
### ID: qid_cnc_machines

### Text

階段やスラブのような四角でない形状が欲しいですか？
ちょうどいい機械があります！

CNC機械を使えば、様々な階段やスラブが作れます...
クラフトして、お好みのブロック*を入れると完成！

*ノードがCNC機械に対応している必要があります。通常、灰色の「これで階段が作れます！」というテキストがあります。

### Meta

Requires: qid_emittrium_circuits

## 工場の床
### ID: qid_factory_flooring

### Text

工場の床として使うノードで、クラシックな雰囲気を演出できます。

### Meta

Requires: qid_a_bigger_platform

## タイル張り工場の床
### ID: qid_tiled_factory_flooring

### Text

さらにタイリングを追加した工場の床のバリエーションです！

### Meta

Requires: qid_a_bigger_platform, qid_factory_flooring

## 工場換気扇
### ID: qid_factory_ventilator

### Text

工場内に換気システムが必要かもしれません、なんて。

### Meta

Requires: qid_factory_flooring, qid_crusher

## 強化マター
### ID: qid_reinforced_matter

### Text

通常のマターでは頑丈さが足りない？これを試してみてください。

### Meta

Requires: qid_a_bigger_platform, qid_matter_plates

## エミッタイミテーター
### ID: qid_emitter_imitators

### Text

エミッタイミテーターは光を提供する装飾ノードです。

TIP: エミッタイミテーターをパンチするとたくさんのパーティクルが生まれます。試してみてください！

### Meta

Requires: qid_a_bigger_platform, qid_more_antimatter

## フォトンランプ
### ID: qid_photon_lamps

### Text

エミッタイミテーターが暗すぎますか？フォトンランプをご紹介します！

この革命的な技術を使えば、エミッタイミテーターと同じように世界を照らすことができますが、もっと明るいです！

クラフト方法：中央にマターブロブ、4つの角にマタープレート、残りのスペースに通常のエミッタイミテーターを配置します。
完成！これでフォトンランプができました！暗闇に座ることはもうありません！やった！

### Meta

Requires: qid_emitter_imitators, qid_matter_plates

## リン光体
### ID: qid_phosphor

### Text

一方で、エミットリウム回路でエミッタイミテーターをクラフトするとリン光体が作れます。これは非常に弱い光源ですが、電力でオン/オフを切り替えられます。機械が動いているかどうかのインジケーターとして、またはディスコのために使えます。

### Meta

Requires: qid_emitter_imitators, qid_emittrium_circuits

## 看板
### ID: qid_signs

### Text

世界内で見える文字を書きたいですか？看板のクラフトを検討してください。

### Meta

Requires: qid_antimatter

## 電力ランプ
### ID: qid_powered_lights

### Text

安くエリアを照らしたいですか？電力ランプがその方法です。もっと安いものが見つかったらバグです。
または広いエリアを照らしたいなら、超高出力ランプがあります。比較的低い電力消費で13×13×13の立方体を目に見えないライトで満たします！

### Meta

Requires: qid_switching_station, qid_more_antimatter, qid_emittrium_glass

## 着色ツール
### ID: qid_coloring_tool

### Text

ノードに色をつけるためのツールです。
着色するノード1つにつき1カラーリウムが必要です。

カラーリウムの葉からカラーリウムダストを抽出し、炉に入れます。
そのカラーリウムでツールを作ります。

### Meta

Requires: qid_colorium_trees

## レンガ
### ID: qid_bricks

### Text

建築に使えるより豪華な伝統的なレンガです。

### Meta

Requires: qid_clay

## ミステリー水族館
### ID: qid_mystery_terrarium

### Text

中に何があるのかな...

### Meta

Requires: qid_growing_plants, qid_planet_ores

## 大型サーバーラック
### ID: qid_large_server_rack

### Text

虹色のLEDが付いたサーバーラックのような装飾ノードです。

### Meta

Requires: qid_engraver, qid_knowledge_stations, qid_ele_fabs

## 接地ライン
### ID: qid_ground_line

### Text

床の上のライン。完全な2Dではありません。着色できます。

### Meta

Requires: qid_colorium_trees

## 電力接地ライン
### ID: qid_power_ground_line

### Text

接地ラインと同様の床のライン。アニメーション付きで、ケーブルのように電力を伝えます。

### Meta

Requires: qid_colorium_trees, qid_power_cables

## 反物質ブロック
### ID: qid_antiblocks

### Text

反物質ブロック：完全に透明なノードで、後ろのノードの面を隠して壁越しに見えるようにします。
空気状反物質ブロック：通常の反物質ブロックと同じ特性ですが、歩いて通り抜けられます。

### Meta

Requires: qid_colorium_trees, qid_antimatter