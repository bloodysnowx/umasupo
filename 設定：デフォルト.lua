----------------------------------------------------------------------------------------------------
-- ※このスクリプトファイルはデフォルトの動作を記述しているファイルです
-- ※このスクリプトファイルは読み込み処理を行っていないので編集しても反映されません
-- ※動作を変更したい場合は『設定.lua』へ変更したい部分をコピペして編集して下さい
-- ※このファイルを変更しても起動時にデフォルトのファイルに上書きされるのでご注意下さい
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- 基本設定
----------------------------------------------------------------------------------------------------

-- コンティニューを利用するか
-- trueの場合、関数設定のisContinue関数の条件に従ってコンティニューする
-- falseの場合はコンティニューしない
CONFIG.CONTINUE = true


-- スキルの確認を行う時期
-- 指定した時期以降になるとスキルの確認を行い習得する処理が実行される
-- SEASON.○○○のように時期のデータベースに登録している定数名を指定する
-- 以下のようにfalseまたはnilを指定すると育成完了までスキルの確認を行わなくなる
-- CONFIG.CHECK_SKILL_SEASON = false
CONFIG.CHECK_SKILL_SEASON = SEASON.CLASSIC_1A


-- 確保するスキルポイント
-- 現在のスキルポイントが指定したスキルポイント以上の場合のみスキルの確認やスキルの習得処理が実行される
-- 育成完了時は指定したスキルポイントに関係なくスキルの習得処理が実行される
CONFIG.KEEP_SKILLPT = 180


-- 読み込むマイローテ番号
-- 0～8を指定する
-- 0の場合はマイローテを読み込まない
-- 0以外の場合はデビュー後マイローテが読み込み可能になった時に読み込まれる
-- 予約レースを設定している時期になると自動的に設定したレースへ出走する
CONFIG.MY_ROTATION = 0


-- 強制的に出走するレース
-- 指定したレースが開催されている時期になると強制的にそのレースへ出走する
-- 添字を1から連番にすればいくつでも指定可
-- 同じ時期に開催されるレースが複数指定されている場合は添字の少ないほうが優先される
-- 空文字を指定すると無視される
-- ツール内で設定しているレース名を指定する
-- 例：CONFIG.RUN_RACE[1] = { name = "フローラステークス", seasonName = "" }
-- seasonName = "クラシック級" の様に時期名を指定するとその時期名にマッチ（部分一致指定可）したレースのみ出走する
-- 例：CONFIG.RUN_RACE[1] = { name = "ギャラクシーステークス", seasonName = "クラシック級" }
CONFIG.RUN_RACE[1] = { name = "", seasonName = "" }
CONFIG.RUN_RACE[2] = { name = "", seasonName = "" }
CONFIG.RUN_RACE[3] = { name = "", seasonName = "" }
CONFIG.RUN_RACE[4] = { name = "", seasonName = "" }
CONFIG.RUN_RACE[5] = { name = "", seasonName = "" }


-- チーム対抗戦の対戦相手
-- アオハル杯シナリオのみ有効
-- シーズン毎に対戦相手を変更したい場合はonStartTurn関数で変更する（onStartTurn関数内のコメントを参照）
-- 1 上
-- 2 中央
-- 3 下
CONFIG.TEAM_BATTLE_SELECT = 1


-- ライバルが出走しているレースを確認するか
-- クライマックスシナリオのみ有効
-- trueの場合は確認する
-- falseの場合は確認しない
-- trueにした場合はVSアイコンが表示されたときにレース一覧を開きライバルが出走しているレースを確認した上でレースのスコアに反映する
CONFIG.CHECK_RIVAL = false


-- ステータスを毎ターン自動で保存するか
-- trueの場合は保存する
-- falseの場合は保存しない
-- ステータスはスクリプト停止時や育成完了時に保存されるようになっているので通常は有効にする必要はない
CONFIG.AUTO_SAVE = false


-- 新規の時期を検出した時に新規登録するか
-- trueの場合は登録する
-- falseの場合は登録しない
-- 誤認識で新規の時期を検出してしまうのを防止するために通常はfalseを指定するのを推奨
CONFIG.REGISTER_SEASON = false


-- 新規のイベントを検出した時に新規登録後にイベントの編集を行うか
-- trueの場合は編集を行う
-- falseの場合は編集を行わず、不明状態のまま保存されます。この場合スクリプトは一時停止せずにそのまま実行が継続されます
-- trueを指定することを推奨しますが、新規のイベント検出時にイベントを編集するのが面倒な場合はfalseにしてください
-- 不明状態のイベントは後で編集することも可能です
-- 不明状態のイベントはランダムで選択肢が選ばれます
CONFIG.EDIT_EVENT = true


-- 新規の選択肢なしイベントを検出した時に新規登録するか
-- trueの場合は登録する
-- falseの場合は登録しない
CONFIG.REGISTER_NO_CHOICE_EVENT = true


-- 新規の選択肢なしイベントを検出した時に新規登録後にイベントの編集を行うか
-- CONFIG.REGISTER_NO_CHOICE_EVENTがfalseの場合は新規登録されないので設定する必要はない
-- trueの場合は編集を行う
-- falseの場合は編集を行わず、不明状態のまま保存されます。この場合スクリプトは一時停止せずにそのまま実行が継続されます
-- 不明状態の選択肢なしイベントは後で編集することも可能です
CONFIG.EDIT_NO_CHOICE_EVENT = false


-- 新規のスキルを検出した時に新規登録後にスキルの編集を行うか
-- trueの場合は編集を行う
-- falseの場合は編集を行わず、不明状態のまま保存されます。この場合スクリプトは一時停止せずにそのまま実行が継続されます
-- 不明状態のスキルは後で編集することも可能です
CONFIG.EDIT_SKILL = true


-- 固有スキルのスキル詳細画面で新規のスキルを検出した時にスキルの選択を行うか
-- trueの場合は選択を行う
-- falseの場合は選択を行わず、固有スキルのレベルのみ取得する
CONFIG.EDIT_SKILL_DETAIL = true


-- 新規の因子を検出した時に新規登録後に因子の編集を行うか
-- trueの場合は編集を行う
-- falseの場合は編集を行わず、不明状態のまま保存されます。この場合スクリプトは一時停止せずにそのまま実行が継続されます
-- 不明状態の因子は後で編集することも可能です
CONFIG.EDIT_FACTOR = true


-- 新規のコンディションを検出した時に新規登録後にコンディションの編集を行うか
-- trueの場合は編集を行う
-- falseの場合は編集を行わず、不明状態のまま保存されます。この場合スクリプトは一時停止せずにそのまま実行が継続されます
-- 不明状態のコンディションは後で編集することも可能です
CONFIG.EDIT_CONDITION = true


-- 限定セールショップで新規のピースを検出した時にキャラクターの選択を行うか
-- trueの場合は選択を行う
-- falseの場合は選択を行わず、ピースは不明になる
CONFIG.EDIT_PIECE = true


-- 限定セールショップで新規の優勝レイを検出した時にレースの選択を行うか
-- trueの場合は選択を行う
-- falseの場合は選択を行わず、優勝レイは不明になる
CONFIG.EDIT_LEI = true


-- トレーニング確認時にランダムな順番で確認を行う確率を百分率で指定する
-- 通常時はスピード～賢さまで順番に確認を行う
-- 50を指定すると50%の確率でランダムな順番で確認を行う
-- 確実にランダムな順番で確認を行いたい場合は100を指定する
-- ランダムな順番で確認を行いたくない場合は0を指定する
CONFIG.SHUFFLE_CHECK_TRAINING_RATE = 50


-- ウマ娘の再起動を行う経過時間
-- 指定した時間が経過すると自動的にウマ娘が再起動され、タイトル画面からスクリプトの処理が再開される（スクリプトが動作しなくなった場合の対策）
-- 経過時間は枠の下側に表示され、ステータスの状態に変化があった時などにリセットされる
CONFIG.REBOOT_TIME = 60 * 3


----------------------------------------------------------------------------------------------------
-- 全自動育成モードの設定
----------------------------------------------------------------------------------------------------

-- 全自動育成モードを有効にするか
-- trueを指定すると有効
-- falseを指定すると無効
-- 有効にするとホーム画面でスクリプトを開始すると育成ウマ娘、継承ウマ娘、サポート編成を行った後、育成を開始し、自動育成を行った後にホーム画面へ戻ると再び育成を繰り返す
-- 無効の場合はホーム画面でスクリプトを開始してもスクリプトは終了される
-- 全自動育成モードを有効にした状態で育成を開始した後に、現在行っている育成が終わったらスクリプトを自動的に終了させたい場合は無効にすればホーム画面に戻った時にスクリプトは終了される
CONFIG.AUTO_MODE.ENABLE = false


-- 全自動育成モードを動作させる時間帯（bot検知対策）
-- min時からmax時以内まで動作する
-- ホーム画面で指定時間外の場合は育成は開始せずにスクリプトは待機モードになる
-- 待機モードで待機する時間は『待機時間』の項目で設定する（CONFIG.WAIT.HOME）
-- 待機モードで待機後に指定時間内になると育成が開始される
-- 添字を1から連番にすればいくつでも指定可
-- 例えば19:00から1:59までのみ動作させたい場合は以下のように記述する
-- CONFIG.AUTO_MODE.ACTIVE_HOUR[1] = { min = 19, max = 23 }
-- CONFIG.AUTO_MODE.ACTIVE_HOUR[2] = { min =  0, max =  1 }
CONFIG.AUTO_MODE.ACTIVE_HOUR[1] = { min = 0, max = 23 }


-- 育成を周回する回数
-- 0を指定すると無限に周回する
-- 1以上を指定すると指定した回数だけ周回する
CONFIG.AUTO_MODE.TRAINING_COUNT = 0


-- 育成周回中にチーム競技場へ出走するか
-- trueを指定すると出走する（RPが残っている場合にチーム競技場を周回する）
-- falseを指定すると出走しない
CONFIG.AUTO_MODE.TEAM_RACE = false


-- 育成周回中にCONFIG.AUTO_RACEで設定しているレースへ出走するか（詳細はレース自動出走の設定のCONFIG.AUTO_RACEの項目を参照）
-- trueを指定すると出走する（RPが残っている場合にCONFIG.AUTO_RACEの設定に従ってレースを周回する）
-- falseを指定すると出走しない
-- CONFIG.AUTO_MODE.TEAM_RACEがtrueの場合は無効になる（CONFIG.AUTO_MODE.TEAM_RACEの設定が優先される）
CONFIG.AUTO_MODE.AUTO_RACE = false


-- 育成周回中にレーシングカーニバルへ出走するか（詳細はレース自動出走の設定のCONFIG.RACING_CARNIVALの項目を参照）
-- trueを指定すると出走する（RPが残っている場合にCONFIG.RACING_CARNIVALの設定に従ってレースを周回する）
-- falseを指定すると出走しない
-- CONFIG.AUTO_MODE.TEAM_RACEがtrueの場合は無効になる（CONFIG.AUTO_MODE.TEAM_RACEの設定が優先される）
-- CONFIG.AUTO_MODE.AUTO_RACEがtrueの場合は無効になる（CONFIG.AUTO_MODE.AUTO_RACEの設定が優先される）
CONFIG.AUTO_MODE.RACING_CARNIVAL = false


-- 育成周回中にサークルをチェックするか（詳細はおまけ機能関連の設定のCONFIG.CIRCLEの項目を参照）
-- trueを指定するとチェックする（CONFIG.CIRCLEの設定に従って寄付やリクエストを行う）
-- falseを指定するとチェックしない
CONFIG.AUTO_MODE.CIRCLE = false


-- 育成周回中にフレンドをチェックするか（詳細はおまけ機能関連の設定のCONFIG.FRIENDの項目を参照）
-- trueを指定するとチェックする（CONFIG.FRIENDの設定に従ってフレンドのフォローを行う）
-- falseを指定するとチェックしない
CONFIG.AUTO_MODE.FRIEND = false


-- TP不足の場合タフネス30を使って回復するか
-- trueを指定すると回復する
-- falseを指定すると回復しない
-- 育成開始時にTPが不足している時にタフネス30を使って回復するかを指定する
-- ジュエルの下に表示されているアイテムがタフネス30の場合使用される
-- タフネス30は1個のみ使用してTPを回復する
-- アイテムとジュエルはタフネス30＞アイテム（タフネス30以外）＞ジュエルの優先順で使用される
CONFIG.AUTO_MODE.USE_TOUGHNESS30 = true


-- TP不足の場合アイテムを使って回復するか
-- trueを指定すると回復する
-- falseを指定すると回復しない
-- 育成開始時にTPが不足している時にアイテムを使って回復するかを指定する
-- ジュエルの下に表示されているアイテム（タフネス30含む）が使用される
-- タフネス30以外のアイテムを使用したくない場合はUSE_TOUGHNESS30をtrueにしてUSE_ITEMをfalseにする
-- アイテムは1個のみ使用してTPを回復する
CONFIG.AUTO_MODE.USE_ITEM = false


-- TP不足の場合ジュエルを使って回復するか
-- trueを指定すると回復する
-- falseを指定すると回復しない
-- TPが不足している状態でアイテムとジュエルを使用しない設定の場合（またはアイテム、ジュエルがない場合）はスクリプトは待機モードになる
-- 待機モードで待機する時間は『待機時間』の項目で設定する（CONFIG.WAIT.HOME）
-- 待機モードで指定した時間が経過するとスクリプトは再開され、再び育成開始の処理を行う
CONFIG.AUTO_MODE.USE_JEWEL = true


-- イベントブーストが利用可能な場合に利用するか
-- trueを指定すると利用する
-- falseを指定すると利用しない
CONFIG.AUTO_MODE.EVENT_BOOST = false


-- シナリオ
-- シナリオ選択画面で選択するシナリオ
-- SCENARIO.URA    URAファイナルズ
-- SCENARIO.AOHARU アオハル杯
-- SCENARIO.CLIMAX クライマックス
-- nilまたは空文字を指定すると前回プレイしたシナリオが選択される
CONFIG.AUTO_MODE.SCENARIO = SCENARIO.URA


-- 育成モード
-- 育成モード選択画面で選択するモード
-- TRAINING_MODE.NORMAL 通常モード
-- TRAINING_MODE.EXTRA  トレーナー技能試験等の追加モード
-- nilまたは空文字を指定すると前回プレイしたモードが選択される
CONFIG.AUTO_MODE.TRAINING_MODE = nil


-- 難易度
-- 育成難易度選択画面で選択する難易度
-- DIFFICULTY.NORMAL 通常モード
-- DIFFICULTY.EXTRA  ゴルシちゃんモードやショータイムモード等の追加モード
-- nilまたは空文字を指定すると前回プレイした難易度が選択される
CONFIG.AUTO_MODE.DIFFICULTY = nil


-- 難易度レベル
-- 追加モードで選択する難易度レベル
-- nilまたは空文字を指定すると前回プレイした難易度レベルが選択される
CONFIG.AUTO_MODE.DIFFICULTY_LEVEL = nil


-- 育成ウマ娘の名前
-- 二つ名込みで指定する
-- 例：CONFIG.AUTO_MODE.TRAINING_CHARACTER = "サクラバクシンオー [サクラ、すすめ！]"
-- 指定した名前の育成ウマ娘が存在しないか空の場合は以下のTRAINING_X, TRAINING_Y, TRAINING_SCROLLの設定が利用される
CONFIG.AUTO_MODE.TRAINING_CHARACTER = ""


-- 育成ウマ娘の列（X軸）
-- CONFIG.AUTO_MODE.TRAINING_CHARACTERが指定されている場合は設定する必要はない
-- 育成ウマ娘選択画面で選択するウマ娘
-- 一番左が1で1～5を指定する
CONFIG.AUTO_MODE.TRAINING_X = 1


-- 育成ウマ娘の行（Y軸）
-- CONFIG.AUTO_MODE.TRAINING_CHARACTERが指定されている場合は設定する必要はない
-- 育成ウマ娘選択画面で選択するウマ娘
-- 一番上が1で1～2を指定する
CONFIG.AUTO_MODE.TRAINING_Y = 1


-- 育成ウマ娘のスクロール量
-- CONFIG.AUTO_MODE.TRAINING_CHARACTERが指定されている場合は設定する必要はない
-- 育成ウマ娘選択画面で画面内に収まらない下の方のキャラを選択したい場合に指定する
-- 育成ウマ娘選択画面では前回の育成キャラがデフォルトで選択されているので、下の方のキャラが選択されている場合は先に一番上まで自動的にスクロールする
-- スクロール位置が初期位置（一番上）になっていることを前提とした値を指定する
-- ホイールを下へ回転させる回数を指定する
-- 3回回転でだいたい1行分スクロールするが、若干ずれるので下の方のキャラを選択したい場合はTRAINING_Yの値もスクロール量とあわせて調節する
CONFIG.AUTO_MODE.TRAINING_SCROLL = 0


-- 継承ウマ娘をおまかせ選択するか
-- trueを指定するとおまかせ選択する
-- falseを指定するとおまかせ選択しない
-- おまかせ選択をしない場合は継承ウマ娘の設定が必須になる
CONFIG.AUTO_MODE.INHERITANCE_AUTO = false


-- 継承ウマ娘のおまかせ選択でレンタルを含めるか
-- trueを指定するとレンタルを含める
-- falseを指定するとレンタルを含めない
-- おまかせ選択する場合のみ有効な設定になる
CONFIG.AUTO_MODE.INHERITANCE_AUTO_RENTAL = false


-- 継承ウマ娘1人目の名前
-- 二つ名込みで指定する
-- 例：CONFIG.AUTO_MODE.INHERITANCE1_CHARACTER = "サクラバクシンオー [サクラ、すすめ！]"
-- 継承ウマ娘1人目を名前で指定する場合はCONFIG.AUTO_MODE.INHERITANCE1_EVALUATIONの設定が必須
CONFIG.AUTO_MODE.INHERITANCE1_CHARACTER = ""


-- 継承ウマ娘1人目の評価点
-- 名前と評価点が一致したウマ娘が継承ウマ娘1人目に選ばれる
-- 指定した名前と評価点が一致しない場合は以下のINHERITANCE1_X, INHERITANCE1_Y, INHERITANCE1_SCROLLの設定が利用される
CONFIG.AUTO_MODE.INHERITANCE1_EVALUATION = 0


-- 継承ウマ娘1人目の列（X軸）
-- CONFIG.AUTO_MODE.INHERITANCE1_CHARACTER及びCONFIG.AUTO_MODE.INHERITANCE1_EVALUATIONが指定されている場合は設定する必要はない
-- 継承ウマ娘選択画面で選択するウマ娘
-- 一番左が1で1～5を指定する
-- 継承ウマ娘は固定したい場合あらかじめ絞り込み機能やソート機能を利用して表示されるウマ娘を固定しておく必要がある
-- 継承ウマ娘に育成ウマ娘を選択したりすると正常に動作しなくなるので固定することを推奨します
-- 継承ウマ娘に選択したいウマ娘をお気に入りに登録してお気に入りで絞り込むと固定できます
CONFIG.AUTO_MODE.INHERITANCE1_X = 2


-- 継承ウマ娘1人目の行（Y軸）
-- CONFIG.AUTO_MODE.INHERITANCE1_CHARACTER及びCONFIG.AUTO_MODE.INHERITANCE1_EVALUATIONが指定されている場合は設定する必要はない
-- 継承ウマ娘選択画面で選択するウマ娘
-- 一番上が1で1～2を指定する
CONFIG.AUTO_MODE.INHERITANCE1_Y = 1


-- 継承ウマ娘1人目のスクロール量
-- CONFIG.AUTO_MODE.INHERITANCE1_CHARACTER及びCONFIG.AUTO_MODE.INHERITANCE1_EVALUATIONが指定されている場合は設定する必要はない
-- スクロール位置が初期位置（一番上）になっていることを前提とした値を指定する
-- ホイールを下へ回転させる回数を指定する
-- 育成ウマ娘と同じ様にINHERITANCE1_Yの値もスクロール量とあわせて調節する
CONFIG.AUTO_MODE.INHERITANCE1_SCROLL = 0


-- 継承ウマ娘2人目の名前
-- 継承ウマ娘1人目と同様に設定
CONFIG.AUTO_MODE.INHERITANCE2_CHARACTER = ""


-- 継承ウマ娘2人目の評価点
-- 継承ウマ娘1人目と同様に設定
CONFIG.AUTO_MODE.INHERITANCE2_EVALUATION = 0


-- 継承ウマ娘2人目の列（X軸）
-- 継承ウマ娘1人目と同様に設定
CONFIG.AUTO_MODE.INHERITANCE2_X = 2


-- 継承ウマ娘2人目の行（Y軸）
-- 継承ウマ娘1人目と同様に設定
CONFIG.AUTO_MODE.INHERITANCE2_Y = 1


-- 継承ウマ娘2人目のスクロール量
-- 継承ウマ娘1人目と同様に設定
CONFIG.AUTO_MODE.INHERITANCE2_SCROLL = 0


-- 継承ウマ娘をレンタルするか
-- 0 レンタルしない
-- 1 1人目をレンタルする
-- 2 2人目をレンタルする
-- レンタルは残りレンタル回数が残っている場合のみ利用される
-- レンタルするウマ娘を選択し残りレンタル回数が0だった場合は一旦ホームへ戻って再度育成を開始する
CONFIG.AUTO_MODE.INHERITANCE_RENTAL = 0


-- イベントの継承ウマ娘をレンタルするか
-- trueを指定するとレンタルする
-- falseを指定するとレンタルしない
-- トレーナー技能試験開催時にリーディングウマ娘をレンタルしたい場合にtrueを指定する
CONFIG.AUTO_MODE.INHERITANCE_RENTAL_EVENT = false


-- レンタルする継承ウマ娘の名前
-- 継承ウマ娘1人目と同様に設定
CONFIG.AUTO_MODE.INHERITANCE_RENTAL_CHARACTER = ""


-- レンタルする継承ウマ娘の評価点
-- 継承ウマ娘1人目と同様に設定
CONFIG.AUTO_MODE.INHERITANCE_RENTAL_EVALUATION = 0


-- レンタルする継承ウマ娘の列（X軸）
-- 継承ウマ娘1人目と同様に設定
CONFIG.AUTO_MODE.INHERITANCE_RENTAL_X = 2


