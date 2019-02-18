<?php
/*========================================================*/
// 更新履歴
// 2014/11/11 Y.Matsukawa	多言語版対応
/*========================================================*/

error_reporting(1);
ini_set('display_errors', TRUE);
ini_set('display_startup_errors', TRUE);
$hostname = trim(`hostname`);

switch( $hostname ){
// 開発機
case 'dev-storeintfo01':
	define('DEBUG', true);
	// いつもNAVI CGI
	define('D_EMAPCGI_DIR', 'http://10.47.50.33/cgi/');
	$D_SSAPI_KEY = '42nQnP9olg6vBmnAhvBInAxf9cmg0P4Xidj5SPXvu5HMiNe3gfXBwzTnrxEzTanglzFamwTXFqmgzzFvngkTAa';
	// 一般ユーザーログイン画面
	define('D_TXT_CORP_USER_LOGIN_URL', 'http://218.225.89.239/emapFO/text/loginc.html?corp_id=');
	define('D_MAP_CORP_USER_LOGIN_URL', 'http://218.225.89.239/emapFO/map/loginc.html?corp_id=');
	// icon_select.cgi,gif_select.cgi -- Link Path
	if ($_SERVER['HTTPS'] != '') {
		define('CGIDIR', 'https://218.225.89.238/cgi/');
	} else {
		define('CGIDIR', 'http://218.225.89.238/cgi/');
	}
	// 拠点CGI
	define('EMAP_TPL_CGIDIR', 'http://10.47.50.182/cgi/');
	// 拠点確認URL
	define('EMAP_URL',    'http://218.225.89.238/pc/index.htm?cid=@CID@&kid=@KID@');
	define('EMAP_URL_M',  'http://218.225.89.238/mobile/@CID@/d.htm?kid=@KID@');
	define('EMAP_URL_P2', 'http://218.225.89.238/p/@CID@/dtl/@KID@/?NOCOND=1');
	// Maplink URL
	if (substr($corp_id, -4) == 'test') {
		define('URL_PC',     'http://218.225.89.238/pc/');
		define('URL_MOBILE', 'http://218.225.89.238/mobile/');
		define('URL_SMT',    'http://218.225.89.238/smt/');
	} else {
		define('URL_PC',     'http://218.225.89.238/pc/');
		define('URL_MOBILE', 'http://218.225.89.238/mobile/');
		define('URL_SMT',    'http://218.225.89.238/smt/');
	}
	// RDからの呼び出し用
	define('FOR_RD_CGIDIR', 'http://218.225.89.238/cgi/');
	break;
// 検証機
case 'storeintfo-v01':
//	define('DEBUG', false);
//	// いつもNAVI CGI
//	define('D_EMAPCGI_DIR', 'http://172.16.204.200/cgi/');
//	$D_SSAPI_KEY = '43nQ1P94lgDvBWnAIvB8nA4f9HmgZPB1idN5SFXvHaE7f7dnTQrxjzTfrxwzTxng3XByoQtv61oQgv61nRa87hpRSzTE';
//	// 一般ユーザーログイン画面
//	define('D_TXT_CORP_USER_LOGIN_URL', 'https://test.tool.e-map.ne.jp/text/loginc.html?corp_id=');
//	define('D_MAP_CORP_USER_LOGIN_URL', 'https://test.tool.e-map.ne.jp/map/loginc.html?corp_id=');
//	// icon_select.cgi,gif_select.cgi -- Link Path
//	if ($_SERVER['HTTPS'] != '') {
//		define('CGIDIR', 'https://test.tool.e-map.ne.jp/cgi/');
//	} else {
//		define('CGIDIR', 'http://test.tool.e-map.ne.jp/cgi/');
//	}
//	// 拠点CGI
//	define('EMAP_TPL_CGIDIR', 'http://172.16.162.20/cgi/');
//	// 登録拠点確認URL
//	define('EMAP_URL',    'http://test.e-map.ne.jp/pc/index.htm?cid=@CID@&kid=@KID@');
//	define('EMAP_URL_M',  'http://test.e-map.ne.jp/mobile/@CID@/d.htm?kid=@KID@');
//	define('EMAP_URL_P2', 'http://test.e-map.ne.jp/p/@CID@/dtl/@KID@/?NOCOND=1');
//	// Maplink URL
//	if (substr($corp_id, -4) == 'test') {
//		define('URL_PC',     'http://test.e-map.ne.jp/pc/');
//		define('URL_MOBILE', 'http://test.e-map.ne.jp/mobile/');
//		define('URL_SMT',    'http://test.e-map.ne.jp/smt/');
//	} else {
//		define('URL_PC',     'http://www.e-map.ne.jp/pc/');
//		define('URL_MOBILE', 'http://www.e-map.ne.jp/mobile/');
//		define('URL_SMT',    'http://www.e-map.ne.jp/smt/');
//	}
//	// RDからの呼び出し用
//	define('FOR_RD_CGIDIR', 'http://test.e-map.ne.jp/cgi/');
	break;
// 本番機
default:
//	define('DEBUG', false);
//	// いつもNAVI CGI
//	define('D_EMAPCGI_DIR', 'http://172.16.204.201/cgi/');
//	$D_SSAPI_KEY = '43nQ1P94lgDvBWnAIvB8nA4f9HmgZPB1idN5SFXvHaE7f7dnTQrxjzTfrxwzTxng3XByoQtv61oQgv61nRa87hpRSzTE';
//	// 一般ユーザーログイン画面
//	define('D_TXT_CORP_USER_LOGIN_URL', 'https://tool.e-map.ne.jp/text/loginc.html?corp_id=');
//	define('D_MAP_CORP_USER_LOGIN_URL', 'https://tool.e-map.ne.jp/map/loginc.html?corp_id=');
//	// icon_select.cgi,gif_select.cgi -- Link Path
//	if ($_SERVER['HTTPS'] != '') {
//		define('CGIDIR', 'https://tool.e-map.ne.jp/cgi/');
//	} else {
//		define('CGIDIR', 'http://tool.e-map.ne.jp/cgi/');
//	}
//	// 拠点CGI
//	define('EMAP_TPL_CGIDIR', 'http://172.16.162.20/cgi/');	//※検証機を見に行く！
//	// 登録拠点確認URL
//	define('EMAP_URL',    'http://test.e-map.ne.jp/pc/index.htm?cid=@CID@&kid=@KID@');
//	define('EMAP_URL_M',  'http://test.e-map.ne.jp/mobile/@CID@/d.htm?kid=@KID@');
//	define('EMAP_URL_P2', 'http://test.e-map.ne.jp/p/@CID@/dtl/@KID@/?NOCOND=1');
//	// Maplink URL
//	if (substr($corp_id, -4) == 'test') {
//		define('URL_PC',     'http://test.e-map.ne.jp/pc/');
//		define('URL_MOBILE', 'http://test.e-map.ne.jp/mobile/');
//		define('URL_SMT',    'http://test.e-map.ne.jp/smt/');
//	} else {
//		define('URL_PC',     'http://www.e-map.ne.jp/pc/');
//		define('URL_MOBILE', 'http://www.e-map.ne.jp/mobile/');
//		define('URL_SMT',    'http://www.e-map.ne.jp/smt/');
//	}
//	// RDからの呼び出し用
//	define('FOR_RD_CGIDIR', 'http://test.e-map.ne.jp/cgi/');
	break;
}

