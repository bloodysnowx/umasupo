----------------------------------------------------------------------------------------------------
-- ※このスクリプトファイルは動作をデフォルトから変更するための設定ファイルです
-- ※動作を変更したい場合は『設定：デフォルト.lua』から変更したい部分をコピペして編集して下さい
-- ※『設定：デフォルト.lua』で設定されているものよりこのスクリプトファイルで設定されたものが優先されます
-- ※拡張モードではない場合外部スクリプトの読み込み処理を行っていないので編集しても反映されません
-- ※このスクリプトファイルは文字コードを『UTF-8（BOM無し）』にして保存してください
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- 追加定数
----------------------------------------------------------------------------------------------------
baseHP = 45
csvLoaded = false --getAction関数とgetHomeAction関数にて操作

-- 可変値
CONFIG.AUTO_MODE.ENABLE = USER.AUTO_MODE

CONFIG.AUTO_MODE.TRAINING_CHARACTER = USER.TRAINING_CHARACTER

CONFIG.AUTO_MODE.INHERITANCE1_CHARACTER = USER.INHERITANCE1_CHARACTER
CONFIG.AUTO_MODE.INHERITANCE1_EVALUATION = USER.INHERITANCE1_EVALUATION
CONFIG.AUTO_MODE.INHERITANCE2_CHARACTER = USER.INHERITANCE2_CHARACTER
CONFIG.AUTO_MODE.INHERITANCE2_EVALUATION = USER.INHERITANCE2_EVALUATION

CONFIG.AUTO_MODE.INHERITANCE_RENTAL = USER.INHERITANCE_RENTAL
CONFIG.AUTO_MODE.INHERITANCE_RENTAL_CHARACTER = USER.INHERITANCE_RENTAL_CHARACTER
CONFIG.AUTO_MODE.INHERITANCE_RENTAL_EVALUATION = USER.INHERITANCE_RENTAL_EVALUATION

CONFIG.AUTO_MODE.SUPPORT_DECK = USER.SUPPORT_DECK
CONFIG.AUTO_MODE.SUPPORT_FRIEND[1] = USER.SUPPORT_FRIEND
CONFIG.AUTO_MODE.SUPPORT_FRIEND_LIMIT = USER.SUPPORT_FRIEND_LIMIT
----------------------------------------------------------------------------------------------------
-- 基本設定
----------------------------------------------------------------------------------------------------
CONFIG.CHECK_SKILL_SEASON = false
CONFIG.KEEP_SKILLPT = 300
CONFIG.TEAM_BATTLE_SELECT = 2
CONFIG.CHECK_RIVAL = true
CONFIG.EDIT_EVENT = false
CONFIG.REGISTER_NO_CHOICE_EVENT = false
CONFIG.EDIT_SKILL = false
CONFIG.EDIT_FACTOR = false
CONFIG.SHUFFLE_CHECK_TRAINING_RATE = 30
CONFIG.REBOOT_TIME = 60 * 2
CONFIG.AUTO_MODE.TRAINING_COUNT = 0
CONFIG.AUTO_MODE.TEAM_RACE = true
CONFIG.AUTO_MODE.AUTO_RACE = true
CONFIG.AUTO_MODE.RACING_CARNIVAL = true
CONFIG.AUTO_MODE.CIRCLE = true
CONFIG.AUTO_MODE.FRIEND = false -- maybe set true
CONFIG.AUTO_MODE.USE_TOUGHNESS30 = false -- maybe set true
CONFIG.AUTO_MODE.USE_ITEM = false
CONFIG.AUTO_MODE.USE_JEWEL = false
CONFIG.AUTO_MODE.SCENARIO = SCENARIO.CLIMAX