-- レンタルする継承ウマ娘の行（Y軸）
-- 継承ウマ娘1人目と同様に設定
CONFIG.AUTO_MODE.INHERITANCE_RENTAL_Y = 1


-- レンタルする継承ウマ娘のスクロール量
-- 継承ウマ娘1人目と同様に設定
CONFIG.AUTO_MODE.INHERITANCE_RENTAL_SCROLL = 0


-- サポート編成のデッキ番号
-- 1～10を指定する
-- nilまたは空文字を指定すると前回プレイしたデッキが選択される
CONFIG.AUTO_MODE.SUPPORT_DECK = 1


-- サポート編成をおまかせ編成するか
-- trueを指定するとおまかせ編成する
-- falseを指定するとおまかせ編成しない
-- おまかせ編成をしない場合はSUPPORT_FRIENDの設定が必須
CONFIG.AUTO_MODE.SUPPORT_AUTO = false


-- サポートおまかせ編成でイベントボーナスサポートカードを優先するか
-- trueを指定すると優先する
-- falseを指定すると優先しない
-- おまかせ編成する場合のみ有効な設定になる
CONFIG.AUTO_MODE.SUPPORT_AUTO_EVENT_BONUS = false


-- サポート編成のフレンドのサポートカード名
-- フレンドサポート選択画面で選択するサポートカードを二つ名込みで指定する
-- 例：CONFIG.AUTO_MODE.SUPPORT_FRIEND[1] = "キタサンブラック [迫る熱に押されて]"
-- 添字を1から連番にすればいくつでも指定可
-- 複数指定した場合は最初に検出されたサポートカードが選択される
-- 上から順番に画像認識を行うので絞り込み機能やソート機能とフォローを利用して上部へ配置されるようにすることを推奨
-- 指定キャラがサポートキャラのデータベースに存在しない場合はおまかせ編成が利用される
CONFIG.AUTO_MODE.SUPPORT_FRIEND[1] = ""


-- サポート編成のフレンドの最低上限解放回数
-- 0（無凸）～4（完凸）を指定する
-- 指定した上限解放回数以上のサポートカードのみ選択される
CONFIG.AUTO_MODE.SUPPORT_FRIEND_LIMIT = 0


----------------------------------------------------------------------------------------------------
-- レース自動出走の設定
-- レース画面（ホームでレースボタンを押した先のチーム競技場やデイリープログラムを選択する画面）で実行開始した時に自動的に出走するレース
-- trueに設定しているレースを順番に周回するのでデイリーの消化に利用する
-- 各レースの画面（レース選択後のチーム競技場の画面等）で実行開始した場合は周回後にスクリプトは終了するので単体で周回したい場合は各レースの画面で実行を開始する
-- 各レースの出走ウマ娘は先に設定しておく必要がある
----------------------------------------------------------------------------------------------------

-- チームレースに自動的に出走するか
-- trueの場合はチームレースを周回してレース画面へ戻る
-- falseの場合は出走しない
CONFIG.AUTO_RACE.TEAM_RACE = true


-- デイリーレースに自動的に出走するか
-- trueの場合はデイリーレースを周回してレース画面へ戻る
-- falseの場合は出走しない
CONFIG.AUTO_RACE.DAILY_RACE = true


-- デイリーレジェンドレースに自動的に出走するか
-- trueの場合はデイリーレジェンドレースを周回してレース画面へ戻る
-- falseの場合は出走しない
CONFIG.AUTO_RACE.DAILY_LEGEND_RACE = true


-- レジェンドレースに自動的に出走するか
-- trueの場合はレジェンドレースを周回してレース画面へ戻る
-- falseの場合は出走しない
CONFIG.AUTO_RACE.LEGEND_RACE = true


-- チャンピオンズミーティングに自動的に出走するか
-- trueの場合はチャンピオンズミーティングを周回してレース画面へ戻る
-- falseの場合は出走しない
CONFIG.AUTO_RACE.CHAMPIONS_MEETING = true


-- 全てのレースを周回後にホームへ戻るか
-- 全自動育成モードが有効の場合はホームへ戻った後に育成が開始される
-- trueの場合はホームへ戻る
-- falseの場合はホームへ戻らずにスクリプトを終了する
CONFIG.AUTO_RACE.RETURN_HOME = true


-- チームレースで選択する対戦相手
-- 上から順に1～3を指定する
CONFIG.TEAM_RACE.SELECT = 1


-- チームレースでWIN報酬確定が発生したときにその相手を選択するか
-- trueの場合は選択する
-- falseの場合は無視してCONFIG.TEAM_RACE.SELECTで指定した相手を選択する
CONFIG.TEAM_RACE.SELECT_BONUS = true


-- チームレースでやる気UPスイーツを使用するか
-- 0の場合は使用しない
-- 1の場合はWIN報酬確定が発生かつCONFIG.TEAM_RACE.SELECT_BONUSがtrueの場合のみ使用する
-- 2の場合は使用する
CONFIG.TEAM_RACE.MOTIVATION_UP_SWEETS = 1


-- デイリーレースで選択するレース
-- 1 ムーンライト賞（マニー）
-- 2 ジュピターカップ（サポートPt）
CONFIG.DAILY_RACE.SELECT_RACE = 1


-- デイリーレースで選択する難易度
-- まだ全難易度が解放されていない場合は誤動作するので注意
-- 1 上（VERY HARD）
-- 2 中（HARD）
-- 3 下（NORMAL）
CONFIG.DAILY_RACE.SELECT_DIFFICULTY = 1


-- デイリーレースのスキップ機能を利用するか
-- trueの場合は利用する
-- falseの場合は利用しない
CONFIG.DAILY_RACE.SKIP = true


-- デイリーレースでやる気UPスイーツを使用するか
-- スキップ機能を利用する設定にしている場合は無視される
-- falseの場合は使用しない
-- やる気を指定すると指定したやる気以下の場合使用する
-- やる気は以下の中から指定する
-- MOTIVATION.VERY_GOOD 絶好調
-- MOTIVATION.GOOD      好調
-- MOTIVATION.NORMAL    普通
-- MOTIVATION.BAD       不調
-- MOTIVATION.VERY_BAD  絶不調
CONFIG.DAILY_RACE.MOTIVATION_UP_SWEETS = false


-- デイリーレジェンドレースで選択するレースの列（X軸）
-- 一番左が1で1～3を指定する
-- 1～3以外を指定した場合は出走しない
CONFIG.DAILY_LEGEND_RACE.SELECT_RACE_X = 0


-- デイリーレジェンドレースで選択するレースの行（Y軸）
-- 一番上が1で1～3を指定する
-- 1～3以外を指定した場合は出走しない
CONFIG.DAILY_LEGEND_RACE.SELECT_RACE_Y = 0


-- デイリーレジェンドレースで選択するレースのスクロール量
-- スクロール位置が初期位置（一番上）になっていることを前提とした値を指定する
-- ホイールを下へ回転させる回数を指定する
-- 3回回転でだいたい1行分スクロールするが、若干ずれるので下の方のレースを選択したい場合はSELECT_RACE_Yの値もスクロール量とあわせて調節する
CONFIG.DAILY_LEGEND_RACE.SELECT_RACE_SCROLL = 0


-- レジェンドレースでやる気UPスイーツを使用するか
-- 指定する値の説明はデイリーレースの項目を参照
CONFIG.LEGEND_RACE.MOTIVATION_UP_SWEETS = MOTIVATION.BAD


-- チャンピオンズミーティングの限定ミッション報酬を受け取るか
-- trueの場合は受け取る
-- falseの場合は受け取らない
CONFIG.CHAMPIONS_MEETING.MISSION = true


-- チャンピオンズミーティングにジュエルを使用して出走するか
-- trueの場合は出走する
-- falseの場合は出走しない
CONFIG.CHAMPIONS_MEETING.USE_JEWEL = false


-- レーシングカーニバルで出走するカーニバルレース
-- 1 左上
-- 2 右上
-- 3 左下
-- 4 右下
CONFIG.RACING_CARNIVAL.SELECT_CARNIVAL_RACE = 1


-- レーシングカーニバルで出走するレースを順番に選択するか
-- trueの場合は順番に選択する（CONFIG.RACING_CARNIVAL.SELECT_RACEのレースから順番に選択される）
-- falseの場合は順番に選択しない（CONFIG.RACING_CARNIVAL.SELECT_RACEのレース固定）
CONFIG.RACING_CARNIVAL.SELECT_CARNIVAL_RACE_ORDER = true


-- レーシングカーニバルでチャレンジジレースに出走するか
-- trueの場合は出走する（カーニバルレースより優先される）
-- falseの場合は出走しない
CONFIG.RACING_CARNIVAL.CHALLENGE_RACE = true


-- レーシングカーニバルでチャレンジレースにリトライするか
-- trueの場合はリトライする
-- falseの場合はリトライしない
CONFIG.RACING_CARNIVAL.CHALLENGE_RACE_RETRY = true


-- レーシングカーニバルでRP0かつチャレンジレースにリトライ可能な場合にアイテムを使用して回復するか
-- trueの場合は回復する
-- falseの場合は回復しない
CONFIG.RACING_CARNIVAL.CHALLENGE_RACE_RETRY_USE_ITEM = true


-- カーニバルレース（HARD）でやる気UPスイーツを使用するか
-- 指定する値の説明はデイリーレースの項目を参照
CONFIG.RACING_CARNIVAL.MOTIVATION_UP_SWEETS_HARD = false


-- チャレンジレース（VERY HARD）でやる気UPスイーツを使用するか
-- 指定する値の説明はデイリーレースの項目を参照
CONFIG.RACING_CARNIVAL.MOTIVATION_UP_SWEETS_VERY_HARD = MOTIVATION.BAD


-- チャレンジレース（EXTREME）でやる気UPスイーツを使用するか
-- 指定する値の説明はデイリーレースの項目を参照
CONFIG.RACING_CARNIVAL.MOTIVATION_UP_SWEETS_EXTREME = MOTIVATION.BAD


----------------------------------------------------------------------------------------------------
-- 画面保存の設定
-- 育成完了後に表示されるリザルト画面のスクリーンショットを保存するか設定します
-- スクリーンショットは『殿堂入りウマ娘』フォルダに保存されます
-- ファイル名は『育成完了時間：育成キャラの名前：各画面の名前』になります
----------------------------------------------------------------------------------------------------

-- 育成ランク画面を保存するか
-- trueを指定すると保存する
-- falseを指定すると保存しない
CONFIG.SCREENSHOT.RANK = true


-- 因子獲得画面を保存するか
-- trueを指定すると保存する
-- falseを指定すると保存しない
CONFIG.SCREENSHOT.FACTOR = true


-- ウマ娘詳細画面を保存するか
-- trueを指定すると保存する
-- falseを指定すると保存しない
CONFIG.SCREENSHOT.DETAIL = true


-- 歴代評価点画面を保存するか
-- trueを指定すると保存する
-- falseを指定すると保存しない
CONFIG.SCREENSHOT.TOP3 = true


-- 通算成績画面を保存するか
-- trueを指定すると保存する
-- falseを指定すると保存しない
CONFIG.SCREENSHOT.RECORD = true


-- 獲得ファン数画面を保存するか
-- trueを指定すると保存する
-- falseを指定すると保存しない
CONFIG.SCREENSHOT.FAN = true


-- 獲得アイテム画面を保存するか
-- trueを指定すると保存する
-- falseを指定すると保存しない
CONFIG.SCREENSHOT.ITEM = true


----------------------------------------------------------------------------------------------------
-- 待機時間の設定
-- 自動操作が速すぎたり一定間隔だったりするとbotだと感知される可能性があるのでランダムな時間スクリプトを待機させる事ができます
-- スクリプトが待機状態になるとウマ娘に張り付いている青い枠が紫色になります
-- 待機時間は枠の下側に表示され、0になるとスクリプトが再開されます
----------------------------------------------------------------------------------------------------

-- ターン毎に待機する時間の設定
-- rareは待機する確率を百分率で指定する
-- 10を指定すると10%の確率で待機する
-- 確実に毎ターン待機させたい場合は100を指定する
-- 待機処理を一切行いたくない場合は0を指定する
-- min, maxは待機する時間を秒単位で指定する
-- min～maxの間のランダムの値秒間待機される（min = 0 max = 10の場合は0～10秒間待機）
CONFIG.WAIT.TURN[1] = { rate = 10, min = 0, max = 10 }

-- 以下のように記述するとCONFIG.WAIT.TURN[1]の設定で待機しなかった場合（90%の確率）にもう一度抽選して待機処理を行う
-- CONFIG.WAIT.TURN[1]の設定で待機した場合は再抽選は行われない（複数回待機処理が行われることはない）
-- 添字を1から連番にすればいくつでも指定可

-- CONFIG.WAIT.TURN[2] = { rate = 10, min = 15, max = 30 }


-- 各トレーニング選択時に待機する時間の設定
CONFIG.WAIT.TRAINING[1] = { rate = 20, min = 0, max = 1 }


-- 選択肢が表示された時に待機する時間の設定
CONFIG.WAIT.EVENT[1] = { rate = 100, min = 0, max = 2 }


-- スキル一覧やレース一覧でスクロールする時に待機する時間の設定
CONFIG.WAIT.SCROLL[1] = { rate = 20, min = 0, max = 1 }


-- 育成終了時に待機する時間の設定
CONFIG.WAIT.COMPLETE_TRAINING[1] = { rate = 50, min = 10, max = 3 * 60 }


-- ホーム画面で待機する時間の設定
CONFIG.WAIT.HOME[1] = { rate = 100, min = 15 * 60, max = 30 * 60 }


-- メンテナンス時に待機する時間の設定
CONFIG.WAIT.MAINTENANCE[1] = { rate = 100, min = 15 * 60, max = 30 * 60 }


----------------------------------------------------------------------------------------------------
-- おまけ機能関連の設定
----------------------------------------------------------------------------------------------------

-- クレーンゲームのボタンを押す時間
-- 待機時間の設定と同様の仕様でクレジット毎にミリ秒単位で指定する
-- 5%の確率で狙わない（bot検知対策）
CONFIG.CRANE_GAME_CREDIT3[1] = { rate =   5, min = 2200, max = 5800 }
CONFIG.CRANE_GAME_CREDIT2[1] = { rate =   5, min = 1000, max = 2850 }
CONFIG.CRANE_GAME_CREDIT1[1] = { rate =   5, min =  580, max = 1720 }

-- 再抽選して70%の確率で3つ目を狙う
CONFIG.CRANE_GAME_CREDIT3[2] = { rate =  70, min = 5800 - 20, max = 5800 + 20 }
CONFIG.CRANE_GAME_CREDIT2[2] = { rate =  70, min = 2850 - 10, max = 2850 + 10 }
CONFIG.CRANE_GAME_CREDIT1[2] = { rate =  70, min = 1720 -  5, max = 1720 +  5 }

-- 再抽選して70%の確率で2つ目を狙う
CONFIG.CRANE_GAME_CREDIT3[3] = { rate =  70, min = 3800 - 20, max = 3800 + 20 }
CONFIG.CRANE_GAME_CREDIT2[3] = { rate =  70, min = 1900 - 10, max = 1900 + 10 }
CONFIG.CRANE_GAME_CREDIT1[3] = { rate =  70, min = 1150 -  5, max = 1150 +  5 }

-- 1つ目を狙う
CONFIG.CRANE_GAME_CREDIT3[4] = { rate = 100, min = 2200 - 20, max = 2200 + 20 }
CONFIG.CRANE_GAME_CREDIT2[4] = { rate = 100, min = 1000 - 10, max = 1000 + 10 }
CONFIG.CRANE_GAME_CREDIT1[4] = { rate = 100, min =  580 -  5, max =  580 +  5 }


-- 限定セールショップを自動で購入処理するか
-- trueの場合は自動で購入処理する
-- falseの場合は自動で購入処理せず、ショップ画面になったらスクリプトを終了する
CONFIG.SHOP.AUTO = true


-- 限定セールショップで購入するアイテム
-- trueの場合は購入する
-- falseの場合は購入しない
-- CONFIG.SHOP.AUTOがfalseの場合は購入処理はしないので特に設定する必要はない
CONFIG.SHOP.ITEM[SHOP.PIECE1]		= true		-- ピース1個目
CONFIG.SHOP.ITEM[SHOP.PIECE2]		= true		-- ピース2個目
CONFIG.SHOP.ITEM[SHOP.CLOCK]		= true		-- 目覚まし時計
CONFIG.SHOP.ITEM[SHOP.SWEETS]		= true		-- やる気UPスイーツ
CONFIG.SHOP.ITEM[SHOP.SHOES]		= false		-- シューズ
CONFIG.SHOP.ITEM[SHOP.SUPPORT_PT]	= false		-- サポートPt
CONFIG.SHOP.ITEM[SHOP.LEI]			= false		-- 優勝レイ


-- 限定セールショップで購入するピース
-- CONFIG.SHOP.ITEM[SHOP.PIECE1]とCONFIG.SHOP.ITEM[SHOP.PIECE2]がfalseの場合は設定する必要はない
-- 指定がない場合は全てのピースを購入する（CONFIG.SHOP.EXCLUDE_PIECEで設定されているピースは除外される）
-- 一つでも指定がある場合は指定されたピースのみ購入する
-- 設定する場合キャラクター名を二つ名込みで指定する
-- 例：CONFIG.SHOP.PIECE[1] = "アグネスタキオン [tach-nology]"
-- 添字を1から連番にすればいくつでも指定可
-- 空文字を指定すると無視される
CONFIG.SHOP.PIECE[1] = ""
CONFIG.SHOP.PIECE[2] = ""
CONFIG.SHOP.PIECE[3] = ""
CONFIG.SHOP.PIECE[4] = ""
CONFIG.SHOP.PIECE[5] = ""


-- 限定セールショップで購入しないピース
-- CONFIG.SHOP.PIECEの設定より優先される（両方に設定されている場合は購入しない）
-- "不明"を指定すると認識されなかったピースは購入しない
-- 例：CONFIG.SHOP.EXCLUDE_PIECE[1] = "不明"
-- 添字を1から連番にすればいくつでも指定可
-- 空文字を指定すると無視される
CONFIG.SHOP.EXCLUDE_PIECE[1] = ""
CONFIG.SHOP.EXCLUDE_PIECE[2] = ""
CONFIG.SHOP.EXCLUDE_PIECE[3] = ""
CONFIG.SHOP.EXCLUDE_PIECE[4] = ""
CONFIG.SHOP.EXCLUDE_PIECE[5] = ""


-- 限定セールショップで購入するシューズ
-- CONFIG.SHOP.ITEM[SHOP.SHOES]がfalseの場合は設定する必要はない
-- trueの場合は購入する
-- falseの場合は購入しない
CONFIG.SHOP.SHOES[SHOES.SHORT]	= true		-- 短距離シューズ
CONFIG.SHOP.SHOES[SHOES.MILE]	= true		-- マイルシューズ
CONFIG.SHOP.SHOES[SHOES.MIDDLE]	= true		-- 中距離シューズ
CONFIG.SHOP.SHOES[SHOES.LONG]	= true		-- 長距離シューズ
CONFIG.SHOP.SHOES[SHOES.DIRT]	= true		-- ダートシューズ


-- 限定セールショップで購入する優勝レイ
-- CONFIG.SHOP.ITEM[SHOP.LEI]がfalseの場合は設定する必要はない
-- 指定がない場合は全ての優勝レイを購入する（CONFIG.SHOP.EXCLUDE_LEIで設定されている優勝レイは除外される）
-- 一つでも指定がある場合は指定された優勝レイのみ購入する
-- 設定する場合レース名を指定する
-- 例：CONFIG.SHOP.LEI[1] = "オークス"
-- 添字を1から連番にすればいくつでも指定可
-- 空文字を指定すると無視される
CONFIG.SHOP.LEI[1] = ""
CONFIG.SHOP.LEI[2] = ""
CONFIG.SHOP.LEI[3] = ""
CONFIG.SHOP.LEI[4] = ""
CONFIG.SHOP.LEI[5] = ""


-- 限定セールショップで購入しない優勝レイ
-- CONFIG.SHOP.LEIの設定より優先される（両方に設定されている場合は購入しない）
-- "不明"を指定すると認識されなかった優勝レイは購入しない
-- 例：CONFIG.SHOP.EXCLUDE_LEI[1] = "不明"
-- 添字を1から連番にすればいくつでも指定可
-- 空文字を指定すると無視される
CONFIG.SHOP.EXCLUDE_LEI[1] = ""
CONFIG.SHOP.EXCLUDE_LEI[2] = ""
CONFIG.SHOP.EXCLUDE_LEI[3] = ""
CONFIG.SHOP.EXCLUDE_LEI[4] = ""
CONFIG.SHOP.EXCLUDE_LEI[5] = ""


-- サークルで一括寄付するか
-- trueの場合は一括寄付をする
-- falseの場合は一括寄付をしない
-- 寄付をするアイテムを限定したい場合は一括寄付をせずにCONFIG.CIRCLE.GIVEで設定する
CONFIG.CIRCLE.GIVE_ALL = false


-- サークルで寄付をするアイテム
-- trueの場合は寄付をする
-- falseの場合は寄付をしない
-- 一括寄付する設定にしている場合は無視される
-- 寄付をする設定にしたアイテムは可能な限り（2個）寄付する
CONFIG.CIRCLE.GIVE[SHOES.SHORT]		= false	-- 短距離シューズ
CONFIG.CIRCLE.GIVE[SHOES.MILE]		= false	-- マイルシューズ
CONFIG.CIRCLE.GIVE[SHOES.MIDDLE]	= false	-- 中距離シューズ
CONFIG.CIRCLE.GIVE[SHOES.LONG]		= false	-- 長距離シューズ
CONFIG.CIRCLE.GIVE[SHOES.DIRT]		= false	-- ダートシューズ


-- サークルでリクエストをするアイテム
-- 以下から指定する
-- SHOES.SHORT  短距離シューズ
-- SHOES.MILE   マイルシューズ
-- SHOES.MIDDLE 中距離シューズ
-- SHOES.LONG   長距離シューズ
-- SHOES.DIRT   ダートシューズ
-- SHOES.RANDOM ランダムなシューズ
-- false        リクエストしない
CONFIG.CIRCLE.REQUEST = false