// CGI
$D_CGI['tpl_get_maplayer']  = EMAP_TPL_CGIDIR.'tpl_get_maplayer.cgi';
$D_CGI['tpl_get_setting']   = EMAP_TPL_CGIDIR.'tpl_get_setting.cgi';
$D_CGI['icon_select']       = EMAP_TPL_CGIDIR.'icon_select.cgi';
$D_CGI['get_icon_info']     = EMAP_TPL_CGIDIR.'get_icon_info.cgi';
$D_SSAPI['getmap']          = D_EMAPCGI_DIR.'getmap.cgi';
$D_SSAPI['cvtxy2ll']        = D_EMAPCGI_DIR.'cvtxy2ll.cgi';

// 拠点項目数
define('D_KYOTEN_COL_MAX', 200);

// 拠点アイコン、拠点画像の容量上限(Byte)
define( 'BYTESIZE_I' , '300000' );
define( 'BYTESIZE_G' , '300000' );

// 拠点アイコン、拠点画像の縦横サイズ上限(ピクセル)
define( 'TATEYOKO_I' , '100' );
define( 'TATEYOKO_G' , '500' );

// 選択アイコン設定
define( 'SEL_ID'   , '@SEL' );
define( 'SEL_NAME' , '選択アイコン' );
define( 'SEL_DEF'  , '0003.gif' );
define( 'SELB_ID'  , '@SELB' );
define( 'SELB_NAME', '選択アイコン(点滅)' );
define( 'SELB_DEF' , '0000.gif' );
define( 'NEW_ID'   , '@NEW' );
define( 'NEW_NAME' , 'NEWアイコン' );
define( 'NEW_DEF'  , 'new.gif' );
$EXT_ICON = array(
 'SEL'	=>array('P_SV'=>'S|L|N',	'M_SV'=>'S|L|N|A')
,'SELB'	=>array('P_SV'=>'S',		'M_SV'=>'')
,'NEW'	=>array('P_SV'=>'S|L',		'M_SV'=>'')
);

// Light URL
define('URL_PC_LIGHT',	'http://www.e-map.ne.jp/pc/index.htm?cid=@CID@&kid=@KID@');
define('URL_P2_LIGHT',	'http://www.e-map.ne.jp/p/@CID@/dtl/@KID@/');
define('URL_M_LIGHT',	'http://www.e-map.ne.jp/mobile/@CID@/d.htm?kid=@KID@');
define('URL_SMT_LIGHT',	'http://www.e-map.ne.jp/smt/@CID@/map/@KID@/');

// 公開状況
$PUB_STATUS = array(
 1=>array('nm'=>'公開前',	'cl'=>'stat-mae')
,2=>array('nm'=>'修正予定',	'cl'=>'stat-syusei')
,3=>array('nm'=>'公開終了',	'cl'=>'stat-syuryo')
);

// お知らせ表示期間（日数）
// ※日数を変更する場合は、emapBO/inc/def.inc内の定義も、同じ値に変更してください。
$NOTICE_PUB_DAYS = array(
 0=>60		// お知らせ
,1=>30		// メンテナンス情報
,2=>3		// 障害情報
);

// 地図縮尺（PC）
$MAP_SCALE_P = array(
 1=>'【1】 1/1300万'
,2=>'【2】 1/650万'
,3=>'【3】 1/300万'
,4=>'【4】 1/150万'
,5=>'【5】 1/100万'
,6=>'【6】 1/50万'
,7=>'【7】 1/25万'
,8=>'【8】 1/15万'
,9=>'【9】 1/10万'
,10=>'【10】 1/5万'
,11=>'【11】 1/2万'
//,12=>'【12】 1/1万5000'
,12=>'【12】 1/1.5万'
,13=>'【13】 1/1万'
,14=>'【14】 1/7500'
,15=>'【15】 1/5000'
,16=>'【16】 1/3500'
,17=>'【17】 1/2500'
,18=>'【18】 1/1500'
);
$MAP_SCALE_P_INI = 18;

// 地図縮尺（Mobile）
$MAP_SCALE_M = array(
 1=>'【1】 33.1km'
,2=>'【2】 11.4km'
,3=>'【3】 4.7km'
,4=>'【4】 2.5km'
,5=>'【5】 1.1km'
,6=>'【6】 485m'
,7=>'【7】 242m'
,8=>'【8】 129m '
,9=>'【9】 97m '
);
$MAP_SCALE_M_INI = 9;

// 地図縮尺（スマートフォン）
$MAP_SCALE_SMT = array(
 1=>'【1】 1/1500万'
,2=>'【2】 1/650万'
,3=>'【3】 1/300万'
,4=>'【4】 1/150万'
,5=>'【5】 1/100万'
,6=>'【6】 1/50万'
,7=>'【7】 1/25万'
,8=>'【8】 1/10万'
,9=>'【9】 1/5万'
,10=>'【10】 1/2万'
,11=>'【11】 1/1.5万'
,12=>'【12】 1/1万'
,13=>'【13】 1/7500'
,14=>'【14】 1/3500'
,15=>'【15】 1/1500'
);
$MAP_SCALE_SMT_INI = 13;