-- フレンド画面でフォローするトレーナーID
-- フォロワー上限に達しているトレーナーの空きがないかをチェックしてフォローしたい場合に利用する
-- 例：CONFIG.FRIEND.FOLLOW[1] = "123456789"
-- 添字を1から連番にすればいくつでも指定可
-- 空文字を指定すると無視される
CONFIG.FRIEND.FOLLOW[1] = ""
CONFIG.FRIEND.FOLLOW[2] = ""
CONFIG.FRIEND.FOLLOW[3] = ""
CONFIG.FRIEND.FOLLOW[4] = ""
CONFIG.FRIEND.FOLLOW[5] = ""


----------------------------------------------------------------------------------------------------
-- 関数設定
-- 以降の設定はAIに関わる設定でスクリプトの知識がある程度必要になります
-- 設定を行う前に
-- ・ステータス情報の参照方法
-- ・定数
-- ・データベースの参照方法
-- の3点についてある程度は理解しておいた方が良いので以下でざっくりとですが解説しています
----------------------------------------------------------------------------------------------------
-- ステータス情報の参照
-- 現在のステータスは g_status[ステータス名] で参照できます
-- ステータス名には以下のものがあり、ステータスタブに表示されている値全てを参照することができます
-- STATUS.STATE                   認識しているウマ娘の現在の状態で通常参照する必要はありません
-- STATUS.NAME                    育成中のキャラクター名
-- STATUS.SCENARIO                シナリオ
-- STATUS.SEASON                  現在の時期（テーブル）
--                                  時期はテーブルとして保存されており g_status[STATUS.SEASON].index といった記述でテーブル内を参照します
--                                  .name  時期の名前（ジュニア級デビュー前等）
--                                  .index ツール上で設定しているインデックス（時期同士を比較したい場合に使用）
-- STATUS.SEASON_INDEX            時期が『ジュニア級デビュー前』『ファイナルズ開催中』の場合に比較用にそれぞれ1～12,1～6が入っている
-- STATUS.TURN                    目標までの残りターン（0の場合は本番）
-- STATUS.CLASS                   クラス（テーブル）
--                                  .name  クラスの名前（ビギナー、ブロンズ等）
--                                  .index インデックスは1～10までをデビュー～レジェンドに割り当てており、クラスがトップスター以上など比較したい場合に用いる（トップスター以上の『トップスター』は定数として定義されていますが後述します）
-- STATUS.FAN                     ファン数
-- STATUS.EVALUATION              評価点
-- STATUS.MOTIVATION              やる気（テーブル）
--                                  .name  やる気の名前（普通、絶好調等）
--                                  .index インデックスは1～5までを絶不調～絶好調に割り当てており、やる気が普通以上など比較したい場合に用いる（普通以上の『普通』は定数として定義されていますが後述します）
-- STATUS.MAXHP                   最大体力
-- STATUS.HP                      体力
-- STATUS.SPEED                   スピード
-- STATUS.STAMINA                 スタミナ
-- STATUS.POWER                   パワー
-- STATUS.GUTS                    根性
-- STATUS.INT                     賢さ
-- STATUS.SKILLPT                 スキルポイント
-- STATUS.COMPLETE                育成完了画面かどうか（true：育成完了画面 false：育成完了画面ではない）
-- STATUS.INFIRMARY               保健室が利用可能か（true：利用可 false：利用不可）
-- STATUS.FRIEND                  友人とお出かけ可能か（true：お出かけ可能 false：お出かけ可能ではない）
-- STATUS.SHOP                    ショップが利用可能か（true：利用可 false：利用不可）
-- STATUS.SHOP_SALE               ショップがセール中か（true：セール中 false：セール中ではない）
-- STATUS.SHOP_TURN               ショップの追加アイテムの残りターン数
-- STATUS.SHOP_COIN               ショップコイン
-- STATUS.RIVAL                   ライバルが出走するか（true：出走する false：出走しない）
-- STATUS.POPUP_RACE              ファン数不足等の理由でレース出走のポップアップが表示されたか（true：表示された false：表示されていない）
-- STATUS.TRAINING                実行したトレーニング（追加トレーニングを選択時に上昇するステータスで参照する）
-- STATUS.MY_ROTATION             読み込んだマイローテ番号
-- STATUS.RESERVED_RACE           予約レース開催中のポップアップが表示されたレース（テーブル）詳しくはデータベースの参照のレースの項目を参照して下さい
-- STATUS.RACE                    出走する（した）レース（テーブル）詳しくはデータベースの参照のレースの項目を参照して下さい
-- STATUS.RACE_RANKING            出走したレースの順位
-- STATUS.RACE_COUNT              トータルの出走数
-- STATUS.RACE_WIN_COUNT          トータルの勝利数
-- STATUS.RACE_CONSECUTIVE_COUNT  連続出走数
-- STATUS.TEAM_RANK               チームランク（テーブル）詳しくは定数を参照して下さい
-- STATUS.TEAM_BATTLE_RANKING     チーム対抗戦の順位
-- STATUS.TEAM_BATTLE_COUNT       チーム対抗戦の対戦数
-- STATUS.TEAM_BATTLE_WIN_COUNT   チーム対抗戦の勝利数
-- STATUS.CONTINUE_COUNT          コンティニュー回数
-- STATUS.TRAINING_LEVEL          トレーニングレベル（テーブル）
--                                  g_status[STATUS.TRAINING_LEVEL][STATUS.SPEED]という記述で各ステータスのトレーニングレベルを参照できます
-- STATUS.SUPPORT_CHARA           編成したサポートキャラ（理事長等含む）（テーブル）
--                                  name         名前
--                                  type         タイプ（スピード、友人等）
--                                  rare         レア度（SSR,SR等）
--                                  kizunaLevel  絆レベル
--                                  g_status[STATUS.SUPPORT_CHARA][1], g_status[STATUS.SUPPORT_CHARA][2]という記述で各サポートキャラを参照できます
-- STATUS.GO_OUT_CHARA            お出かけ可能な友人（テーブル）
--                                  name             名前
--                                  type             タイプ（友人またはグループ）
--                                  eventProgress    イベント進行度
--                                  eventProgressMax イベント進行度の最大値（お出かけイベント数）
--                                  g_status[STATUS.GO_OUT_CHARA][1], g_status[STATUS.GO_OUT_CHARA][2]という記述で各お出かけキャラを参照できます
-- STATUS.ITEM                    所持しているアイテム
--                                  itemInfo 詳しくはデータベースのアイテムの項目を参照して下さい
--                                  count    所持数
--                                  g_status[STATUS.ITEM][1], g_status[STATUS.ITEM][2]という記述で各アイテムを参照できます
-- STATUS.ACTIVE_ITEM             発動しているアイテム
--                                  itemInfo 詳しくはデータベースのアイテムの項目を参照して下さい
--                                  turn     発動ターン
--                                  g_status[STATUS.ACTIVE_ITEM][1], g_status[STATUS.ACTIVE_ITEM][2]という記述で各発動アイテムを参照できます
-- STATUS.UNIQUE_SKILL            固有スキル（テーブル）詳しくはデータベースのスキルの項目を参照して下さい
-- STATUS.UNIQUE_SKILL_LEVEL      固有スキルのレベル
-- STATUS.ACQUIRE_SKILL           習得したスキル（テーブル）詳しくはデータベースのスキルの項目を参照して下さい
--                                  g_status[STATUS.ACQUIRE_SKILL][1], g_status[STATUS.ACQUIRE_SKILL][2]という記述で各スキルを参照できます
-- STATUS.FACTOR                  因子（テーブル）
--                                  factorInfo  詳しくはデータベースの因子の項目を参照して下さい
--                                  star        ★の数（1～3）が入っている
-- STATUS.CONDITION               コンディション（テーブル）詳しくはデータベースのコンディションの項目を参照して下さい
--                                  g_status[STATUS.CONDITION][1], g_status[STATUS.CONDITION][2]という記述で各コンディションを参照できます
-- STATUS.TRACK                   バ場適性（テーブル）詳しくは定数を参照して下さい
-- STATUS.DISTANCE                距離適性（テーブル）詳しくは定数を参照して下さい
-- STATUS.STYLE                   脚質適性（テーブル）詳しくは定数を参照して下さい
-- STATUS.GROWTH                  成長率（テーブル）
--                                  g_status[STATUS.GROWTH][STATUS.SPEED]という記述で各ステータスの成長率を参照できます（+10%の場合10が入っています）
----------------------------------------------------------------------------------------------------
-- 定数
-- 正確にはLuaの仕様上定数は定義できないので変数になるのですが、ここでは定数として解説します
-- ステータス情報の参照で解説したクラスややる気の所で触れましたが、やる気の『絶好調』などは定数として定義されており決められた名前がつけられています
-- 例えばやる気は
-- MOTIVATION.VERY_GOOD 絶好調
-- MOTIVATION.GOOD      好調
-- MOTIVATION.NORMAL    普通
-- MOTIVATION.BAD       不調
-- MOTIVATION.VERY_BAD  絶不調
-- となり、基本設定のCONFIG.DAILY_RACE.MOTIVATION_UP_SWEETSの項目に設定している値もこの定数になります
-- STATUS.SPEEDなども定数にあたり、実際には『スピード』という文字列として定義されています
-- やる気に関しては普通以上かどうかなど比較処理を行いたい場合があるのでテーブルが入っており MOTIVATION.NORMAL.index と記述することによってインデックス（この場合3が入っています）を参照できます
-- テーブルに関しては解説すると長くなるので詳しくは解説サイトがたくさんあるのでそちらを参考にして下さい
-- ドット（.）または角括弧（[]）でテーブル内にアクセスできるということだけ理解しておけば問題ないかと思います
-- また、print関数を利用することによってキーと値をログに出力できるので内容を確認したい場合に利用してください
-- 例：print( MOTIVATION )
--
-- 定義されている定数は以下のものがあります
--
-- TRACK.TURF                    芝
-- TRACK.DIRT                    ダート
-- STYLE.NIGE                    逃げ
-- STYLE.SENKOU                  先行
-- STYLE.SASHI                   差し
-- STYLE.OIKOMI                  追込
-- DISTANCE.SHORT                短距離
-- DISTANCE.MILE                 マイル
-- DISTANCE.MIDDLE               中距離
-- DISTANCE.LONG                 長距離
-- SUPPORT_TYPE.SPEED            スピード
-- SUPPORT_TYPE.STAMINA          スタミナ
-- SUPPORT_TYPE.POWER            パワー
-- SUPPORT_TYPE.GUTS             根性
-- SUPPORT_TYPE.INT              賢さ
-- SUPPORT_TYPE.FRIEND           友人
-- SUPPORT_TYPE.GROUP            グループ
-- SUPPORT_TYPE.OTHER            その他
-- SUPPORT_CHARA.CHAIRMAN        秋川理事長
-- SUPPORT_CHARA.REPORTER        乙名史記者
-- SUPPORT_CHARA.DEPUTY_CHAIRMAN 樫本理事長代理
-- CONDITION_TYPE.GOOD           グッド
-- CONDITION_TYPE.BAD            バッド
-- RARE.NORMAL                   ノーマル
-- RARE.RARE                     レア
-- RARE.UNIQUE                   固有
-- FACTOR.STATUS                 ステータス
-- FACTOR.APTITUDE               適性
-- FACTOR.UNIQUE_SKILL           固有スキル
-- FACTOR.SKILL                  スキル
-- FACTOR.RACE                   レース
-- FACTOR.SCENARIO               シナリオ
-- SCENARIO.URA                  URAファイナルズ
-- SCENARIO.AOHARU               アオハル杯
-- SCENARIO.CLIMAX               クライマックス
-- DIFFICULTY.NORMAL             通常モード
-- DIFFICULTY.EXTRA              追加モード
-- TRAINING_MODE.NORMAL          通常モード
-- TRAINING_MODE.EXTRA           追加モード
-- INDEFINITE                    -
--
-- 使用することのないような物はいくつか端折っていますが以上のものは文字列が定数に入っています
--
-- CLASS.DEBUT                   1：デビュー
-- CLASS.MAIDEN                  2：未勝利
-- CLASS.BEGINNER                3：ビギナー
-- CLASS.BRONZE                  4：ブロンズ
-- CLASS.SILVER                  5：シルバー
-- CLASS.GOLD                    6：ゴールド
-- CLASS.PLATINUM                7：プラチナ
-- CLASS.STAR                    8：スター
-- CLASS.TOPSTAR                 9：トップスター
-- CLASS.LEGEND                  10：レジェンド
-- MOTIVATION.VERY_BAD           1：絶不調
-- MOTIVATION.BAD                2：不調
-- MOTIVATION.NORMAL             3：普通
-- MOTIVATION.GOOD               4：好調
-- MOTIVATION.VERY_GOOD          5：絶好調
-- RANK.G                        1：G
-- RANK.F                        2：F
-- RANK.E                        3：E
-- RANK.D                        4：D
-- RANK.C                        5：C
-- RANK.B                        6：B
-- RANK.A                        7：A
-- RANK.S                        8：S
-- GRADE.INDEFINITE              1:-
-- GRADE.PRE_OP                  2:PreOP
-- GRADE.OP                      3:OP
-- GRADE.G3                      4:G3
-- GRADE.G2                      5:G2
-- GRADE.G1                      6:G1
-- GRADE.EX                      7:EX
--
-- 以上の定数はテーブルで定義されており名前とインデックスが入っています
-- 名前は .name インデックスは .index で参照できます
-- 例えば MOTIVATION.NORMAL.name は"普通"、 MOTIVATION.NORMAL.index は3になります
--
-- ステータス情報のチームランクと各適性ランクには RANK.A といった定数が入っています
-- 例えばステータスの芝のバ場適性がランクA以上か比較したい場合は
-- if g_status[STATUS.TRACK][TRACK.TURF].index >= RANK.A.index
-- といった記述になります
----------------------------------------------------------------------------------------------------
-- データベースの参照
-- ツール上で設定しているデータベースも全てスクリプトで参照できるようになっています
-- それぞれ以下の変数から参照が可能になっています
-- g_characterInfo         育成キャラ情報
-- g_supportCharacterInfo  サポートキャラ情報
-- g_eventInfo             イベント情報
-- g_skillInfo             スキル情報
-- g_raceInfo              レース情報
-- g_seasonInfo            時期情報
-- g_factorInfo            因子情報
-- g_conditionInfo         コンディション情報
-- g_trainingLogInfo       育成ログ情報
-- g_hallOfFameInfo        殿堂入りウマ娘情報
-- g_itemInfo              アイテム情報
-- g_groupInfo             グループ情報
-- 全てテーブル内に入れ子でテーブルが入っており、詳しく解説すると長くなるので参照するためのキーの名前だけ列挙します
-- 各関数で実際にデータベースを参照しているので、利用方法についてはそちらを参考にしてください
-- また、print関数を利用することによってキーと値をログに出力できるので内容を確認したい場合に利用してください
-- 例：print( g_characterInfo )
--
-- 育成キャラ情報
-- g_characterInfo
--   name               名前
--   style              作戦（脚質）
--   statusTarget       ステータス目標値
--   statusPriority     ステータス優先度
--   racePriority       目標レース以外の出走優先度
--   raceGrade          目標レース以外の出走条件
--   limitedTypeSkill   限定タイプ習得スキル
--   skillTypePriority  スキルタイプ別優先度
--
-- サポートキャラ情報
-- g_supportCharacterInfo
--   name               名前
--   priority           優先度
--   hintPriority       ヒントマークの優先度
--   rare               レア度
--   type               タイプ
--
-- イベント情報
-- g_eventInfo
--   name               イベント名
--   characterName      キャラクター名
--   type               タイプ
--   choice
--     name             選択肢
--     choiceParam
--       rate           発生率
--       type           項目
--       value          値
--
-- スキル情報
-- g_skillInfo
--   name               名前
--   rare               レア度
--   type               タイプ
--   skillPoint         スキルポイント
--   evaluation         評価点
--   limitedType        限定タイプ
--   stylePriority      脚質別優先度
--
-- レース情報
-- g_raceInfo
--   name               名前
--   priority           優先度
--   acquireFan         獲得ファン数
--   needFan            必要ファン数
--   grade              グレード
--   place              レース場
--   track              バ場
--   distance           距離
--   rotation           方向
--
-- 時期情報
-- g_seasonInfo
--   name               名前
--   index              インデックス
--   raceTable          開催レース
--
-- 因子情報
-- g_factorInfo
--   name               名前
--   type               タイプ
--
-- コンディション情報
-- g_conditionInfo
--   name               名前
--   priority           優先度
--   type               タイプ
--
-- 育成ログ情報
-- g_trainingLogInfo
--   status             ステータス
--   note               備考
--
-- 殿堂入りウマ娘情報
-- g_hallOfFameInfo
--   time               時間
--   status             ステータス
--
-- アイテム情報
-- g_itemInfo
--   name               名前
--   coin               必要コイン
--   type               タイプ
--   param              パラメータ
--   turn               持続ターン
--
-- グループ情報
-- g_groupInfo
--   name               名前
--   member             メンバー
--
-- それぞれのデータベースは名前をキーとしたテーブルとして保存されています（イベント情報のみ特殊でイベント名+タイプ+キャラクター名をキーとしています）
-- 例えば
-- g_characterInfo[g_status[STATUS.NAME]].style
-- このように記述することで育成中のキャラクターの作戦（脚質）を参照する事ができます
--
-- 育成ログ情報と殿堂入りウマ娘情報に関しては1からの添字で参照することができます
-- 例えば
-- g_trainingLogInfo[1].status[STATUS.SPEED]
-- このように記述することで育成ログの一番目に登録されているスピードを参照することができます
--
-- 時期はツール上の定数名で定義している名前で参照できるようになっています
-- 例えば現在の時期がジュニア級かどうか比較したい場合は
-- if g_status[STATUS.SEASON].index <= SEASON.JUNIOR_12B.index
-- といった記述が可能です
--
-- ステータス情報のレース、固有スキル、習得スキル、因子、コンディションにはデータベースのデータが入っています
-- 従って g_status[STATUS.RACE].name で出走したレースの名前を参照することができます
-- 習得スキル、因子、コンディションは添字を付けて参照することができます
-- 例えば g_status[STATUS.ACQUIRE_SKILL][1].name で1つ目の習得スキルの名前を参照できます
--
-- アイテム情報とグループ情報は固定データとなり編集する必要がないためツール上では設定できない仕様になっています
-- 『アイテム.csv』『グループ.csv』に記述している値が入っているので詳しくはそちらを参照してください
--
-- これらデータベースのデータは変数なので変更が可能です
-- 育成の途中で育成キャラの作戦（脚質）を変更するといったことも可能となっています
-- スクリプト内でデータベースのデータの変更を行ってもツール上で設定しているデータは一切変更されません。あくまでスクリプト実行中に有効になる値になります
-- スクリプトを一度停止し、再び開始するとツール上で設定されているデータベースの値に初期化されるようになっています
----------------------------------------------------------------------------------------------------
-- print関数とabort関数
-- 変数の内容を確認したい場合はprint関数を使うことによってログに出力することができます
-- 例：print( g_status[STATUS.NAME] )
--     print( "体力：" .. g_status[STATUS.HP] )
-- 書式指定子も使用できます
-- 例：print( "スピード：%d スタミナ：%d", g_status[STATUS.SPEED], g_status[STATUS.STAMINA] )
-- テーブルを引数に渡すとキーと値を全て列挙します
-- 例：print( g_status )
-- abort関数はスクリプトを強制終了させる場合に利用します
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- getStatusScore関数
-- ステータスによるスコアの算出をする
-- トレーニングとイベント選択肢でのステータス上昇によるスコア算出時に呼び出される
----------------------------------------------------------------------------------------------------
-- 引数：statusName
--   スコアを算出するステータス名。以下の値が入っている
--   STATUS.HP         体力
--   STATUS.MAXHP      最大体力
--   STATUS.MOTIVATION やる気
--   STATUS.SPEED      スピード
--   STATUS.STAMINA    スタミナ
--   STATUS.POWER      パワー
--   STATUS.GUTS       根性
--   STATUS.INT        賢さ
--   STATUS.SKILLPT    スキルPt
-- 引数：trainingInfo
--   トレーニングでのステータス上昇によるスコア算出時にトレーニング情報（テーブル）が入っている
--   イベント選択肢でのステータス上昇によるスコア算出時には何も入っていない（nilになる）
--   テーブルには name, hp, failureRate が入っており trainingInfo.name のように記述すると参照できる
--   name
--     トレーニング名。以下の値が入っている
--     STATUS.SPEED      スピード
--     STATUS.STAMINA    スタミナ
--     STATUS.POWER      パワー
--     STATUS.GUTS       根性
--     STATUS.INT        賢さ
--   hp
--     トレーニングによる体力の増減値
--     体力は体力ゲージから認識しているため若干の誤差が出る場合がある
--   failureRate
--     トレーニングの失敗率
-- 戻り値
--   スコア
--   スコア * 上昇値がステータス上昇による最終的なスコアになる
--   体力ややる気の上昇値は最大値でカンスト処理を行っている（例：最大体力100体力90の状態で体力+20のスコアは体力+10として算出される）
--   出力されるログの[]内が戻り値（詳しくは出力されるログを参照）
----------------------------------------------------------------------------------------------------
function getStatusScore( statusName, trainingInfo )

	local score = 0


	-- 育成キャラ情報を保持
	-- 保持するのは参照する度に g_characterInfo[g_status[STATUS.NAME]] と記述するのが冗長になるため
	local characterInfo = g_characterInfo[g_status[STATUS.NAME]]


	-- 体力の場合
	if statusName == STATUS.HP then

		-- スコアの設定の体力で設定している値（デフォルトは100）
		score = SCORE.HP

	-- 最大体力の場合
	elseif statusName == STATUS.MAXHP then

		-- スコアの設定の最大体力で設定している値（デフォルトは500）
		score = SCORE.MAXHP

	-- やる気の場合
	elseif statusName == STATUS.MOTIVATION then

		-- スコアの設定のやる気で設定している値（デフォルトは1000）
		score = SCORE.MOTIVATION

	-- スキルポイントの場合
	elseif statusName == STATUS.SKILLPT then

		-- スコアの設定のスキルポイントで設定している値（デフォルトは80）
		score = SCORE.SKILLPT


		-- 優先度によるスコア補正
		local statusPriority = characterInfo.statusPriority[statusName]
		score = score * statusPriority / 100


	-- それ以外（メインステータス）の場合
	else

		-- ステータスの目標値から現在値を引いて10で割った値をスコアにする
		score = (characterInfo.statusTarget[statusName] - g_status[statusName]) / 10


		-- トレーニングレベルによるスコア補正
		-- 対象ステータスのトレーニングレベルが低いほど多く倍率がかかる（例：トレーニングレベル1の場合はスコア140%）
		-- 夏合宿中のトレーニングレベルは夏合宿に入る前のトレーニングレベルになっている（レベル5にはならない）
		local trainingLevel = g_status[STATUS.TRAINING_LEVEL][statusName]
		score = score * (15 - trainingLevel) / 10


		-- 優先度によるスコア補正
		local statusPriority = characterInfo.statusPriority[statusName]
		score = score * statusPriority / 100


		-- 0から100までの範囲内に収める
		if score > 100 then
			score = 100
		elseif score < 0 then
			score = 0
		end
	end


	-- トレーニングでのステータス上昇によるスコア算出時
	if trainingInfo then

		-- 賢さトレーニングの場合は体力による補正（賢さのトレーニングによる体力回復を優先させるため）
		-- 体力が低いほど多く倍率がかかる（例：体力50の時はスコア125%）
		-- 友人とお出かけ可能の場合はイベント消化を優先させるために補正をかけない
		if trainingInfo.name == STATUS.INT and g_status[STATUS.FRIEND] == false then
			score = score * (100 + (100 - g_status[STATUS.HP]) / 2) / 100
		end

	end


	return score