//----------------------------------
// 企業パラメータテーブル
//----------------------------------
//Basic認証パスワード
define('CPARM_BASICPW_KBN', 'BASICPW');	//パラメータ区分
define('CPARM_BASICPW_SYNC', 'R');		//同期モード（即時）
// 一括処理：緯度経度未入力（不正）時
define('INVALID_LATLON_ADDRMATCH', 1);
define('INVALID_LATLON_ERROR', 2);
define('CPARM_FOBINVLL_KBN', 'FOBINVLL');	//パラメータ区分
// ユーザー権限使用
define('CPARM_CORPUSER_KBN', 'CORPUSER');	//パラメータ区分
// データ管理ツール：一般ユーザー「システム検証環境ログイン」許可
define('CPARM_CUTEST_KBN', 'CUTEST');		//パラメータ区分
// エラーにするマッチングレベル
define('CPARM_FOBINVMCLV_KBN', 'FOBINVMCLV');	//パラメータ区分
// 機種依存文字変換
define('CPARM_FOIZON_KBN', 'FOIZON');
// 許可IP
define('CPARM_FOIP_KBN', 'FOIP');
define('CPARM_FOIP_SYNC','R');//即時同期
// データ管理ツール操作ログ閲覧許可
define('CPARM_FOOPELOG_KBN', 'FOOPELOG');
// データ管理ツールセッションタイムアウト値
define('CPARM_FOTMOUT_KBN', 'FOTMOUT');
// データ管理ツール ログイン状況確認
define('CPARM_FOLOGINLST_KBN', 'FOLOGINLST');
// データ管理ツール 子IDからの強制ログアウト制限
define('CPARM_USERLOGOUT_KBN', 'USERLOGOUT');
// サービス区分（スマートフォン版）
define('CPARM_S_EMAP_KBN', 'S_EMAP_KBN');
// サービス区分（拠点CGI）
define('CPARM_C_EMAP_KBN', 'C_EMAP_KBN');
// PCバージョン
define('CPARM_PC_VER', 'PC_VER');
// リアルタイムデータ
define('CPARM_USE_RD', 'USE_RD');
// 測地系選択利用
define('CPARM_FODATUMUSE', 'FODATUMUSE');
// 測地系デフォルト
define('CPARM_FODATUM', 'FODATUM');
define('DATUM_TOKYO', 'TOKYO');
define('DATUM_WGS84', 'WGS84');
// 即時反映対象
define('CPARM_IMMREF_KBN', 'IMMREF');
// データ管理ツール 一括抽出：緯度経度書式指定利用
define('CPARM_FOEXPLF', 'FOEXPLF');
// データ管理ツール 一括抽出：緯度経度書式指定デフォルト値
define('CPARM_FOEXPLFDEF', 'FOEXPLFDEF');
// 画面上一括登録開始日指定
define('CPARM_FOIMPDT_KBN', 'FOIMPDT');
// 商品マスタ使用企業
define('CPARM_PRD', 'PRD');
//----------------------------------
// マッチングレベルで検索
//----------------------------------
$D_CHK_MCLV_NAME = array(
	1=>'都道府県',
	2=>'市区町村',
	3=>'大字',
	4=>'字丁目',
	5=>'街区',
);
$D_SRCH_MCLV_TITLE = array(
	0=>'編集済',
	1=>'都道府県レベル',
	2=>'市区町村レベルまで',
	3=>'大字レベルまで',
	4=>'字丁目レベルまで',
	5=>'街区レベルまで',
	6=>'地番レベルまで',
	7=>'枝番レベルまで',
);

//----------------------------------
// 拠点CSVアップロード（分割処理）
//----------------------------------
// 分割処理版使用
$BATCH_USE = true;
// １回あたりの処理件数
define('BATCH_KYOTEN_CHUNK', 500);
define('BATCH_PRD_CHUNK', 1000);		// 商品マスタ
define('BATCH_KYOTEN_PRD_CHUNK', 2000);	// 店舗商品実績
// ワークデータ保持期間（日数）（指定時間以上経過したデータは、アップロード処理時に全て削除）
define('BATCH_WORK_EXPIRES', 3);
// DB保存時のファイルID
define('BATCH_FID_KYOALL', 'kyoall');   //一括登録
define('BATCH_FID_KYOADD', 'kyoadd');   //差分登録
define('BATCH_FID_KYOUPD', 'kyoupd');   //差分修正
define('DEL_BATCH_KYODEL', 'kyodel');   //一括削除（複数件指定）
define('BATCH_FID_KID',    'kyoid');    //拠点IDリスト（重複チェック用）
define('BATCH_FID_ER',     'kyoer');    //エラーデータ
define('BATCH_FID_ER_NG',  'kyoerng');  //エラーファイル（エラー行）
define('BATCH_FID_ER_ALL', 'kyoerall'); //エラーファイル（全行）
define('BATCH_FID_KPALL',  'kpall');    //店舗商品実績：一括登録
define('BATCH_FID_KPADD',  'kpadd');    //店舗商品実績：差分登録

// GEOリトライ回数
define('GEO_CODING_RETRY_COUNT', 2);

//----------------------------------
//デフォルト許可IP
//----------------------------------
$D_DEFAULT_ALLOW_IP[] = '218.225.89.15';//ZDC社内
$D_DEFAULT_ALLOW_IP[] = '218.225.89.53';//VPN

?>