end


----------------------------------------------------------------------------------------------------
-- getKizunaScore関数
-- 絆ゲージによるスコア及びヒントマーク（！）によるスコアの算出
-- トレーニングとイベント選択肢での絆ゲージ上昇によるスコア算出時に呼び出される
----------------------------------------------------------------------------------------------------
-- 引数：charaName
--   サポートキャラの名前（二つ名は除く）
-- 引数：hintMark
--   トレーニングでの絆ゲージ上昇によるスコア算出時にヒントマーク（！）がアイコンに表示されているか
--   イベント選択肢での絆ゲージ上昇によるスコア算出時の場合必ずfalseになる
--   true   表示されている
--   false  表示されていない
-- 引数：trainingInfo
--   トレーニングでの絆ゲージ上昇によるスコア算出時にgetStatusScore関数と同様のテーブルが入っている（詳しくはgetStatusScore関数のコメントを参照）
--   イベント選択肢での絆ゲージ上昇によるスコア算出時には何も入っていない（nilになる）
-- 戻り値
--   絆ゲージによるスコア, ヒントマーク（！）によるスコア
--   スコア * 上昇値が絆ゲージ上昇による最終的なスコアになる
--   絆ゲージは最大値でカンスト処理を行っているがレベル換算なので正確ではない（レベル5だと必ず上昇値は0になる）
--   トレーニングでの絆ゲージ上昇値は7
--   愛嬌○での上昇値ボーナスは反映されない
--   出力されるログの[]内が戻り値（左側がヒントマーク（！）によるスコア、右側が絆ゲージによるスコア。詳しくは出力されるログを参照）
----------------------------------------------------------------------------------------------------
function getKizunaScore( charaName, hintMark, trainingInfo )

	local score = 0
	local supportChara


	-- ステータスに登録されているサポートキャラ一覧から名前を検索
	for i = 1, #g_status[STATUS.SUPPORT_CHARA] do

		-- ステータスに登録されているサポートキャラは二つ名込みなのでremoveNickName関数で二つ名を削除してから比較
		if charaName == removeNickName(g_status[STATUS.SUPPORT_CHARA][i].name) then

			-- 名前が一致したサポートキャラを保持
			supportChara = g_status[STATUS.SUPPORT_CHARA][i]
			break
		end
	end


	-- サポートキャラ一覧に存在する場合
	if supportChara then

		-- 絆レベルをスコアの基準点にする
		-- レベル0だと100、レベル5だと0になる
		score = (5 - supportChara.kizunaLevel) * 20


		-- サポートキャラのタイプがその他以外（デッキに編成したサポートキャラ）の場合
		if supportChara.type ~= SUPPORT_TYPE.OTHER then

			-- サポートキャラのデータベースに登録している優先度によるスコア補正
			local priority = g_supportCharacterInfo[supportChara.name].priority
			score = score * priority / 100

			-- サポートキャラのタイプがメインステータスの場合
			if supportChara.type == SUPPORT_TYPE.SPEED or
				supportChara.type == SUPPORT_TYPE.STAMINA or
				supportChara.type == SUPPORT_TYPE.POWER or
				supportChara.type == SUPPORT_TYPE.GUTS or
				supportChara.type == SUPPORT_TYPE.INT then

				-- 育成キャラのデータベースに登録しているステータス優先度によるスコア補正
				local statusPriority = g_characterInfo[g_status[STATUS.NAME]].statusPriority[supportChara.type]
				score = score * statusPriority / 100

			end


		-- サポートキャラのタイプがその他（デッキに編成したサポートキャラ以外）の場合
		else

			-- 秋川理事長の場合
			if supportChara.name == SUPPORT_CHARA.CHAIRMAN then

				-- 特に補正はしない

			-- 乙名史記者の場合
			elseif supportChara.name == SUPPORT_CHARA.REPORTER then

				-- 50%にする
				score = score * 0.5

			-- 樫本理事長代理の場合
			elseif supportChara.name == SUPPORT_CHARA.DEPUTY_CHAIRMAN then

				-- 特に補正はしない

			end
		end


		-- 0から100までの範囲内に収める
		if score > 100 then
			score = 100
		elseif score < 0 then
			score = 0
		end

	end

	-- 登録されていないサポートキャラのイベントが発生する場合もあるがその場合は上記の処理は行われずスコアは0となっている


	-- ヒントマーク（！）によるスコアの算出
	local hintScore = 0
	if hintMark then

		-- サポートキャラのデータベースに登録しているヒントマークの優先度をスコアにする
		hintScore = g_supportCharacterInfo[supportChara.name].hintPriority
	end


	-- デビュー前の場合
	if g_status[STATUS.SEASON].index == SEASON.JUNIOR_DEBUT.index then

		-- 各スコアを3倍にする
		score = score * 3
		hintScore = hintScore * 3

	-- ジュニア級の場合
	elseif g_status[STATUS.SEASON].index <= SEASON.JUNIOR_12B.index then

		-- 各スコアを2倍にする
		score = score * 2
		hintScore = hintScore * 2

	end

	return score, hintScore
end


----------------------------------------------------------------------------------------------------
-- getAoharuScore関数
-- アオハル特訓によるスコアの算出
-- トレーニングでのアオハル特訓によるスコア算出時に呼び出される
----------------------------------------------------------------------------------------------------
-- 引数：charaName
--   チームメンバーの名前（二つ名は除く）
-- 引数：aoharuLevel
--   アオハル魂ゲージのレベル
--   ゲージの溜まり具合は便宜上レベルで表記している
--   0（空）～4（MAX）の値が入っている
--   アオハル魂爆発後はMAXの値になる
-- 引数：aoharuMark
--   アオハル特訓マークが表示されているか
--   0  表示されていない
--   1  白色で表示されている
--   2  青色で表示されている（アオハル魂爆発）
-- 引数：trainingInfo
--   getStatusScore関数と同様のテーブルが入っている（詳しくはgetStatusScore関数のコメントを参照）
-- 戻り値
--   アオハル特訓によるスコア
----------------------------------------------------------------------------------------------------
function getAoharuScore( charaName, aoharuLevel, aoharuMark, trainingInfo )

	local score = 0


	-- 白色のアオハル特訓マークが表示されている場合
	if aoharuMark == 1 then

		-- スコアをレベル0時は1000～レベルMAX時は200にする
		score = (5 - aoharuLevel) * 200

		-- ジュニア級の場合
		if g_status[STATUS.SEASON].index <= SEASON.JUNIOR_12B.index then

			-- スコアを3倍にする
			score = score * 3

		-- クラシック級の場合
		elseif g_status[STATUS.SEASON].index <= SEASON.CLASSIC_12B.index then

			-- スコアを2倍にする
			score = score * 2

		-- シニア級の場合
		elseif g_status[STATUS.SEASON].index <= SEASON.SENIOR_12B.index then

			-- スコアを等倍にする
			score = score * 1

		-- URAファイナルズの場合
		else

			-- スコアを0にする
			score = 0

		end

	-- 青色のアオハル特訓マークが表示されている場合
	elseif aoharuMark == 2 then

		-- 特定のトレーニング以外でアオハル魂爆発を発動させたくない場合は以下のように記述してスコアをマイナスにする
--		if trainingInfo.name ~= STATUS.SPEED then
--			score = -10000
--		end
	end

	return score
end


----------------------------------------------------------------------------------------------------
-- getConditionScore関数
-- コンディションによるスコア算出
-- イベント選択肢でのコンディションによるスコア算出時に呼び出される
----------------------------------------------------------------------------------------------------
-- 引数：conditionInfo
--   コンディション情報
--   データベースに登録されているコンディション情報が入っている
-- 戻り値
--   コンディションによるスコア
--   出力されるログの[]内が戻り値（詳しくは出力されるログを参照）
----------------------------------------------------------------------------------------------------
function getConditionScore( conditionInfo )

	-- コンディションの優先度の10倍をスコアにする
	local score = conditionInfo.priority * 10


	-- バッドコンディションの場合はスコアをマイナスにする
	if conditionInfo.type == CONDITION_TYPE.BAD then
		score = 0 - score
	end

	return score
end


----------------------------------------------------------------------------------------------------
-- getHintScore関数
-- ヒントによるスコア算出
-- イベント選択肢でのヒントによるスコア算出時に呼び出される
----------------------------------------------------------------------------------------------------
-- 引数：skillInfo
--   スキル情報
--   データベースに登録されているスキル情報が入っている
-- 戻り値
--   ヒントによるスコア
--   スコア * 上昇するヒントレベルがヒントによる最終的なスコアになる
--   ヒントレベルは保持されていないため、カンスト処理は行っていない
--   出力されるログの[]内が戻り値（詳しくは出力されるログを参照）
----------------------------------------------------------------------------------------------------
function getHintScore( skillInfo )

	-- スキルのスコアの5倍をヒントのスコアにする
	return getSkillScore( skillInfo ) * 5
end


----------------------------------------------------------------------------------------------------
-- getAcquireSkillScore関数
-- スキル習得によるスコア算出
-- イベント選択肢でのスキル習得によるスコア算出時に呼び出される
----------------------------------------------------------------------------------------------------
-- 引数：skillInfo
--   スキル情報
--   データベースに登録されているスキル情報が入っている
-- 戻り値
--   スキル習得によるスコア
--   出力されるログの[]内が戻り値（詳しくは出力されるログを参照）
----------------------------------------------------------------------------------------------------
function getAcquireSkillScore( skillInfo )

	-- スキルのスコアの20倍をスキル習得のスコアにする
	local score = getSkillScore( skillInfo ) * 20


	-- バッドスキルの場合はスコアをマイナスにする
	if skillInfo.type == SKILL_TYPE.BAD_SPEED or
		skillInfo.type == SKILL_TYPE.BAD_STAMINA or
		skillInfo.type == SKILL_TYPE.BAD_POWER or
		skillInfo.type == SKILL_TYPE.BAD_GUTS or
		skillInfo.type == SKILL_TYPE.BAD_INT or
		skillInfo.type == SKILL_TYPE.BAD_RECOVER or
		skillInfo.type == SKILL_TYPE.BAD_START then
		score = 0 - score
	end

	return score
end


----------------------------------------------------------------------------------------------------
-- getSkillScore関数
-- スキルのスコア算出
-- スキル獲得画面でスキルによるスコア算出時に呼び出される
-- getHintScore関数、getAcquireSkillScore関数でスキルのヒント、習得によるスコア算出時にも利用している
----------------------------------------------------------------------------------------------------
-- 引数：skillInfo
--   スキル情報
--   データベースに登録されているスキル情報が入っている
-- 引数：hintLevel
--   スキルの現在のヒントレベル
--   0（スキルポイント割引なし）～5（最大）が入っている
--   getHintScore関数、getAcquireSkillScore関数から呼び出された場合は何も入っていない（nilになる）
-- 戻り値
--   スキルのスコア
----------------------------------------------------------------------------------------------------
function getSkillScore( skillInfo, hintLevel )

	-- 育成キャラ情報を保持
	local characterInfo = g_characterInfo[g_status[STATUS.NAME]]


	-- まずデータベースに登録されている脚質別優先度をスコアに設定
	local score = skillInfo.stylePriority[characterInfo.style]


	-- 育成キャラに設定しているスキルタイプ別優先度による補正
	score = score * characterInfo.skillTypePriority[skillInfo.type] / 100


	-- ヒントレベルがnilではない場合
	if hintLevel then

		-- ヒントレベルによる補正（ヒントレベル最大の場合は2倍）
		score = score * (5 + hintLevel) / 5

	end


	-- 金スキルはスコアを1.5倍にする
	if skillInfo.rare == RARE.RARE then
		score = score * 1.5
	end


	-- 限定タイプスキルの場合
	-- INDEFINITEは"-"でなにも設定されていない
	if skillInfo.limitedType ~= INDEFINITE then


		-- 育成キャラの作戦（脚質）と違うかつ限定タイプ習得スキルに設定されていない場合
		if (skillInfo.limitedType ~= characterInfo.style) and (not characterInfo.limitedTypeSkill[skillInfo.limitedType]) then

			-- スコアを0にする
			score = 0

		-- 育成キャラの作戦（脚質）と同じまたは限定タイプ習得スキルに設定されている場合
		else

			-- スコアを1.5倍にする
			score = score * 1.5

		end

	end


	-- スキルの評価効率を下位スキルも加味した上で算出してスコアに反映したい場合は以下のように記述する（適性による補正は考慮していない）
--[[
	local totalSkillPoint = skillInfo.skillPoint
	local totalEvaluation = skillInfo.evaluation
	if skillInfo.lowerSkill then

		-- isAcquireSkill関数は引数のスキルが習得済みかどうかを真偽値として返す
		if not isAcquireSkill(skillInfo.lowerSkill) then
			totalSkillPoint = totalSkillPoint + skillInfo.lowerSkill.skillPoint
			totalEvaluation = totalEvaluation + skillInfo.lowerSkill.evaluation
		end
	end
	if totalSkillPoint > 0 then
		score = score * totalEvaluation / totalSkillPoint
	end
]]


	-- 以下のように記述するとスキル獲得画面を開いたときのヒントレベルを保持して他の関数で参照ができるようになる
	-- 実行開始時はg_skillInfo[skillInfo.name].hintLevelには何も入っていない状態なので他の関数で参照する場合はnilかどうかのチェックが必要
--[[
	if hintLevel then
		g_skillInfo[skillInfo.name].hintLevel = hintLevel
		又は
		skillInfo.hintLevel = hintLevel
	end
]]


	return score
end


----------------------------------------------------------------------------------------------------
-- getRaceScore関数
-- レースのスコア算出
-- 目標レースへ出走するか判断する場合、レースのスコア算出時に呼び出される
----------------------------------------------------------------------------------------------------
-- 引数：raceInfo
--   レース情報
--   データベースに登録されているレース情報が入っている
-- 引数：rival
--   ライバルが出走するか
--   getAction関数でACTION.CHECK_RACE実行時に2つ目の戻り値をtrueにした場合に有効
--   true   出走する
--   false  出走しない
-- 戻り値
--   レースのスコア
----------------------------------------------------------------------------------------------------
function getRaceScore( raceInfo, rival )

	-- ファン獲得人数 / 100をスコアにする
	local score = raceInfo.acquireFan / 100


	-- 適性ランクによる倍率テーブル
	local magTable =
	{
		0,		-- Gランク
		0,		-- Fランク
		0,		-- Eランク
		0,		-- Dランク
		0,		-- Cランク
		0.5,	-- Bランク
		1.0,	-- Aランク
		1.2,	-- Sランク
	}


	-- バ場適性によるスコア補正
	score = score * magTable[g_status[STATUS.TRACK][raceInfo.track].index]


	-- 距離適性によるスコア補正
	score = score * magTable[g_status[STATUS.DISTANCE][raceInfo.distance].index]


	-- 優先度によるスコア補正
	score = score * raceInfo.priority / 100


	-- ライバルが出走する場合2倍にする
	if rival then
		score = score * 2
	end

	return score
end


----------------------------------------------------------------------------------------------------
-- getItemScore関数
-- アイテムのスコア算出
-- アイテムを購入するかを判断する場合、アイテムのスコア算出時に呼び出される
-- アイテムやアイテムタイプの定数名及びアイテムのパラメータについては『アイテム.csv』を参照
----------------------------------------------------------------------------------------------------
-- 引数：itemInfo
--   アイテム情報
--   データベースに登録されているアイテム情報が入っている
-- 引数：coin
--   購入に必要なコイン
--   セール中は割引価格になる
-- 引数：count
--   アイテムの所持数
--   購入していないアイテムは0になる
-- 引数：sale
--   アイテムがセール中か
--   true   セール中
--   false  セール中ではない
-- 引数：turn
--   購入可能な残りターン数
-- 戻り値
--   アイテムのスコア
--   デフォルトの処理ではスコアが100以上のアイテムがスコアの高い順に購入される（getBuyItem関数を参照）
----------------------------------------------------------------------------------------------------
function getItemScore( itemInfo, coin, count, sale, turn )

	-- 引数で指定した名前のアイテムの所持数を取得する関数
	local function getItemCount( itemName )
		for i = 1, #g_status[STATUS.ITEM] do
			if g_status[STATUS.ITEM][i].itemInfo.name == itemName then
				return g_status[STATUS.ITEM][i].count
			end
		end
		return 0
	end

	-- アイテムで回復できる体力の合計を取得する関数
	local function getTotalRecoverHp()
		local totalRecoverHp = 0
		local itemNameTable =
		{
			ITEM.JUICE,
			ITEM.VITAL3,
			ITEM.VITAL2,
			ITEM.VITAL1,
		}
		for i = 1, #itemNameTable do
			totalRecoverHp = totalRecoverHp + getItemCount(itemNameTable[i]) * g_itemInfo[itemNameTable[i]].param
		end
		return totalRecoverHp
	end

	local score = 0

	-- 体力回復アイテムの場合
	if itemInfo.type == ITEM_TYPE.HP then

		-- 回復量*2+60を基準点にする
		score = itemInfo.param * 2 + 60

		-- 所持数による補正
		score = score - count * 30

		-- アイテムで回復できる体力の合計が50以下の場合
		if getTotalRecoverHp() <= 50 then

			-- 50点を加点する
			score = score + 50
		end

		-- シニア級の10月以降の場合
		if g_status[STATUS.SEASON].index >= SEASON.SENIOR_10A.index then

			-- アイテムで回復できる体力による補正
			score = score - getTotalRecoverHp() / 2
		end

	-- 最大体力上昇アイテムの場合
	elseif itemInfo.type == ITEM_TYPE.MAXHP then

		-- ジュニア級の場合
		if g_status[STATUS.SEASON].index <= SEASON.JUNIOR_12B.index then

			-- 100を基準点にする
			score = 100
		end

	-- やる気上昇アイテムの場合
	elseif itemInfo.type == ITEM_TYPE.MOTIVATION then

		-- ジュニア級の場合
		if g_status[STATUS.SEASON].index <= SEASON.JUNIOR_12B.index then

			-- 未所持の場合は80を基準点にする
			if count == 0 then
				score = 80
			end
		end

	-- ステータス上昇アイテムの場合
	elseif itemInfo.type == ITEM_TYPE.SPEED or
		itemInfo.type == ITEM_TYPE.STAMINA or
		itemInfo.type == ITEM_TYPE.POWER or
		itemInfo.type == ITEM_TYPE.GUTS or
		itemInfo.type == ITEM_TYPE.INT then

		-- getStatusScore関数を利用して基準点を算出（最大120+上昇値*2）
		score = math.min(getStatusScore(itemInfo.type) * itemInfo.param / 3, 120 + itemInfo.param * 2)

	-- 絆ゲージ上昇アイテムの場合
	elseif itemInfo.type == ITEM_TYPE.KIZUNA then

		-- にんじんBBQセットの場合
		if itemInfo.name == ITEM.KIZUNA_SUPPORT then

			-- サポートキャラの絆レベルから基準点を算出
			for i = 1, #g_status[STATUS.SUPPORT_CHARA] do
				if g_status[STATUS.SUPPORT_CHARA][i].type ~= SUPPORT_TYPE.OTHER then
					score = score + math.max(4 - g_status[STATUS.SUPPORT_CHARA][i].kizunaLevel, 0) * 50
				end
			end
		end

	-- グッドコンディション付与アイテムの場合
	elseif itemInfo.type == ITEM_TYPE.GOOD_CONDITION then

		-- 既にグッドコンディションが付与されているかを判定
		local hasCondition = false
		for i = 1, #g_status[STATUS.CONDITION] do
			if g_status[STATUS.CONDITION][i].name == itemInfo.param then
				hasCondition = true
				break
			end
		end

		-- グッドコンディションがまだ付与されていない場合
		if not hasCondition then

			-- プリティーミラーの場合
			if itemInfo.name == ITEM.CONDITION_AIKYO then

				-- サポートキャラの絆レベルから基準点を算出
				for i = 1, #g_status[STATUS.SUPPORT_CHARA] do
					if g_status[STATUS.SUPPORT_CHARA][i].type ~= SUPPORT_TYPE.OTHER then
						score = score + math.max(4 - g_status[STATUS.SUPPORT_CHARA][i].kizunaLevel, 0) * 30
					end
				end

			-- 博学帽子の場合
			elseif itemInfo.name == ITEM.CONDITION_KIREMONO then

				-- 500を基準点にする
				score = 500
			end
		end

	-- バッドコンディション解除アイテムの場合
	elseif itemInfo.type == ITEM_TYPE.BAD_CONDITION then

		-- ナンデモナオールの場合
		if itemInfo.name == ITEM.CONDITION_ALL_BAD then

			-- ジュニア級の場合
			if g_status[STATUS.SEASON].index <= SEASON.JUNIOR_12B.index then

				-- 未所持の場合は80を基準点にする
				if count == 0 then
					score = 80
				end
			end
		end

	-- トレーニングレベル上昇アイテムの場合
	elseif itemInfo.type == ITEM_TYPE.TRAINING_LEVEL then

		-- 対応するサポートカードの枚数の80倍を基準点にする
		for i = 1, #g_status[STATUS.SUPPORT_CHARA] do
			if g_status[STATUS.SUPPORT_CHARA][i].type == itemInfo.param then
				score = score + 80
			end
		end

		-- 現在のトレーニングレベルによる補正
		score = score - (g_status[STATUS.TRAINING_LEVEL][itemInfo.param] - 1) * 50

	-- メガホンの場合
	elseif itemInfo.type == ITEM_TYPE.MEGAPHONE then

		-- 効果（20,40,60）の5倍を基準点にする
		score = itemInfo.param * 5

		-- 所持数による補正
		-- 上位のメガホンも補正の対象にする
		if itemInfo.name == ITEM.MEGAPHONE1 then
			score = score - (count + getItemCount(ITEM.MEGAPHONE2) + getItemCount(ITEM.MEGAPHONE3)) * 30
		elseif itemInfo.name == ITEM.MEGAPHONE2 then
			score = score - (count + getItemCount(ITEM.MEGAPHONE3)) * 30
		else
			score = score - count * 30
		end

	-- アンクルウェイトの場合
	elseif itemInfo.type == ITEM_TYPE.ANKLE_WEIGHT then

		-- 対応するサポートカードの枚数の60倍を基準点にする
		for i = 1, #g_status[STATUS.SUPPORT_CHARA] do
			if g_status[STATUS.SUPPORT_CHARA][i].type == itemInfo.param then
				score = score + 60
			end
		end

		-- 所持数による補正
		score = score - count * 30

	-- リセットホイッスルの場合
	elseif itemInfo.type == ITEM_TYPE.WHISTLE then

		-- 150を基準点にする
		score = 150

	-- 健康祈願のお守りの場合
	elseif itemInfo.type == ITEM_TYPE.OMAMORI then

		-- 200を基準点にする
		score = 200

		-- 所持数による補正
		score = score - count * 30

		-- シニア級の10月以降の場合
		if g_status[STATUS.SEASON].index >= SEASON.SENIOR_10A.index then

			-- アイテムで回復できる体力による補正
			score = score - getTotalRecoverHp() / 2
		end

	-- ハンマーの場合
	elseif itemInfo.type == ITEM_TYPE.HAMMER then

		-- 効果（20,35）の6倍を基準点にする
		score = itemInfo.param * 6

		-- 所持数による補正
		score = score - count * 30

		-- クライマックス開催中の場合
		if g_status[STATUS.SEASON].index == SEASON.CLIMAX.index and g_status[STATUS.SEASON_INDEX] == 1 then

			-- 蹄鉄ハンマー・極が3つ以上の場合
			if getItemCount(ITEM.HAMMER2) >= 3 then

				-- 0を基準点にする
				score = 0

			-- 蹄鉄ハンマーの合計が3つより少ない場合
			elseif getItemCount(ITEM.HAMMER1) + getItemCount(ITEM.HAMMER2) < 3 then

				-- 100点を加点する
				score = score + 100
			end
		end

	-- 三色ペンライトの場合
	elseif itemInfo.type == ITEM_TYPE.PENLIGHT then

	end

	-- マイナスの場合は0にする
	if score < 0 then
		score = 0
	end

	-- セール中の場合は20点を加点
	if sale then
		score = score + 20
	end

	-- 購入可能な残りターン数で加点
	score = score + (6 - turn)

	-- クライマックス開催中は100点を加点
	if g_status[STATUS.SEASON].index == SEASON.CLIMAX.index then
		score = score + 100
	end

	return score
end


----------------------------------------------------------------------------------------------------
-- getAction関数
-- 育成のホーム画面で行う行動の取得
-- 育成のホーム画面になった時に呼び出される
-- レース本番時にも呼び出される（レース本番時はg_status[STATUS.TURN]が0になる）
-- 育成完了画面になったときにも呼び出される（育成完了時はg_status[STATUS.COMPLETE]がtrueになる）
----------------------------------------------------------------------------------------------------
-- 引数：actionInfo
--   trainingScoreTable
--     トレーニングのスコアテーブル
--     戻り値にACTION.CHECK_TRAININGを指定してトレーニング確認後に有効な値になる
--     スコアの高い順にソートされている
--       name           トレーニング名
--       score          スコア
--       hp             体力の増減値
--       failureRate    失敗率
--       addStatus      ステータス上昇値
--       例：actionInfo.trainingScoreTable[1].addStatus[STATUS.SPEED]で最高スコアのトレーニングによるスピードの上昇値を参照できる
--       supportChara   トレーニングに付いているサポートキャラ
--         name         名前
--         type         タイプ
--         rare         レア度
--         kizunaLevel  絆レベル
--         hintMark     ヒントマーク（！）が表示されているか
--       例：actionInfo.trainingScoreTable[1].supportChara[1].kizunaLevelで最高スコアのトレーニングに付いている一人目のサポートキャラの絆レベルを参照できる
--       teamMember     トレーニングに付いているチームメンバー
--                      アオハル杯シナリオのみ有効な値でその他のシナリオではnilになる
--         name         名前
--         aoharuLevel  アオハル魂ゲージのレベル
--         aoharuMark   アオハル特訓マークが表示されているか
--                        0  表示されていない
--                        1  白色で表示されている
--                        2  青色で表示されている（アオハル魂爆発）
--       例：actionInfo.trainingScoreTable[1].teamMember[1].aoharuLevelで最高スコアのトレーニングに付いている一人目のチームメンバーのアオハル魂ゲージのレベルを参照できる
--   skillScoreTable
--     習得可能なスキルのスコアテーブル
--     戻り値にACTION.CHECK_SKILLを指定してスキル確認後に有効な値になる
--     スキル確認後にスキルの習得処理を行った場合習得したスキルは含まれていない
--     スキルの習得処理を行わず確認のみを行って習得可能なスキルを参照したい場合に利用できる
--     スコアの高い順にソートされている
--       skillInfo  スキル情報
--       skillPoint 必要スキルポイント
--       hintLevel  ヒントレベル
--       score      スコア
--     例：skillScoreTable[1].skillInfo.nameで最高スコアのスキル名を参照できる
--   raceScoreTable
--     出走可能なレースのスコアテーブル
--     戻り値にACTION.CHECK_RACEを指定してレース確認後に有効な値になる
--     スコアの高い順にソートされている
--       raceInfo  レース情報
--       rival     ライバルが出走するか
--       score     スコア
--     例：actionInfo.raceScoreTable[1].raceInfo.nameで最高スコアのレース名を参照できる
--   itemScoreTable
--     購入可能なアイテムのスコアテーブル
--     戻り値にACTION.CHECK_ITEMを指定してアイテム確認後に有効な値になる
--     アイテム確認後にアイテムの購入処理を行った場合購入したアイテムは含まれていない
--     コイン不足等により交換できないアイテムもテーブルに含まれる（採点はされないのでスコアがnilになる）
--     スコアの高い順にソートされている
--       itemInfo  アイテム情報
--       count     アイテムの所持数
--       sale      アイテムがセール中か
--       turn      購入可能な残りターン数
--       score     スコア
--     例：itemScoreTable[1].itemInfo.nameで最高スコアのアイテム名を参照できる
--   unavailableItemTable
--     利用不可アイテムのテーブル
--     例：actionInfo.unavailableItemTable[ITEM.VITAL1]でバイタル20が利用不可かどうかを判定できる
--     ACTION.USE_ITEMを返して使用したアイテムが利用不可の場合にtrueになる
--     利用不可アイテムを使用しようとして無限ループになってしまうのを防ぐために利用する
--     ターン毎に初期化される
--   isChangeTurn
--     ターン（時期）が変更されたかどうか
--       true   変更された
--       false  変更されていない
--     スクリプト再開時に同じターンで不要な処理を実行するのを防ぐ為に利用する
--     ターン（時期）認識時に変更されたかどうかのフラグが入っており同じターンに複数回getAction関数が呼ばれた場合でもこのフラグは変わらない（trueの場合はtrueのままになる）
--     育成完了時も変更されたとみなされてtrueになる
--   isChangeShopItem
--     ショップのアイテムが変更されたかどうか
--       true   変更された
--       false  変更されていない
--     ショップの購入処理を行う場合に利用する
--     固定の入れ替え時期と追加アイテムの残りターンで判定してフラグを設定している
--     追加アイテムが残っている状態で更にアイテムが追加された場合は残りターンで判定している為フラグがtrueになるタイミングがずれる
--   actionTable
--     育成のホーム画面で実行した行動
--     例：actionInfo.actionTable[ACTION.CHECK_SKILL]でスキルの確認を実行したかどうかを判定できる
--     行動を実行する前はnilになり実行した後はtrueになる
--     同じ行動を繰り返し実行してしまうのを防ぐために利用する
--     ターン毎に初期化される
-- 戻り値
--   実行する行動
--   ※マークがついている行動は実行してもターンは進行せず処理実行後に再びgetAction関数が呼ばれる
--   再度getAction関数が呼ばれた時にはactionInfo.actionTable[実行した行動]がtrueになっているのでactionInfo.actionTableを利用して同じ行動を実行するのを防ぐことができる
--   ACTION.CHECK_DETAIL_STATUS  ※能力詳細確認
--                                 能力詳細画面ではキャラクター名、各種ステータス、適性、成長率、コンディション、固有スキルを取得する
--                                 2つ目の戻り値に固有スキルを確認するかを指定できる（trueを指定すると確認する）
--   ACTION.CHECK_GO_OUT_CHARA   ※お出かけ可能キャラ確認
--                                 友人タイプのサポートカードを複数編成しており、誰がお出かけ可能になったのかを判定したい場合に確認する
--   ACTION.CHECK_SKILL          ※スキル確認
--                                 スキル確認を行うとスキル画面へ遷移後に習得可能なスキルのスコア算出が行われgetAcquireSkill関数の戻り値に従ってスキルの習得処理を行う
--   ACTION.CHECK_RACE           ※レース確認
--                                 レース確認を行うと出走可能なレースのスコア算出が行われactionInfo.raceScoreTableに代入される
--                                 2つ目の戻り値にtrueを指定するとレース一覧へ遷移後にライバルが出走しているかどうかを確認する
--                                 2つ目の戻り値にtrueを指定しない場合レースのスコアはデータベースから算出するのでレース一覧へ遷移することはない（ライバルが出走しているレースは判定できない）
--   ACTION.CHECK_SHOP           ※ショップ確認
--                                 ショップが利用可能（g_status[STATUS.SHOP]がtrue）の場合のみ指定できる
--                                 ショップ確認を行うとショップ画面へ遷移後に購入可能なアイテムのスコア算出が行われgetBuyItem関数の戻り値に従ってアイテムの購入処理を行う
--   ACTION.CHECK_ITEM           ※アイテム確認
--                                 所持グッズボタンが表示されている場合のみ指定できる
--                                 アイテム確認を行うと所持グッズ画面へ遷移後にアイテムの所持状態を認識してステータスへ反映する
--                                 自動育成を途中から開始した場合にアイテムの所持状態をステータスへ反映させたい場合に利用する
--                                 所持グッズ画面からスクリプトを実行開始することにより同様の処理を行うことができる
--   ACTION.CHECK_FAN            ※ファン数確認
--                                 クラスのボタンが表示されている場合のみ指定できる
--                                 ファン数確認を行うとウマ娘のクラス画面へ遷移後にファン数を認識してステータスへ反映する
--                                 自動育成を途中から開始した場合にファン数をステータスへ反映させたい場合に利用する
--                                 ウマ娘のクラス画面からスクリプトを実行開始することにより同様の処理を行うことができる
--   ACTION.CHECK_TRAINING       ※トレーニング確認
--                                 トレーニング確認を行うとトレーニング画面へ遷移後に各トレーニングのスコア算出が行われactionInfo.trainingScoreTableに代入される
--                                 2つ目の戻り値に確認するトレーニング名のテーブルを指定する
--                                 通常は全5種類のトレーニングの確認を行えばよいが時短の為に確認するトレーングを限定させる事が可能
--   ACTION.LOAD_MY_ROTATION     ※マイローテの読み込み
--                                 2つ目の戻り値に読み込むマイローテ番号を指定する
--   ACTION.TRAINING             トレーニング
--                                 2つ目の戻り値にトレーニング名を指定する
--                                 トレーニング確認をせずに決め打ちでトレーニングを行っても良いがトレーニング制限により指定したトレーニングを行えない場合があるので注意
--   ACTION.DAY_OFF              お休み
--                                 夏合宿中はお休み＆お出かけが自動的に実行される
--   ACTION.GO_OUT               お出かけ
--                                 夏合宿中はお休み＆お出かけが自動的に実行される
--   ACTION.DAY_OFF_AND_GO_OUT   お休み＆お出かけ
--                                 夏合宿中のみ実行可能
--   ACTION.FRIEND               友人とお出かけ
--                                 友人とお出かけが可能（g_status[STATUS.FRIEND]がtrue）の場合でのみ指定できる
--                                 2つ目の戻り値にキャラクターの名前（二つ名は除く）を指定できる
--                                 グループタイプの場合はグループに所属しているメンバーの名前を指定する
--                                 指定しない場合やお出かけ不可能なキャラクターを指定した場合はお出かけ可能なキャラクターが上から順番に選ばれる
--   ACTION.INFIRMARY            保健室
--                                 保健室が利用可能（g_status[STATUS.INFIRMARY]がtrue）の場合でのみ指定できる
--   ACTION.RACE                 レース出走
--                                 2つ目の戻り値に出走するレースのレース情報を指定する
--                                 レース本番または未勝利クラスの場合はレース一覧の一番上のレースに出走されるので指定しなくて良い
--   ACTION.USE_ITEM             ※アイテムの使用
--                                 2つ目の戻り値に使用するアイテムのアイテム情報を指定する
--                                 未所持のアイテムや使用不可のアイテムを指定するとunavailableItemTableのフラグがtrueになる
--   ACTION.COMPLETE             育成完了
--                                 育成完了画面（g_status[STATUS.COMPLETE]がtrue）の場合でのみ指定できる
--   ACTION.RETIRE               あきらめる
--                                 メニューからあきらめるを選択してホーム画面へ戻る
--   ACTION.WAIT                 ※待機
--                                 2つ目の戻り値に待機する秒数を指定する
--   ACTION.REBOOT               ウマ娘の再起動
--   ACTION.EXIT                 スクリプトの終了
----------------------------------------------------------------------------------------------------
function getAction( actionInfo )

	-- 能力詳細を確認するかの判定
	----------------------------------------------------------------------------------------------------
	-- まだ能力詳細を確認していない場合
	if actionInfo.actionTable[ACTION.CHECK_DETAIL_STATUS] == nil then

		-- キャラクター名が不明（nilまたは空）の場合
		-- キャラクター名を取得しないと実行不能になるのでキャラクター名が不明の場合は能力詳細の確認が必須
		if g_status[STATUS.NAME] == nil or g_status[STATUS.NAME] == "" then

			--能力詳細を確認（固有スキルも確認）
			return ACTION.CHECK_DETAIL_STATUS, true
		end

		-- ターンが変更された場合（スクリプト再開時に再度確認するのを防止するための条件分岐）
		if actionInfo.isChangeTurn then

			-- 固有スキルのレベルに変化がある可能性がある時期に能力詳細を確認
			-- 固有スキルのレベルは評価点に影響する
			-- クライマックスシナリオの場合
			if g_status[STATUS.SCENARIO] == SCENARIO.CLIMAX then

				-- 年末後の場合
				if g_status[STATUS.SEASON].index == SEASON.CLASSIC_1A.index or
					g_status[STATUS.SEASON].index == SEASON.SENIOR_1A.index or
					g_status[STATUS.SEASON].index == SEASON.CLIMAX.index and g_status[STATUS.SEASON_INDEX] == 1 then

					--能力詳細を確認（固有スキルも確認）
					return ACTION.CHECK_DETAIL_STATUS, true
				end

			-- クライマックスシナリオ以外の場合
			else
				-- バレンタイン、ファン感謝祭、クリスマス後の場合
				if g_status[STATUS.SEASON].index == SEASON.SENIOR_2A.index or
					g_status[STATUS.SEASON].index == SEASON.SENIOR_4A.index or
					g_status[STATUS.SEASON].index == SEASON.SENIOR_12B.index then

					--能力詳細を確認（固有スキルも確認）
					return ACTION.CHECK_DETAIL_STATUS, true
				end
			end

			-- 因子継承後の場合
			-- 因子継承後に適性に変化がある可能性がある
			if g_status[STATUS.SEASON].index == SEASON.CLASSIC_4A.index or
				g_status[STATUS.SEASON].index == SEASON.SENIOR_4A.index then

				--能力詳細を確認
				return ACTION.CHECK_DETAIL_STATUS
			end

			-- 育成完了時の場合
			-- 育成完了時は最終ターンから育成完了時までにステータスが変化する可能性がある
			if g_status[STATUS.COMPLETE] then

				--能力詳細を確認
				return ACTION.CHECK_DETAIL_STATUS
			end
		end
	end


	-- 育成完了画面の処理
	-- 育成完了画面ではスキルの確認か育成完了のみ実行可能
	----------------------------------------------------------------------------------------------------
	-- 育成完了画面の場合
	if g_status[STATUS.COMPLETE] then

		-- まだスキルを確認していない場合
		if actionInfo.actionTable[ACTION.CHECK_SKILL] == nil then

			-- スキルを確認
			return ACTION.CHECK_SKILL
		end

		-- 育成完了
		return ACTION.COMPLETE
	end


	-- ファン数を確認する処理
	-- ファン数はレース結果画面で画像認識して取得しているが育成途中から実行開始した場合ファン数は1になる
	-- そのままだと出走条件を満たせず目標レース以外のレースに出走できない状態になるのでファン数を確認する
	----------------------------------------------------------------------------------------------------
	-- まだファン数を確認していない場合
	if actionInfo.actionTable[ACTION.CHECK_FAN] == nil then

		-- デビュー後の場合
		if g_status[STATUS.SEASON].index > SEASON.JUNIOR_DEBUT.index then

			-- ファン数が1の場合
			if g_status[STATUS.FAN] == 1 then

				--ファン数を確認
				return ACTION.CHECK_FAN
			end
		end
	end


	-- CONFIG.MY_ROTATIONで指定したマイローテを読み込む処理
	----------------------------------------------------------------------------------------------------
	-- まだマイローテを読み込んでいない場合
	if actionInfo.actionTable[ACTION.LOAD_MY_ROTATION] == nil then

		-- デビュー後の場合
		if g_status[STATUS.CLASS].index > CLASS.MAIDEN.index then

			-- CONFIG.MY_ROTATIONが0以外の場合
			if CONFIG.MY_ROTATION ~= 0 then

				-- ステータスのマイローテがCONFIG.MY_ROTATIONと違う場合
				if g_status[STATUS.MY_ROTATION] ~= CONFIG.MY_ROTATION then

					--マイローテの読み込み
					return ACTION.LOAD_MY_ROTATION, CONFIG.MY_ROTATION
				end
			end
		end
	end


	-- ショップの購入処理
	----------------------------------------------------------------------------------------------------
	-- ショップが利用可能な場合
	if g_status[STATUS.SHOP] then

		-- まだショップを確認していない場合
		if actionInfo.actionTable[ACTION.CHECK_SHOP] == nil then

			-- ターンが変更された場合（スクリプト再開時に再度確認するのを防止するための条件分岐）
			if actionInfo.isChangeTurn then

				-- ショップのアイテムが変更された場合
				if actionInfo.isChangeShopItem then

					-- ショップを確認
					return ACTION.CHECK_SHOP
				end
			end
		end
	end


	-- アイテムの所持数を取得する関数
	-- 扱いやすいように引数はアイテム名を渡すようにしている
	-- getItemCount(ITEM.MEGAPHONE1)でチアメガホンの所持数を取得できる
	----------------------------------------------------------------------------------------------------
	local function getItemCount( itemName )

		-- 利用不可アイテムの場合は無限ループ防止のために所持していない事にする
		if actionInfo.unavailableItemTable[itemName] then
			return 0
		end

		for i = 1, #g_status[STATUS.ITEM] do
			if g_status[STATUS.ITEM][i].itemInfo.name == itemName then
				return g_status[STATUS.ITEM][i].count
			end
		end
		return 0
	end


	-- 発動中のアイテムを取得する関数
	-- 引数は重複不可アイテムに対応するためアイテムタイプを渡す
	-- getActiveItem(ITEM_TYPE.MEGAPHONE)で発動中のメガホンの発動アイテムを取得できる
	----------------------------------------------------------------------------------------------------
	local function getActiveItem( itemType )
		for i = 1, #g_status[STATUS.ACTIVE_ITEM] do
			if g_status[STATUS.ACTIVE_ITEM][i].itemInfo.type == itemType then
				return g_status[STATUS.ACTIVE_ITEM][i]
			end
		end
	end


	-- 使用するバフアイテムを取得する関数
	-- アイテム名のテーブルから使用するバフアイテムを取得する
	-- テーブルの前の方のアイテムが優先的に使用される
	-- 効果の低いアイテムが発動中であっても使用される
	----------------------------------------------------------------------------------------------------
	local function getUseBuffItem( itemNameTable )

		for i = 1, #itemNameTable do

			-- アイテム情報を保持
			local itemInfo = g_itemInfo[itemNameTable[i]]

			-- アイテムを所持している場合
			if getItemCount(itemInfo.name) > 0 then

				-- 同一タイプの発動アイテムを取得
				local activeItem = getActiveItem( itemInfo.type )

				-- アイテムが発動していないか発動しているアイテムの効果が低い場合
				if activeItem == nil or activeItem.itemInfo.param < itemInfo.param then

					-- アイテム情報を返す
					return itemInfo
				end
			end
		end
	end


	-- レース出走時に実行する行動を取得する関数
	-- レース情報を引数に渡す
	-- レース出走前にスキルの確認やアイテムを使用したい場合は先に実行する行動を返すようにする
	-- レース出走処理が多岐にわたり複数存在するためこの関数を呼び出して処理を行う
	----------------------------------------------------------------------------------------------------
	local function getRaceAction( raceInfo )

		-- スキルを確認するかどうかを判定
		----------------------------------------------------------------------------------------------------
		-- まだにスキルを確認していない場合
		if actionInfo.actionTable[ACTION.CHECK_SKILL] == nil then

			-- CONFIG.CHECK_SKILL_SEASONが設定されているかつCONFIG.CHECK_SKILL_SEASONの時期以降の場合
			if CONFIG.CHECK_SKILL_SEASON and g_status[STATUS.SEASON].index >= CONFIG.CHECK_SKILL_SEASON.index then

				-- スキルポイントがCONFIG.KEEP_SKILLPT以上の場合
				if g_status[STATUS.SKILLPT] >= CONFIG.KEEP_SKILLPT then

					-- スキルの確認を実行する
					return ACTION.CHECK_SKILL
				end
			end
		end


		-- バフアイテムを使用する処理
		-- バフアイテムを温存したい場合はここに条件を追加する
		----------------------------------------------------------------------------------------------------
		-- レースが指定されていない（レース本番）かレースのグレードがG1以上の場合
		if raceInfo == nil or raceInfo.grade.index >= GRADE.G1.index then

			-- 使用するバフアイテムをgetUseBuffItem関数で取得
			local buffItem

			-- クライマックス開催中の場合
			if g_status[STATUS.SEASON].index == SEASON.CLIMAX.index then

				-- 全てのバフアイテムを使用する
				buffItem = getUseBuffItem( {ITEM.HAMMER2, ITEM.HAMMER1, ITEM.PENLIGHT} )

			-- クライマックス開催中ではない場合
			else

				-- 蹄鉄ハンマーの合計が3つ以下の場合
				if getItemCount(ITEM.HAMMER1) + getItemCount(ITEM.HAMMER2) <= 3 then

					-- 蹄鉄ハンマーは除外する
					buffItem = getUseBuffItem( {ITEM.PENLIGHT} )

				-- 蹄鉄ハンマー・極が3つ以下の場合
				elseif getItemCount(ITEM.HAMMER2) <= 3 then

					-- 蹄鉄ハンマー・極は除外する
					buffItem = getUseBuffItem( {ITEM.HAMMER1, ITEM.PENLIGHT} )

				-- 条件に当てはまらない場合
				else

					-- 全てのバフアイテムを使用する
					buffItem = getUseBuffItem( {ITEM.HAMMER2, ITEM.HAMMER1, ITEM.PENLIGHT} )
				end
			end

			-- アイテム情報が返ってきた場合
			if buffItem then

				-- アイテムの使用を実行する
				return ACTION.USE_ITEM, buffItem
			end
		end


		-- レースに出走する処理
		-- 前処理が終わったのでレース出走を実行する
		----------------------------------------------------------------------------------------------------
		-- 引数で渡されたレースに出走する
		return ACTION.RACE, raceInfo
	end


	-- レース本番の処理
	-- レース本番ではスキルの確認かアイテムの使用かレース出走のみ実行可能
	----------------------------------------------------------------------------------------------------
	-- レース本番の場合
	if g_status[STATUS.TURN] == 0 then

		-- getRaceAction関数でレース出走時に実行する行動を取得する
		return getRaceAction()
	end


	-- 予約レース開催中のポップアップが表示された場合の処理
	-- ポップアップが表示された場合はg_status[STATUS.RESERVED_RACE]に予約レースのレース情報が入っている
	----------------------------------------------------------------------------------------------------
	-- 予約レースのレース情報が入っている場合
	if g_status[STATUS.RESERVED_RACE] then

		-- getRaceAction関数でレース出走時に実行する行動を取得する
		return getRaceAction( g_status[STATUS.RESERVED_RACE] )
	end


	-- 出走可能なレースのスコア算出
	-- レース本番ではない場合出走可能なレース確認を行いactionInfo.raceScoreTableにスコアを代入する
	----------------------------------------------------------------------------------------------------
	-- まだレースを確認していない場合
	if actionInfo.actionTable[ACTION.CHECK_RACE] == nil then

		-- ライバルが出走する場合
		if g_status[STATUS.RIVAL] then

			-- CONFIG.CHECK_RIVALの設定がtrueの場合
			if CONFIG.CHECK_RIVAL then

				-- レース一覧を開いてレース確認
				return ACTION.CHECK_RACE, true
			end
		end

		-- レース確認
		return ACTION.CHECK_RACE
	end


	-- CONFIG.RUN_RACEで設定されている強制出走レースを処理
	----------------------------------------------------------------------------------------------------
	-- CONFIG.RUN_RACEで設定されているレースを確認
	for i = 1, #CONFIG.RUN_RACE do

		-- レース名が空じゃない場合
		if CONFIG.RUN_RACE[i].name ~= "" then

			-- 時期名が指定されていないか現在の時期名と部分一致する場合
			if CONFIG.RUN_RACE[i].seasonName == nil or CONFIG.RUN_RACE[i].seasonName == "" or g_status[STATUS.SEASON].name:find(CONFIG.RUN_RACE[i].seasonName) then

				-- 出走可能なレースを確認
				for j = 1, #actionInfo.raceScoreTable do

					-- CONFIG.RUN_RACEで設定されているレースとレース名が一致する場合
					if CONFIG.RUN_RACE[i].name == actionInfo.raceScoreTable[j].raceInfo.name then

						-- getRaceAction関数でレース出走時に実行する行動を取得する
						return getRaceAction( actionInfo.raceScoreTable[j].raceInfo )
					end
				end
			end
		end
	end


	-- ファン数不足等の理由でレース出走のポップアップが表示された場合の処理
	-- ゲームオーバーにならないように優先的にレースへ出走するようにしている
	----------------------------------------------------------------------------------------------------
	-- ポップアップが表示された場合または未勝利クラスかつ目標まで5ターン以内の場合
	if g_status[STATUS.POPUP_RACE] or (g_status[STATUS.CLASS] == CLASS.MAIDEN and g_status[STATUS.TURN] <= 5) then

		-- 未勝利クラスの場合レース出走
		-- 未勝利戦は一番上のレースが選ばれるのでオプションのレースおすすめ機能で『センターポジション重視コース』か『各ウマ娘への道コース』に設定しておく必要がある
		if g_status[STATUS.CLASS] == CLASS.MAIDEN then

			-- getRaceAction関数でレース出走時に実行する行動を取得する
			return getRaceAction()

		-- 3回連続出走にならない場合、または目標まで残り3ターン以内の場合
		elseif g_status[STATUS.RACE_CONSECUTIVE_COUNT] < 2 or g_status[STATUS.TURN] <= 3 then

			-- スコアテーブルが空ではない場合
			if #actionInfo.raceScoreTable > 0 then

				-- 最高スコアのレースを保持
				local raceInfo = actionInfo.raceScoreTable[1].raceInfo

				-- 最高スコアのレースのバ場適性と距離適性がB以上か目標まで残り2ターン以内の場合レース出走
				if (g_status[STATUS.TRACK][raceInfo.track].index >= RANK.B.index and g_status[STATUS.DISTANCE][raceInfo.distance].index >= RANK.B.index) or g_status[STATUS.TURN] <= 2 then

					-- getRaceAction関数でレース出走時に実行する行動を取得する
					return getRaceAction( raceInfo )
				end
			end
		end
	end


	-- 最終ターンかどうかを判定する関数
	----------------------------------------------------------------------------------------------------
	local function isFinalTurn()

		-- 時期がURAファイナルズかつ時期インデックスが5以上の場合は最終ターン
		if g_status[STATUS.SEASON].index == SEASON.FINALS.index and g_status[STATUS.SEASON_INDEX] >= 5 then
			return true
		end

		-- 時期がクライマックスかつ時期インデックスが5以上の場合は最終ターン
		if g_status[STATUS.SEASON].index == SEASON.CLIMAX.index and g_status[STATUS.SEASON_INDEX] >= 5 then
			return true
		end

		return false
	end


	-- 夏合宿中かどうかを判定する関数
	----------------------------------------------------------------------------------------------------
	local function isSummerCamp()

		-- クラシック級
		if g_status[STATUS.SEASON].index >= SEASON.CLASSIC_7A.index and g_status[STATUS.SEASON].index <= SEASON.CLASSIC_8B.index then
			return true

		-- シニア級
		elseif g_status[STATUS.SEASON].index >= SEASON.SENIOR_7A.index and g_status[STATUS.SEASON].index <= SEASON.SENIOR_8B.index then
			return true
		end

		return false
	end


	-- 夏合宿直前かどうかを判定する関数
	----------------------------------------------------------------------------------------------------
	local function isJustBeforeSummerCamp()

		-- クラシック級6月後半の場合
		if g_status[STATUS.SEASON].index == SEASON.CLASSIC_6B.index then
			return true

		-- クラシック級6月後半にレース本番が割り込む場合
		elseif g_status[STATUS.SEASON].index == SEASON.CLASSIC_6A.index and g_status[STATUS.TURN] == 1 then
			return true

		-- シニア級6月後半の場合
		elseif g_status[STATUS.SEASON].index == SEASON.SENIOR_6B.index then
			return true

		-- シニア級6月後半にレース本番が割り込む場合
		elseif g_status[STATUS.SEASON].index == SEASON.SENIOR_6A.index and g_status[STATUS.TURN] == 1 then
			return true
		end

		return false
	end


	-- ステータスを回復する行動を取得する関数
	-- 友人とお出かけを利用して回復したい場合やアイテムを使用して回復したい場合に処理を追加する
	----------------------------------------------------------------------------------------------------
	local function getRecoverAction( statusName )

		-- 体力の場合
		if statusName == STATUS.HP then

			-- 回復アイテムを使用する処理
			----------------------------------------------------------------------------------------------------
			-- アイテムを使用して回復可能か確認
			local itemNameTable =
			{
				ITEM.JUICE,
				ITEM.VITAL3,
				ITEM.VITAL2,
				ITEM.VITAL1,
			}
			for i = 1, #itemNameTable do

				-- アイテムを所持している場合
				if getItemCount(itemNameTable[i]) > 0 then

					-- 体力がアイテムの回復量-10以上減っている場合
					if g_status[STATUS.MAXHP] - g_status[STATUS.HP] >= g_itemInfo[itemNameTable[i]].param - 10 then

						-- アイテムを使用
						return ACTION.USE_ITEM, g_itemInfo[itemNameTable[i]]
					end
				end
			end

			for i = 1, #itemNameTable do

				-- アイテムを所持している場合
				if getItemCount(itemNameTable[i]) > 0 then

					-- 夏合宿中かシニア級の10月以降の場合
					if isSummerCamp() or g_status[STATUS.SEASON].index >= SEASON.SENIOR_10A.index then

						-- アイテムを使用
						return ACTION.USE_ITEM, g_itemInfo[itemNameTable[i]]
					end
				end
			end

			-- 友人とお出かけを利用する処理
			----------------------------------------------------------------------------------------------------
			-- 友人とお出かけ可能な場合
			if g_status[STATUS.FRIEND] then

				-- 友人とお出かけ
				-- 2つ目の戻り値にお出かけするキャラクター名を指定することが可能（指定した友人が存在しない場合は上から順番に選ばれる）
				-- 例：return ACTION.FRIEND, "駿川たづな"
				-- グループタイプの場合はグループに所属しているメンバーの名前を指定する
				-- 例：return ACTION.FRIEND, "スペシャルウィーク"
				return ACTION.FRIEND
			end

			-- お休み
			return ACTION.DAY_OFF

		-- やる気の場合
		elseif statusName == STATUS.MOTIVATION then

			-- 回復アイテムを使用する処理
			----------------------------------------------------------------------------------------------------
			-- アイテムを使用して回復可能か確認
			local itemNameTable =
			{
				ITEM.CAKE2,
				ITEM.CAKE1,
			}
			for i = 1, #itemNameTable do

				-- アイテムを所持している場合
				if getItemCount(itemNameTable[i]) > 0 then

					-- アイテムを使用
					return ACTION.USE_ITEM, g_itemInfo[itemNameTable[i]]
				end
			end

			-- お出かけ
			return ACTION.GO_OUT

		-- コンディションの場合
		elseif statusName == STATUS.CONDITION then

			-- 引数として渡したコンディション名が存在するどうかを判定する関数
			----------------------------------------------------------------------------------------------------
			local function hasCondition( conditionName )
				for i = 1, #g_status[STATUS.CONDITION] do
					if g_status[STATUS.CONDITION][i].name == conditionName then
						return true
					end
				end
				return false
			end


			-- 能力詳細を確認する処理
			-- コンディションは能力詳細を確認しないと不明なのでクライマックスシナリオの場合は確認しておく
			----------------------------------------------------------------------------------------------------
			-- クライマックスシナリオの場合
			if g_status[STATUS.SCENARIO] == SCENARIO.CLIMAX then

				-- まだ能力詳細を確認していない場合
				if actionInfo.actionTable[ACTION.CHECK_DETAIL_STATUS] == nil then

					-- 能力詳細を確認
					return ACTION.CHECK_DETAIL_STATUS
				end
			end


			-- 回復アイテムを使用する処理
			----------------------------------------------------------------------------------------------------
			-- アイテムを使用して回復可能か確認
			local itemNameTable =
			{
				ITEM.CONDITION_FUTORIGIMI,
				ITEM.CONDITION_HENZUTSU,
				ITEM.CONDITION_RENSHUBETA,
				ITEM.CONDITION_NAMAKEGUSE,
				ITEM.CONDITION_YOFUKASHIGIMI,
				ITEM.CONDITION_HADAARE,
			}
			for i = 1, #itemNameTable do

				-- アイテムを所持している場合
				if getItemCount(itemNameTable[i]) > 0 then

					-- アイテムのパラメータに設定されているコンディションが存在するかをhasCondition関数で判定
					if hasCondition(g_itemInfo[itemNameTable[i]].param) then

						-- アイテムを使用
						return ACTION.USE_ITEM, g_itemInfo[itemNameTable[i]]
					end
				end
			end

			-- ナンデモナオールを所持している場合
			if getItemCount(ITEM.CONDITION_ALL_BAD) > 0 then

				-- ナンデモナオールを使用
				return ACTION.USE_ITEM, g_itemInfo[ITEM.CONDITION_ALL_BAD]
			end

			-- 保健室
			return ACTION.INFIRMARY
		end
	end


	-- トレーニングを確認する前の処理
	----------------------------------------------------------------------------------------------------
	if actionInfo.actionTable[ACTION.CHECK_TRAINING] == nil then

		-- 確認するトレーニング名のテーブル
		local trainingNameTable =
		{
			STATUS.SPEED,
			STATUS.STAMINA,
			STATUS.POWER,
			STATUS.GUTS,
			STATUS.INT,
		}


		-- 最終ターンの処理
		-- 最終ターンの場合はリスクを覚悟してトレーニングを行う
		----------------------------------------------------------------------------------------------------
		-- 最終ターンの場合
		if isFinalTurn() then

			-- トレーニング確認
			return ACTION.CHECK_TRAINING, trainingNameTable


		-- コンディション（バステ）の回復処理
		----------------------------------------------------------------------------------------------------
		-- 保健室が利用可能の場合
		elseif g_status[STATUS.INFIRMARY] then

			-- getRecoverAction関数でコンディション（バステ）を回復する行動を取得
			return getRecoverAction( STATUS.CONDITION )


		-- やる気の回復処理
		----------------------------------------------------------------------------------------------------
		-- やる気が不調以下の場合
		elseif g_status[STATUS.MOTIVATION].index <= MOTIVATION.BAD.index then

			-- getRecoverAction関数でやる気を回復する行動を取得
			return getRecoverAction( STATUS.MOTIVATION )

		-- クラシック級以降やる気が普通以下の場合
		elseif g_status[STATUS.SEASON].index >= SEASON.CLASSIC_1A.index and g_status[STATUS.MOTIVATION].index <= MOTIVATION.NORMAL.index then

			-- getRecoverAction関数でやる気を回復する行動を取得
			return getRecoverAction( STATUS.MOTIVATION )


		-- 夏合宿前の体力調整処理
		-- 夏合宿に入る前に体力を回復するようにする
		----------------------------------------------------------------------------------------------------
		-- 夏合宿前の場合
		elseif isJustBeforeSummerCamp() then

			-- 体力が80以下の場合
			if g_status[STATUS.HP] <= 80 then

				-- getRecoverAction関数で体力を回復する行動を取得
				return getRecoverAction( STATUS.HP )

			-- 体力が80以上の場合
			else

				-- 賢さのトレーニングを行う
				-- 賢さのトレーニングが行えない可能性もあるのでトレーニングの確認を行う
				return ACTION.CHECK_TRAINING, trainingNameTable
			end

		-- 条件に当てはまらない場合
		else

			-- トレーニングを確認
			return ACTION.CHECK_TRAINING, trainingNameTable
		end


	-- トレーニングを確認した後の処理
	----------------------------------------------------------------------------------------------------
	else

		-- 各トレーニングのスコアから最高スコアのトレーニングを行うかどうかの目安となる評価点を算出する
		-- トレーニングの最高スコアと2番目のスコアを比較して簡易的に求めている
		----------------------------------------------------------------------------------------------------
		local trainingEvaluation = 0

		-- 選択可能なトレーニングが複数ある場合
		if #actionInfo.trainingScoreTable > 1 then

			-- トレーニングの評価点を算出
			-- 最高スコアと2番目のスコアが等倍の場合は0点、2倍の場合は100点、3倍の場合は200点になる
			trainingEvaluation = (actionInfo.trainingScoreTable[1].score / actionInfo.trainingScoreTable[2].score - 1) * 100
		end

		-- 最高スコアのトレーニングに対応するステータス上昇値を加点
		trainingEvaluation = trainingEvaluation + actionInfo.trainingScoreTable[1].addStatus[actionInfo.trainingScoreTable[1].name]


		-- 夏合宿前の体力調整処理
		-- 夏合宿に入る前に体力を回復するようにする
		-- 体力が80以下の場合はトレーニングを確認する前の処理で体力を回復する行動が実行されている
		----------------------------------------------------------------------------------------------------
		-- 夏合宿前の場合
		if isJustBeforeSummerCamp() then

			-- トレーニング制限で選択可能なトレーニングが1つのみの場合
			if #actionInfo.trainingScoreTable == 1 then

				-- 選択可能なトレーニングが賢さ以外の場合
				if actionInfo.trainingScoreTable[1].name ~= STATUS.INT then

					-- getRecoverAction関数で体力を回復する行動を取得
					return getRecoverAction( STATUS.HP )
				end
			end

			-- 賢さのトレーニングを行う
			return ACTION.TRAINING, STATUS.INT
		end


		-- 目標レース以外のレースへの出走処理
		-- レースの優先度とトレーニングの評価点を比較してレースに出走するかを判断する
		----------------------------------------------------------------------------------------------------
		-- 夏合宿中ではない場合
		if not isSummerCamp() then

			-- 3回連続出走にならない場合
			if g_status[STATUS.RACE_CONSECUTIVE_COUNT] < 2 then

				-- スコアテーブルが空ではない場合
				if #actionInfo.raceScoreTable > 0 then

					-- 最高スコアのレースを保持
					local raceInfo = actionInfo.raceScoreTable[1].raceInfo

					-- 最高スコアのレースのグレードを育成キャラに設定しているレース出走条件と比較
					if raceInfo.grade.index >= g_characterInfo[g_status[STATUS.NAME]].raceGrade.index then

						-- 最高スコアのレースのバ場適性と距離適性がA以上の場合
						if g_status[STATUS.TRACK][raceInfo.track].index >= RANK.A.index and g_status[STATUS.DISTANCE][raceInfo.distance].index >= RANK.A.index then

							-- 育成キャラに設定しているレース出走優先度を取得
							local racePriority = g_characterInfo[g_status[STATUS.NAME]].racePriority

							-- 最高スコアのレースの優先度による補正
							racePriority = racePriority * raceInfo.priority / 100

							-- トレーニング評価点とレース出走優先度を比較して最終判断
							if trainingEvaluation < racePriority then

								-- getRaceAction関数でレース出走時に実行する行動を取得する
								return getRaceAction( raceInfo )
							end
						end
					end
				end
			end
		end


		-- 健康祈願のお守りを使用するかどうかを判定する関数
		----------------------------------------------------------------------------------------------------
		local function isUseOmamori()

			-- 健康祈願のお守りを持っていない場合
			if getItemCount(ITEM.OMAMORI) == 0 then

				-- 使用しない
				return false
			end

			-- 体力が50より多い場合
			if g_status[STATUS.HP] > 50 then

				-- 使用しない
				return false
			end

			-- 最高スコアのトレーニングの失敗率が0%の場合
			if actionInfo.trainingScoreTable[1].failureRate == 0 then

				-- 使用しない
				return false
			end

			-- アイテムで回復できる体力の合計を算出
			local totalRecoverHp = 0
			local itemNameTable =
			{
				ITEM.JUICE,
				ITEM.VITAL3,
				ITEM.VITAL2,
				ITEM.VITAL1,
			}
			for i = 1, #itemNameTable do
				totalRecoverHp = totalRecoverHp + getItemCount(itemNameTable[i]) * g_itemInfo[itemNameTable[i]].param
			end

			-- 夏合宿またはシニア級の夏合宿以降の場合
			if isSummerCamp() or g_status[STATUS.SEASON].index >= SEASON.SENIOR_7A.index then

				-- アイテムで回復できない場合
				if totalRecoverHp == 0 then

					-- 使用する
					return true
				end
			end

			-- 体力が0の場合
			if g_status[STATUS.HP] == 0 then

				-- 使用する
				return true
			end

			-- 体力が健康祈願のお守りの数*30以下の場合
			if g_status[STATUS.HP] <= getItemCount(ITEM.OMAMORI) * 30 then

				-- アイテムで回復できる体力の合計が50以上の場合
				if totalRecoverHp >= 50 then

					-- 使用する
					return true
				end
			end

			-- 条件に当てはまらない場合は使用しない
			return false
		end


		-- 健康祈願のお守りを使用する処理
		----------------------------------------------------------------------------------------------------
		-- isUseOmamori関数で健康祈願のお守りを使用するかを判定
		if isUseOmamori() then

			-- 使用するバフアイテムをgetUseBuffItem関数で取得
			local buffItem = getUseBuffItem( {ITEM.OMAMORI} )

			-- アイテム情報が返ってきた場合
			if buffItem then

				-- アイテムの使用を実行する
				return ACTION.USE_ITEM, buffItem
			end
		end


		-- 体力の回復処理
		-- この部分の条件を変更することによって失敗するリスクを覚悟してトレーニングを行う事が可能
		----------------------------------------------------------------------------------------------------
		-- 健康祈願のお守りが発動していない場合
		if getActiveItem(ITEM_TYPE.OMAMORI) == nil then

			-- 最終ターンではないか回復アイテムを所持している場合
			if not isFinalTurn() or
				getItemCount(ITEM.JUICE) > 0 or
				getItemCount(ITEM.VITAL3) > 0 or
				getItemCount(ITEM.VITAL2) > 0 or
				getItemCount(ITEM.VITAL1) > 0 then

				-- 体力が50以下かつ最高スコアのトレーニングの失敗率が1%以上の場合
				if g_status[STATUS.HP] <= 50 and actionInfo.trainingScoreTable[1].failureRate > 0 then

					-- getRecoverAction関数で体力を回復する行動を取得
					return getRecoverAction( STATUS.HP )
				end
			end
		end


		-- リセットホイッスルを使用する処理
		----------------------------------------------------------------------------------------------------
		-- 夏合宿またはクライマックス開催中の場合
		if isSummerCamp() or g_status[STATUS.SEASON].index == SEASON.CLIMAX.index then

			-- トレーニングの評価点が50以下の場合
			if trainingEvaluation < 50 then

				-- リセットホイッスルを所持している場合
				if getItemCount(ITEM.WHISTLE) > 0 then

					-- トレーニングの確認を再度行うためにactionTableのフラグをリセット
					actionInfo.actionTable[ACTION.CHECK_TRAINING] = nil

					-- リセットホイッスルを使用
					return ACTION.USE_ITEM, g_itemInfo[ITEM.WHISTLE]
				end
			end
		end


		-- バフアイテムを使用する処理
		-- バフアイテムを温存したい場合はここに条件を追加する
		----------------------------------------------------------------------------------------------------
		-- バフアイテムを使用するトレーニング評価のボーダー
		local borderTrainingEvaluation = 0

		-- 夏合宿中かクライマックス開催中の場合
		if isSummerCamp() or g_status[STATUS.SEASON].index == SEASON.CLIMAX.index then

			-- 0点をボーダーにして必ず使用するようにする
			borderTrainingEvaluation = 0

		-- ジュニア級の場合
		elseif g_status[STATUS.SEASON].index <= SEASON.JUNIOR_12B.index then

			-- 1000点をボーダーにして使用しないようにする
			borderTrainingEvaluation = 1000

		-- クラシック級の場合
		elseif g_status[STATUS.SEASON].index <= SEASON.CLASSIC_12B.index then

			-- 100点をボーダーにする
			borderTrainingEvaluation = 100

		-- シニア級の場合
		else

			-- 50点をボーダーにする
			borderTrainingEvaluation = 50

		end

		-- トレーニングの評価点がボーダー以上の場合
		if trainingEvaluation >= borderTrainingEvaluation then

			-- 各メガホンをアイテム名テーブルに代入
			local itemNameTable =
			{
				ITEM.MEGAPHONE3,
				ITEM.MEGAPHONE2,
				ITEM.MEGAPHONE1,
			}

			-- トレーニングの最高スコアに対応したアンクルウェイトをテーブルに追加
			local ankleWeightNameTable =
			{
				ITEM.ANKLE_WEIGHT_SPEED,
				ITEM.ANKLE_WEIGHT_STAMINA,
				ITEM.ANKLE_WEIGHT_POWER,
				ITEM.ANKLE_WEIGHT_GUTS,
			}
			for i = 1, #ankleWeightNameTable do 
				if actionInfo.trainingScoreTable[1].name == g_itemInfo[ankleWeightNameTable[i]].param then
					table.insert( itemNameTable, ankleWeightNameTable[i] )
					break
				end
			end

			-- 使用するバフアイテムをgetUseBuffItem関数で取得
			local buffItem = getUseBuffItem( itemNameTable )

			-- アイテム情報が返ってきた場合
			if buffItem then

				-- アイテムの使用を実行する
				return ACTION.USE_ITEM, buffItem
			end
		end


		-- トレーニングを行う処理
		-- 前処理が終わったのでトレーニングを実行する
		----------------------------------------------------------------------------------------------------
		-- トレーニングの評価点をログに出力する
		print( "トレーニング評価：" .. math.floor(trainingEvaluation) .. "点" )

		-- 最高スコアのトレーニングを行う
		return ACTION.TRAINING, actionInfo.trainingScoreTable[1].name
	end
end


----------------------------------------------------------------------------------------------------
-- getSelectChoice関数
-- 選択する選択肢を取得
-- 選択肢の採点を行った後、選択肢を選択する時に呼び出される
-- 通常は最高スコアの選択肢を選択する処理を行えば良いが、あんし～ん笹針師のイベント等で条件分岐させたい場合に利用する
-- あんし～ん笹針師はデフォルトの採点方法だと『元気で健康になれる秘孔を狙う』が最高スコアになって選択される
----------------------------------------------------------------------------------------------------
-- 引数：choiceScoreTable
--   選択肢のスコアテーブル
--   スコアの高い順にソートされている
--     name   選択肢
--     score  スコア
--     index  選択肢の位置（上から順番に1,2,3...が入っている）
--   例：choiceScoreTable[1].nameで最高スコアの選択肢を参照できる
-- 引数：eventInfo
--   データベースに登録されているイベント情報が入っている
--   イベント名を参照したい場合は eventInfo.name のように記述する
-- 引数：characterName
--   キャラクター共通イベントの場合はeventInfo.characterNameが"-"となっているのでこちらの引数でキャラクター名を判別する
-- 引数：eventProgress
--   連続イベントの場合イベント進行度が入っている
--   連続イベントではない場合常に1になる
-- 引数：eventProgressMax
--   連続イベントの場合イベント進行度の最大値（連続イベント数）が入っている
--   連続イベントではない場合常に1になる
-- 戻り値
--   選択する選択肢
----------------------------------------------------------------------------------------------------
function getSelectChoice( choiceScoreTable, eventInfo, characterName, eventProgress, eventProgressMax )

	-- あんし～ん笹針師、参☆上のイベントを条件分岐させたい場合は以下のように記述する
--[[
	if eventInfo.name == "あんし～ん笹針師、参☆上" then
		if choiceScoreTable[1].name == "はい" or choiceScoreTable[1].name == "やめておく" then
			return choiceScoreTable[1].name
		end
		if 条件 then
			return "強いウマ娘になれる秘孔を狙う"
		elseif 条件 then
			return "レースで勝てる秘孔を狙う"
		elseif 条件 then
			return "元気で健康になれる秘孔を狙う"
		elseif 条件 then
			return "魅力アップの秘孔を狙う"
		else
			return "不安なのでやめておく"
		end
	end
]]


	return choiceScoreTable[1].name

end


----------------------------------------------------------------------------------------------------
-- getAcquireSkill関数
-- 習得するスキルを取得
-- スキルの採点を行った後、習得するスキルを選択する時に呼び出される
-- 習得するスキルに条件をつけたい場合に利用する
-- スキルの習得をせずに確認のみを行いたい場合はgetAction関数でACTION.CHECK_SKILLを返しこの関数で戻り値を返さないようにする
----------------------------------------------------------------------------------------------------
-- 引数：skillScoreTable
--   習得可能なスキルのスコアテーブル
--   スコアの高い順にソートされている
--     skillInfo  スキル情報
--     skillPoint 必要スキルポイント
--     hintLevel  ヒントレベル
--     score      スコア
--   例：skillScoreTable[1].skillInfo.nameで最高スコアのスキル名を参照できる
-- 戻り値
--   習得するスキル情報
--   戻り値を返さない場合はスキルを習得しない（スキル習得処理はそこで確定する）
----------------------------------------------------------------------------------------------------
function getAcquireSkill( skillScoreTable )

	-- 育成完了時ではない場合
	if g_status[STATUS.COMPLETE] == false then

		-- スキルポイントがCONFIG.KEEP_SKILLPT以上の場合
		if g_status[STATUS.SKILLPT] >= CONFIG.KEEP_SKILLPT then

			-- 最高スコアが100以上の場合
			if skillScoreTable[1].score >= 100 then

				-- 最高スコアのスキルを習得
				return skillScoreTable[1].skillInfo
			end
		end

	-- 育成完了時の場合
	else

		-- 最高スコアのスキルを習得
		return skillScoreTable[1].skillInfo

	end

	-- 戻り値を返さない場合はスキルを習得しない
end


----------------------------------------------------------------------------------------------------
-- getBuyItem関数
-- 購入するアイテムを取得
-- アイテムの採点を行った後、購入するアイテムを選択する時に呼び出される
-- 購入するアイテムに条件をつけたい場合に利用する
----------------------------------------------------------------------------------------------------
-- 引数：itemScoreTable
--   購入可能なアイテムのスコアテーブル
--   スコアの高い順にソートされている
--   コイン不足等により交換できないアイテムもテーブルに含まれる（採点はされないのでスコアがnilになる）
--     itemInfo  アイテム情報
--     coin      購入に必要なコイン
--     count     アイテムの所持数
--     sale      アイテムがセール中か
--     turn      購入可能な残りターン数
--     score     スコア
--   例：itemScoreTable[1].itemInfo.nameで最高スコアのアイテム名を参照できる
-- 戻り値
--   購入するアイテムのスコア情報
--   テーブルに同一のアイテムが存在する場合があるのでスコア情報を戻り値として返す
--   戻り値を返さない場合はアイテムを購入しない（アイテム購入処理はそこで終了する）
--   2つ目の戻り値にtrueを指定すると購入後に即使用する
----------------------------------------------------------------------------------------------------
function getBuyItem( itemScoreTable )

	-- 最高スコアが100以上の場合
	if itemScoreTable[1].score and itemScoreTable[1].score >= 100 then

		-- 最高スコアのアイテム情報を保持
		local itemInfo = itemScoreTable[1].itemInfo

		-- 最大体力上昇、ステータス上昇、絆ゲージ上昇、トレーニングレベル上昇、グッドコンディション付与アイテムは即使用する
		if itemInfo.type == ITEM_TYPE.MAXHP or
			itemInfo.type == ITEM_TYPE.SPEED or
			itemInfo.type == ITEM_TYPE.STAMINA or
			itemInfo.type == ITEM_TYPE.POWER or
			itemInfo.type == ITEM_TYPE.GUTS or
			itemInfo.type == ITEM_TYPE.INT or
			itemInfo.type == ITEM_TYPE.KIZUNA or
			itemInfo.type == ITEM_TYPE.TRAINING_LEVEL or
			itemInfo.type == ITEM_TYPE.GOOD_CONDITION then
			return itemScoreTable[1], true
		end

		-- その他のアイテムは購入のみ行う
		return itemScoreTable[1]
	end

	-- 戻り値を返さない場合はアイテムを購入しない
end


----------------------------------------------------------------------------------------------------
-- isCheckContinue関数
-- コンティニューを確認するか？
-- クライマックスシナリオのレース出走後コンテニュー可能時に呼び出される
-- レースの順位は認識されておりg_status[STATUS.RACE_RANKING]で参照できる（出走数や勝利数はまだカウントされていない）
-- コンティニューの確認を行うと目覚まし時計の数と1日1回消費なしかどうかを認識後isContinue関数が呼び出される
-- 時短の為に確認しないようにすることが可能
----------------------------------------------------------------------------------------------------
-- 戻り値
--   true  確認する
--   false 確認しない
----------------------------------------------------------------------------------------------------
function isCheckContinue()

	-- 基本設定でコンティニューの利用をしない設定にしている場合は確認しない
	if CONFIG.CONTINUE == false then
		return false
	end

	return true
end


----------------------------------------------------------------------------------------------------
-- isContinue関数
-- コンティニューするか？
-- レースでコンテニューのポップアップが表示された時に呼び出される
----------------------------------------------------------------------------------------------------
-- 引数：isFree
--   目覚まし時計が1日1回消費なしか
--   true   消費なし
--   false  消費あり
-- 引数：clockCount
--   目覚まし時計の所持数
--   1日1回消費なしの場合（isFreeがtrueの場合）は何も入っていない（nilになる）
-- 戻り値
--   true  コンティニューする
--   false コンティニューしない
----------------------------------------------------------------------------------------------------
function isContinue( isFree, clockCount )

	-- 基本設定でコンティニューの利用をしない設定にしている場合はコンティニューしない
	if CONFIG.CONTINUE == false then

		return false

	-- 目覚まし時計の数が0の場合はコンティニューしない
	elseif clockCount == 0 then

		return false

	else

		-- クライマックスシナリオの場合
		if g_status[STATUS.SCENARIO] == SCENARIO.CLIMAX then

			-- 1日1回消費なしの場合はコンティニュー
			if isFree then
				return true
			end

		-- クライマックスシナリオ以外の場合
		else

			-- コンティニュー回数も加味して勝率の算出
			local winRate = 0
			local raceCount = g_status[STATUS.RACE_COUNT] + g_status[STATUS.CONTINUE_COUNT]
			if raceCount > 0 then
				winRate = (g_status[STATUS.RACE_WIN_COUNT] * 100) / raceCount
			end


			-- 勝率が70%以上かつ出走数が3回以上の場合はコンティニュー
			if winRate >= 70 and g_status[STATUS.RACE_COUNT] >= 3 then

				return true

			-- シニア級の場合は勝率50%以上でコンティニュー
			elseif winRate >= 50 and g_status[STATUS.SEASON].index >= SEASON.SENIOR_1A.index then

				return true

			-- URAファイナルズの場合はコンティニュー
			elseif g_status[STATUS.SEASON].index == SEASON.FINALS.index then

				return true

			end
		end
	end


	-- 条件に当てはまらない場合はコンテニューしない
	return false
end


----------------------------------------------------------------------------------------------------
-- isSetFavorite関数
-- お気に入りに設定するか？
-- 育成完了後のウマ娘詳細画面が表示された時に呼び出される
----------------------------------------------------------------------------------------------------
-- 戻り値
--   true  お気に入りに設定する
--   false お気に入りに設定しない
----------------------------------------------------------------------------------------------------
function isSetFavorite()

	-- 青因子★3が出たときにお気に入りに設定したい場合は以下のように記述する
--[[
	for i = 1, #g_status[STATUS.FACTOR] do
		if g_status[STATUS.FACTOR][i].factorInfo.type == FACTOR.STATUS and g_status[STATUS.FACTOR][i].star == 3 then
			return true
		end
	end
]]

	return false

end


----------------------------------------------------------------------------------------------------
-- isRegisterHallOfFame関数
-- 殿堂入りウマ娘に登録するか？
-- 育成完了後の獲得アイテム画面表示後に呼び出される
-- 殿堂入りウマ娘に登録しない場合はスクリーンショットも自動的に削除される
----------------------------------------------------------------------------------------------------
-- 戻り値
--   true  殿堂入りウマ娘に登録する
--   false 殿堂入りウマ娘に登録しない
----------------------------------------------------------------------------------------------------
function isRegisterHallOfFame()

	-- 評価点が10000より低い時に殿堂入りウマ娘に登録したくない場合は以下のように記述する
--[[
	if g_status[STATUS.EVALUATION] < 10000 then
		return false
	end
]]

	return true

end


----------------------------------------------------------------------------------------------------
-- getHomeAction関数
-- ホーム画面で実行する行動の取得
-- ホーム画面になった時に呼び出される
----------------------------------------------------------------------------------------------------
-- 引数：homeInfo
--     tp                 現在のTP
--     rp                 現在のRP
--     trainingCount      残り周回数（初期値はCONFIG.AUTO_MODE.TRAINING_COUNTになる）
--     rentalCount        残りレンタル回数（初回は認識されていないのでnilになる）
--     selectCarnivalRace レーシングカーニバルで出走するカーニバルレース（初期値はCONFIG.RACING_CARNIVAL.SELECT_CARNIVAL_RACEになる）
--     errorRental        継承ウマ娘選択時に残りレンタル回数が0の状態でレンタルしようとした場合にtrueがセットされてホーム画面へ戻る
--     errorInheritance   継承ウマ娘選択時に選択不可能なウマ娘を選択した場合にtrueがセットされてホーム画面へ戻る
--     errorSupport       サポート編成時に選択不可能なウマ娘がデッキに含まれていた場合にtrueがセットされてホーム画面へ戻る
--     actionTable        ホーム画面で実行した行動
--                        homeInfo.actionTable[HOME_ACTION.TEAM_RACE]でチーム競技場を周回したかどうかを判定できる
--                        行動を実行する前はnilになり実行した後はtrueになる
--                        同じ行動を繰り返し実行してしまうのを防ぐために利用する
--                        育成開始または待機を実行すると初期化される
--   例：homeInfo.rentalCountで残りレンタル回数を参照できる
-- 戻り値
--   ホーム画面で行う行動
--   以下から指定する
--   HOME_ACTION.TRAINING        育成開始（再開データが存在する場合は再開）
--   HOME_ACTION.TEAM_RACE       チーム競技場をRPが残っているだけ周回してホームへ戻る
--   HOME_ACTION.AUTO_RACE       レース画面へ遷移後CONFIG.AUTO_RACEの設定に従ってレースを周回する
--   HOME_ACTION.RACING_CARNIVAL レーシングカーニバル画面へ遷移後CONFIG.RACING_CARNIVALの設定に従ってレースを周回する
--   HOME_ACTION.CIRCLE          サークル画面へ遷移後CONFIG.CIRCLEの設定に従って寄付やリクエストを行う
--   HOME_ACTION.FRIEND          フレンド画面へ遷移後CONFIG.FRIENDの設定に従ってフレンドのフォローを行う
--   HOME_ACTION.WAIT            待機（CONFIG.WAIT.HOMEで指定している時間に従って待機した後に再びgetHomeActionが呼び出される）
--   HOME_ACTION.REBOOT          ウマ娘の再起動
--   HOME_ACTION.EXIT            スクリプトの終了
----------------------------------------------------------------------------------------------------
function getHomeAction( homeInfo )

	-- 全自動育成モードがOFFの場合は終了
	if CONFIG.AUTO_MODE.ENABLE == false then
		return HOME_ACTION.EXIT
	end


	-- CONFIG.AUTO_MODE.ACTIVE_HOURの設定から全自動育成モードを動作させるかをチェック
	-- osDate()はos.date("*t")とほぼ同等（osライブラリはデフォルトでは利用できないので代用している）
	local date = osDate()
	local isActive = false
	for i = 1, #CONFIG.AUTO_MODE.ACTIVE_HOUR do
		if date.hour >= CONFIG.AUTO_MODE.ACTIVE_HOUR[i].min and date.hour <= CONFIG.AUTO_MODE.ACTIVE_HOUR[i].max then
			isActive = true
			break
		end
	end
	if isActive == false then
		return HOME_ACTION.WAIT
	end


	-- RPが残っている場合
	if homeInfo.rp > 0 then

		-- CONFIG.AUTO_MODE.TEAM_RACEがtrueの場合チーム競技場を周回する
		if CONFIG.AUTO_MODE.TEAM_RACE then
			if homeInfo.actionTable[HOME_ACTION.TEAM_RACE] == nil then
				return HOME_ACTION.TEAM_RACE
			end


		-- CONFIG.AUTO_MODE.AUTO_RACEがtrueの場合CONFIG.AUTO_RACEで設定しているレースを周回する
		elseif CONFIG.AUTO_MODE.AUTO_RACE then
			if homeInfo.actionTable[HOME_ACTION.AUTO_RACE] == nil then
				return HOME_ACTION.AUTO_RACE
			end


		-- CONFIG.AUTO_MODE.RACING_CARNIVALがtrueの場合CONFIG.RACING_CARNIVALで設定しているレースを周回する
		elseif CONFIG.AUTO_MODE.RACING_CARNIVAL then
			if homeInfo.actionTable[HOME_ACTION.RACING_CARNIVAL] == nil then
				return HOME_ACTION.RACING_CARNIVAL
			end
		end
	end


	-- 以下のように記述するとレーシングカーニバルのデイリーミッションを確実に消化するためにhomeInfo.selectCarnivalRaceの値をユーザー定義ステータスへ保持することができる
	-- カーニバルレースを順番に選択する設定にしている場合はhomeInfo.selectCarnivalRaceにはカーニバルレースに出走する度に次に出走するレースが代入される
	-- ユーザー定義ステータスに『SELECT_CARNIVAL_RACE』といった定数名で選択するカーニバルレースのステータスを有効期間『一日』で設定しておく必要がある
	-- 保持したユーザー定義ステータスを基本設定のCONFIG.RACING_CARNIVAL.SELECT_CARNIVAL_RACEへ代入すれば実行を停止しても保持したレースから順番に選択される
	-- setStatus( STATUS.USER.SELECT_CARNIVAL_RACE, homeInfo.selectCarnivalRace )


	-- CONFIG.AUTO_MODE.CIRCLEがtrueの場合サークルをチェックする
	if CONFIG.AUTO_MODE.CIRCLE then
		if homeInfo.actionTable[HOME_ACTION.CIRCLE] == nil then
			return HOME_ACTION.CIRCLE
		end
	end


	-- CONFIG.AUTO_MODE.FRIENDがtrueの場合フレンド画面でフレンドのフォローを行う
	if CONFIG.AUTO_MODE.FRIEND then
		if homeInfo.actionTable[HOME_ACTION.FRIEND] == nil then
			return HOME_ACTION.FRIEND
		end
	end


	-- 以下のように記述すると一日の育成回数を制限することができる（bot検知対策）
	-- onStartScenario関数であらかじめ一日の育成回数をユーザー定義ステータスへ保持する必要がある（onStartScenario関数内のコメントを参照）
--[[
	if g_status[STATUS.USER.DAY_TRAINING_COUNT] >= 10 then
		print( "一日の育成回数制限オーバー" )
		return HOME_ACTION.EXIT
	end
]]

	-- 継承ウマ娘選択時に選択不可能なウマ娘を選択した場合の処理
	if homeInfo.errorInheritance then

		-- エラー時にスクリプトを終了させたい場合はHOME_ACTION.EXITを返す
		-- return HOME_ACTION.EXIT

		-- おまかせ選択に設定する場合は以下のように記述する
		-- CONFIG.AUTO_MODE.INHERITANCE_AUTO = true
	end


	-- サポート編成時に選択不可能なウマ娘がデッキに含まれていた場合の処理
	if homeInfo.errorSupport then

		-- エラー時にスクリプトを終了させたい場合はHOME_ACTION.EXITを返す
		-- return HOME_ACTION.EXIT

		-- おまかせ編成に設定する場合は以下のように記述する
		-- CONFIG.AUTO_MODE.SUPPORT_AUTO = true
	end


	-- 残りレンタル回数を保持
	-- homeInfo.rentalCountは実行開始時は認識されていないのでnilになる
	-- 日付変更直後もリセットされてnilになる
	local rentalCount = homeInfo.rentalCount


	-- 以下のように記述すると残りレンタル回数をユーザー定義ステータスへ保持することによってrentalCountがnilの場合にユーザー定義ステータスの値を参照できる
	-- レンタル後の残りレンタル回数をユーザー定義ステータスへ保持する方法はonStartScenario関数内のコメントを参照
	-- 残りレンタル回数が0の状態でレンタル不可となりホームに戻るのを防ぐことができる
--[[
	if rentalCount == nil then
		rentalCount = g_status[STATUS.USER.RENTAL_COUNT]
	else
		setStatus( STATUS.USER.RENTAL_COUNT, rentalCount )
	end
]]


	-- 残りレンタル回数が0の場合はCONFIG.AUTO_MODE.INHERITANCE_RENTALを0にしてレンタルしないようにする
	-- CONFIG.AUTO_MODE.INHERITANCE_RENTALが1または2かつ残りレンタル回数が0の状態で育成を開始した場合レンタル不可となりホームに戻る
	if (rentalCount == 0 and CONFIG.AUTO_MODE.INHERITANCE_RENTAL ~= 0 and CONFIG.AUTO_MODE.INHERITANCE_RENTAL_EVENT == false) or homeInfo.errorRental then
		CONFIG.AUTO_MODE.INHERITANCE_RENTAL = 0

		-- 残りレンタル回数が0の場合にプリセットを切り替えて育成キャラ等を変更したい場合はloadPreset関数でプリセットを読み込む
		-- プリセットを読み込んでもユーザー定義定数が更新されるだけなので育成キャラ等を変更したい場合は全自動育成モードの設定を再設定する必要がある
		-- loadPreset関数は2つ目の引数にtrueを指定するとツール上のプリセットが指定したプリセット名に切り替わる
		-- loadPreset( "プリセット名" )
	end


	-- loadPreset関数でプリセットを切り替える処理を入れる場合は育成開始直前のここで全自動育成モードの設定にユーザー定義定数を代入する
--[[
		CONFIG.AUTO_MODE.TRAINING_CHARACTER			= USER.TRAINING_CHARACTER
		CONFIG.AUTO_MODE.INHERITANCE1_CHARACTER		= USER.INHERITANCE1_CHARACTER
		CONFIG.AUTO_MODE.INHERITANCE1_EVALUATION	= USER.INHERITANCE1_EVALUATION
		<以下略>
]]

	-- 育成開始
	return HOME_ACTION.TRAINING
end


----------------------------------------------------------------------------------------------------
-- onStartScenario関数
-- シナリオ開始時に呼び出される
-- 呼び出されるタイミングはシナリオ開始時のイベント短縮設定を行う直前
-- 育成回数や残りレンタル回数をカウントしてユーザー定義ステータスに保持したい場合に利用する
----------------------------------------------------------------------------------------------------
-- 引数：homeInfo
--     tp            現在のTP
--     rp            現在のRP
--     trainingCount 残り周回数（初期値はCONFIG.AUTO_MODE.TRAINING_COUNTになる）
--     rentalCount   残りレンタル回数
--   例：homeInfo.rentalCountで残りレンタル回数を参照できる
----------------------------------------------------------------------------------------------------
function onStartScenario( homeInfo )

	-- 以下のように記述することにより育成回数を『ステータス：永続.ini』に保持できる
	-- ユーザー定義ステータスに『TRAINING_COUNT』といった定数名で育成回数のステータスを有効期間『永続』で設定しておく必要がある
	-- 統計を取って確率を算出したい時などに利用する（利用方法はonEvent関数内のコメントを参照）
--[[
	setStatus( STATUS.USER.TRAINING_COUNT, g_status[STATUS.USER.TRAINING_COUNT] + 1 )
]]


	-- 以下のように記述することにより一日の育成回数を『ステータス：永続.ini』に保持できる
	-- ユーザー定義ステータスに『DAY_TRAINING_COUNT』といった定数名で育成回数のステータスを有効期間『一日』で設定しておく必要がある
	-- 一日の育成回数を制限したい時などに利用する（利用方法はgetHomeAction関数内のコメントを参照）
--[[
	setStatus( STATUS.USER.DAY_TRAINING_COUNT, g_status[STATUS.USER.DAY_TRAINING_COUNT] + 1 )
]]


	-- 以下のように記述することにより残りレンタル回数を『ステータス：永続.ini』に保持できる
	-- ユーザー定義ステータスに『RENTAL_COUNT』といった定数名で残りレンタル回数のステータスを有効期間『一日』で設定しておく必要がある
	-- homeInfo.rentalCountは全自動育成モードでホーム画面から開始した場合に残りレンタル回数が入っている（残り回数3でレンタルして開始した場合は2になる）
	-- 継承ウマ娘をおまかせ選択する場合は認識できないのでnilになる
--[[
	if homeInfo.rentalCount then
		setStatus( STATUS.USER.RENTAL_COUNT, homeInfo.rentalCount )
	end
]]

end


----------------------------------------------------------------------------------------------------
-- onStartTraining関数
-- 育成開始時に呼び出される
-- 呼び出されるタイミングは実行開始後onStartTurn関数が呼び出される直前で1回のみ呼び出される
-- 全自動育成モードで周回中の場合は最初のターンにも呼び出される
-- ステータス等は認識されている状態になっている
-- 初期化処理等を記述したい場合に利用する
----------------------------------------------------------------------------------------------------
function onStartTraining()

	-- スクリプト内でg_supportCharacterInfoやg_skillInfo等のデータベースの変数を変更した場合スクリプト実行中は保持され初期化されることはない
	-- 全自動育成モードの育成開始時にスクリプト内のデータベースの変数を一旦初期化したい場合はloadDatabase関数を利用する
	-- 初期化したいデータベースのcsvファイルを指定すると各データベースの変数が初期化される
	-- loadDatabase( "サポートキャラ.csv" ) -- g_supportCharacterInfoがツールで設定している値に初期化される
	-- loadDatabase( "スキル.csv" )         -- g_skillInfoがツールで設定している値に初期化される
	-- 『サポートキャラ.csv』や『スキル.csv』等のcsvファイルが存在しない場合はデフォルトのデータベースで初期化される
	-- データベースの切り替え機能を使ってデータベースを複数作成している場合はスクリプトで読み込むデータベースを切り替えることも可能
	-- loadDatabase( "スキル：○○○.csv" )
	-- loadDatabase関数は2つ目の引数にtrueを指定するとツール上のデータベースが指定したデータベース名に切り替わる
	-- loadDatabase( "スキル：○○○.csv", true )


	-- 以下のように記述すると育成キャラ別に特定のスキルの優先度を変更することが可能
--[[
	local skillInfoTable =
	{
		{	characterName = "育成キャラ名1",	skillNameTable = { "スキル名1" }					},
		{	characterName = "育成キャラ名2",	skillNameTable = { "スキル名2", "スキル名3" }		},
	}
	for i = 1, #skillInfoTable do

		-- 名前がcharacterNameと一致した場合
		if g_status[STATUS.NAME] == skillInfoTable[i].characterName then

			-- skillNameTableに記述しているスキルの脚質別優先度を全て10000に変更する
			for j = 1, #skillInfoTable[i].skillNameTable do
				local skillName = skillInfoTable[i].skillNameTable[j]
				g_skillInfo[skillName].stylePriority[STYLE.NIGE]	= 10000
				g_skillInfo[skillName].stylePriority[STYLE.SENKOU]	= 10000
				g_skillInfo[skillName].stylePriority[STYLE.SASHI]	= 10000
				g_skillInfo[skillName].stylePriority[STYLE.OIKOMI]	= 10000
			end
		end
	end
]]


	-- 以下のように記述すると育成キャラ別に強制的に出走するレースを変更することが可能
--[[
	local raceInfoTable =
	{
		{	characterName = "育成キャラ名1",	runRace = {{ name = "レース名1", seasonName = "時期名1" }}													},
		{	characterName = "育成キャラ名2",	runRace = {{ name = "レース名2", seasonName = "時期名2" }, { name = "レース名3", seasonName = "時期名3" }}	},
	}
	for i = 1, #raceInfoTable do

		-- 名前がcharacterNameと一致した場合
		if g_status[STATUS.NAME] == raceInfoTable[i].characterName then

			-- runRaceに記述しているレースを強制的に出走するレースに設定する
			CONFIG.RUN_RACE = raceInfoTable[i].runRace
		end
	end
]]

end


----------------------------------------------------------------------------------------------------
-- onStartTurn関数
-- ターン開始時に呼び出される
-- 一例として序盤は先行で育成して後半は差しに作戦を変更するなどの処理を行いたい場合に利用する
----------------------------------------------------------------------------------------------------
function onStartTurn()

	-- 以下のように記述するとチーム対抗戦の対戦相手をシーズン毎に変更できる
--[[
	-- プレシーズン第1戦
	if g_status[STATUS.SEASON].index == SEASON.JUNIOR_12B.index then
		CONFIG.TEAM_BATTLE_SELECT = 1

	-- プレシーズン第2戦
	elseif g_status[STATUS.SEASON].index == SEASON.CLASSIC_6B.index then
		CONFIG.TEAM_BATTLE_SELECT = 1

	-- プレシーズン第3戦
	elseif g_status[STATUS.SEASON].index == SEASON.CLASSIC_12B.index then
		CONFIG.TEAM_BATTLE_SELECT = 1

	-- プレシーズン第4戦
	elseif g_status[STATUS.SEASON].index == SEASON.SENIOR_6B.index then
		CONFIG.TEAM_BATTLE_SELECT = 1
	end
]]


	-- 以下のように記述すると特定の時期以降に育成キャラの作戦を変更することができる
--	if g_status[STATUS.SEASON].index >= SEASON.○○○.index then
--		g_characterInfo[g_status[STATUS.NAME]].style = STYLE.○○○
--	end


	-- 以下のように記述すると特定のスキルを習得後に特定のサポートキャラのヒントの優先度を変更することができる
--[[
	if isAcquireSkill(g_skillInfo["スキル名"]) then
		g_supportCharacterInfo["サポートキャラ名（二つ名込み）"].hintPriority = 0
	end 
]]


	-- 以下のように記述するとターン開始時に『ターン開始.wav』が再生される
	-- playSound関数は2つ目の引数にtrueを指定するとサウンドが鳴り終わるまで待機する
	-- playSound( "ターン開始.wav" )
end


----------------------------------------------------------------------------------------------------
-- onTraining関数
-- トレーニングを行った時に呼び出される
-- トレーニング回数をカウントしたい時などに利用する
----------------------------------------------------------------------------------------------------
-- 引数：trainingInfo
--   中身はgetAction関数の引数actionInfo.trainingScoreTableの選択したトレーニングと同じになる（詳細はgetAction関数のコメントを参照）
--   例：trainingInfo.nameで行ったトレーニング名を参照できる
--   getAction関数でトレーニングの確認を行わずに決め打ちでトレーニングを行った場合はtrainingInfo.name以外はnilになる
----------------------------------------------------------------------------------------------------
function onTraining( trainingInfo )

	-- アオハル魂爆発をカウントしたい場合は以下のように記述する
	-- ユーザー定義ステータスに『AOHARU_EXPLOSION_COUNT』といった定数名でアオハル魂爆発回数のステータスを設定しておく必要がある
	-- ステータスを更新する場合は
	-- g_status[STATUS.USER.AOHARU_EXPLOSION_COUNT] = 0
	-- のように記述するのではなく
	-- setStatus( STATUS.USER.AOHARU_EXPLOSION_COUNT, 0 )
	-- のようにsetStatus関数を使用して更新する必要がある（ツール上へ反映させるため）
--[[
	if trainingInfo.teamMember then
		for i = 1, #trainingInfo.teamMember do
			if trainingInfo.teamMember[i].aoharuMark == 2 then
				setStatus( STATUS.USER.AOHARU_EXPLOSION_COUNT, g_status[STATUS.USER.AOHARU_EXPLOSION_COUNT] + 1 )
			end
		end
	end
]]


	-- 各トレーニングをカウントしたい場合は以下のように記述する
	-- ユーザー定義ステータスに『トレーニング回数：スピード』といった名前で各トレーニング回数のステータスを設定しておく必要がある
	-- トレーニングによってステータス名が変わるのでSTATUS.USER.TRAINING_COUNT_SPEEDのような定数ではなくステータス名をstatusNameに代入してg_status[statusName]で参照している
	-- PREFIX.USER_DEFINEDには『ユーザー定義：』が入っている
--[[
	local statusName = PREFIX.USER_DEFINED .. "トレーニング回数：" .. trainingInfo.name
	setStatus( statusName, g_status[statusName] + 1 )
]]

end


----------------------------------------------------------------------------------------------------
-- onEvent関数
-- イベントが発生した時に呼び出される
-- 特定のイベント発生時に処理を行いたい場合に利用する
----------------------------------------------------------------------------------------------------
-- 引数：eventInfo
--   データベースに登録されているイベント情報が入っている
--   イベント名を参照したい場合は eventInfo.name のように記述する
-- 引数：characterName
--   キャラクター共通イベントの場合はeventInfo.characterNameが"-"となっているのでこちらの引数でキャラクター名を判別する
-- 引数：eventProgress
--   連続イベントの場合イベント進行度が入っている
--   連続イベントではない場合常に1になる
-- 引数：eventProgressMax
--   連続イベントの場合イベント進行度の最大値（連続イベント数）が入っている
--   連続イベントではない場合常に1になる
----------------------------------------------------------------------------------------------------
function onEvent( eventInfo, characterName, eventProgress, eventProgressMax )

	-- 以下のように記述することにより、あんし～ん笹針師、参☆上のイベントの発生確率をログに出力できる
	-- ユーザー定義ステータスに『SASABARISHI_COUNT』といった定数名で笹針師出現回数のステータスを有効期間『永続』で設定しておく必要がある
	-- onStartScenario関数であらかじめ育成回数をユーザー定義ステータスへ保持する必要がある（onStartScenario関数内のコメントを参照）
--[[
	if eventInfo.name == "あんし～ん笹針師、参☆上" then
		setStatus( STATUS.USER.SASABARISHI_COUNT, g_status[STATUS.USER.SASABARISHI_COUNT] + 1 )
		print( "笹針師出現回数：" .. g_status[STATUS.USER.SASABARISHI_COUNT] .. " 出現確率：" .. math.floor((g_status[STATUS.USER.SASABARISHI_COUNT] * 100) / g_status[STATUS.USER.TRAINING_COUNT]) .. "%" )
	end
]]

end


----------------------------------------------------------------------------------------------------
-- onRunRace関数
-- レースに出走した時に呼び出される
-- 呼び出されるタイミングはパドックでの作戦変更前
-- g_status[STATUS.RACE]には出走するレースが入った状態になっている
-- レースによって作戦を変更したい場合に利用する
----------------------------------------------------------------------------------------------------
-- 引数：runRaceInfo
--     styleCount  各作戦（脚質）の人数
--   例：runRaceInfo.styleCount[STYLE.NIGE]で逃げの人数を参照できる
----------------------------------------------------------------------------------------------------
function onRunRace( runRaceInfo )

	-- 以下のように記述するとレースの距離によっての作戦を変更することができる
--	if g_status[STATUS.RACE].distance == DISTANCE.○○○ then
--		g_characterInfo[g_status[STATUS.NAME]].style = STYLE.○○○
--	else
--		g_characterInfo[g_status[STATUS.NAME]].style = STYLE.○○○
--	end
end


----------------------------------------------------------------------------------------------------
-- onCompleteTraining関数
-- 育成完了時に呼び出される
-- 呼び出されるタイミングは育成完了確認画面でgetAction関数を呼び出す前
----------------------------------------------------------------------------------------------------
function onCompleteTraining()

	-- 手動でスキルの獲得を行いたい場合はここでabort関数を呼ぶ
	-- abort()
end


----------------------------------------------------------------------------------------------------
-- onReturnHome関数
-- 育成完了後ホーム画面に戻った時に呼び出される
----------------------------------------------------------------------------------------------------
-- 引数：time
--   育成完了時間
--   スクリーンショットのファイル名に準拠
----------------------------------------------------------------------------------------------------
function onReturnHome( time )

	-- 以下のように記述すると育成完了時に因子獲得画面を関連付けされたプログラムで開くことができる
	-- 利用するには拡張モードの設定でshellExecute関数を有効にする必要がある
	-- shellExecute( DIRECTORY.HALL_OF_FAME .. "\\" .. time .. "：" .. g_status[STATUS.NAME] .. "：因子獲得.png" )
end


----------------------------------------------------------------------------------------------------
-- onStartScript関数
-- スクリプト開始時に呼び出される
----------------------------------------------------------------------------------------------------
function onStartScript()
end


----------------------------------------------------------------------------------------------------
-- onEndScript関数
-- スクリプト終了時に呼び出される
-- ホットキー等でスクリプトを停止したときは呼び出されない
-- エラー等でスクリプトが停止した時は呼び出されない
-- ログに『▲ 終了』と表示されて正常終了した時のみ呼び出される
----------------------------------------------------------------------------------------------------
function onEndScript()
end


----------------------------------------------------------------------------------------------------
-- onReboot関数
-- 経過時間オーバー等でウマ娘が再起動された時に呼び出される
----------------------------------------------------------------------------------------------------
function onReboot()
end


----------------------------------------------------------------------------------------------------
-- onChangeDay関数
-- 日付変更のポップアップが表示されて日付が変更された時に呼び出される
----------------------------------------------------------------------------------------------------
function onChangeDay()
end


----------------------------------------------------------------------------------------------------
-- ユーザー定義関数
----------------------------------------------------------------------------------------------------
-- 関数は自由に定義する事が可能
-- グローバルな名前空間に定義すると内部で定義されている関数名と衝突する可能性があるのでUSERテーブル内に定義することを推奨
-- 同様に変数もlocalをつけてローカル変数にするかUSERテーブル内に定義することを推奨
-- 例えば
-- print = 0
-- このように記述してしまうとprint関数が0で上書きされてprint関数を呼び出す時にエラーとなる
----------------------------------------------------------------------------------------------------
-- 以下の関数は育成ログの備考欄に引数として渡した文字列がいくつ存在するかをカウントして戻り値として返す
--[[
function USER.getNoteCount( text )
	local count = 0
	for i = 1, #g_trainingLogInfo do
		if g_trainingLogInfo[i].note:find(text) then
			count = count + 1
		end
	end
	return count
end
]]
-- 利用例
-- USER.getNoteCount( "●トレーニング：スピード" )
-- と記述するとスピードのトレーニングを行った回数を取得できる
-- USER.getNoteCount( "●レース出走：" .. "レース名" .. "：1着" )
-- と記述するとレースに勝利したかを判定できる
-- クラシック級で勝利したレースにシニア級では出走しないといった処理に利用できる

-- 以下の関数はコンディションに引数として渡したコンディション名が存在するどうかを真偽値で返す
--[[
function USER.hasCondition( conditionName )
	for i = 1, #g_status[STATUS.CONDITION] do
		if g_status[STATUS.CONDITION][i].name == conditionName then
			return true
		end
	end
	return false
end
]]
-- 利用例
-- USER.hasCondition( "切れ者" )
-- と記述するとコンディションに切れ者が存在すればtrue、存在しなければfalseになる


----------------------------------------------------------------------------------------------------
-- ユーザー定義データベース
----------------------------------------------------------------------------------------------------
-- 任意のcsvファイルを用意してloadCsv関数で読み込むことにより任意のデータベースをスクリプト内で利用することが可能
----------------------------------------------------------------------------------------------------
-- 以下は『アイテム.csv』を読み込んで内容をログに出力している
-- local csvTable = loadCsv( "アイテム.csv" )
-- print( csvTable )
-- loadCsv関数によるcsvファイルの読み込み処理は特殊な仕様になっておりスクリプト内で使用されている変数や演算子を記述することが可能になっている（詳しくは『アイテム.csv』を参照）
-- 文字列を扱いたい場合はシングルクォーテーションで囲むようにする（ダブルクオーテーションは利用不可）
-- csvファイルにマルチバイト文字（全角文字）が含まれる場合は文字コードを『UTF-8（BOM無し）』にして保存する必要がある
-- loadCsv関数の戻り値は整数が添え字の通常の2次元配列となる
-- 2次元配列を加工して別のテーブルに連想配列で保持することにより利便性が高まる
-- 『アイテム.csv』も内部処理ではloadCsv関数で読み込んだ後にg_itemInfoテーブルへ利用しやすい構造に変換して保持している
-- またITEM.VITAL1と記述すると"バイタル20"となるようにcsvファイルに定数名を記述して定数として定義するように処理している
-- g_itemInfo[ITEM.VITAL1]と記述するとバイタル20のアイテム情報を参照できる
-- 以下は加工後のg_itemInfoテーブルとITEMテーブルをログに出力する
-- print( g_itemInfo )
-- print( ITEM )
