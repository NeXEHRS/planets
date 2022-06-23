| 機能ID | API論理名 | HTTPメソッド | URI |
| :--- | :--- | :--- | :--- |
| PTP_ORG_002 | 【取得】医療機関情報（患者用） | GET | {applicationPath}/participants/organizations/{organizationId} |

| 連携方式 | データ形式 | 利用可能な接続先 |
| :--- | :--- | :--- |
| REST API | JSON形式（エンコーディング：utf-8） | リモート |

### リクエスト（認証）
| No. | 項目名 | 物理名 | 属性 | Nullable | 設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--- |
| 1 | アクセストークン | Authorization | string | - | 認証処理で取得したBearer Tokenを設定 |

### リクエスト（クエリ）
| No. | 項目名 | 物理名 | 属性 | Nullable | 設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--- |
| 1 | 名前 | name | string |  |  |
| 2 | 住所 | address | string |  |  |
| 3 | 電話番号 | telecom | string |  |  |

### リクエスト（パスパラメータ）
| No. | 項目名 | 物理名 | 属性 | Nullable | 設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--- |
| 1 | organizationId | 組織ID | string | ○ | 組織IDを設定 ※患者用の場合、「0000000000」を設定 |

### リクエスト(Body)
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | リクエスト設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| - |  |  |  |  |  |  |  |  |  | |  |  |

### サンプル（リクエスト）
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
＜パスパラメータ指定の場合＞<br/>
    {applicationPath}/providers/organizations/1310000001<br/>
＜クエリパラメータ指定の場合＞<br/>
    {applicationPath}/providers/organizations?name=クリニックX<br/>
<!-- ↑↑↑ここに書く↑↑↑ -->
</td></tr></table>

### レスポンス
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | レスポンス設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| 1 | 検索結果 | searchResults | ○ |  |  |  |  |  | ○ | object | - |  |
| 2 | 件数 | count |  | ○ |  |  |  |  | - | integer | - | 検索結果件数 |
| 3 | 取得データリスト | results |  | ○ |  |  |  |  | ○ | array | - |  |
| 4 | 医療機関情報 | contents |  |  | ○ |  |  |  | - | string | - | OpenFRUCtoSのOrganizationリソースの仕様に準拠する |
| 5 | 医療機関バージョン | version |  |  | ○ |  |  |  | - | string | - | Organizationリソースのバージョン |

| エラー条件 | 
| :--- |
| システムエラー<br/>・API共通仕様に準拠<br/>業務エラー<br/>・なし |

### サンプル（レスポンス）
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
正常終了<br/>
{<br/>
　　"searchResults": {<br/>
　　　　"count": 1,<br/>
　　　　"results": [<br/>
　　　　　　{<br/>
　　　　　　　　"contents": {<br/>
　　　　　　　　　　"fullUrl": "http://localhost:8099/of1/Organization/2",<br/>
　　　　　　　　　　"resource": {<br/>
　　　　　　　　　　　　"resourceType": "Organization",<br/>
　　　　　　　　　　　　"id": "2",<br/>
　　　　　　　　　　　　"meta": {<br/>
　　　　　　　　　　　　　　"versionId": "1",<br/>
　　　　　　　　　　　　　　"lastUpdated": "2021-10-07T18:30:14.792+09:00"<br/>
　　　　　　　　　　　　},<br/>
　　　　　　　　　　　　"text": {<br/>
　　　　　　　　　　　　　　"status": "generated",<br/>
　　　　　　　　　　　　　　"div": "&lt;div xmlns=\"http://www.w3.org/1999/xhtml\"&gt;&lt;ul&gt;&lt;li&gt;1310000001&lt;/li&gt;&lt;li&gt;クリニックX&lt;/li&gt;&lt;li&gt;〒163-0490 東京都新宿区西新宿2-1-1&lt;/li&gt;&lt;li&gt;03-0000-0001&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;"<br/>
　　　　　　　　　　　　},<br/>
　　　　　　　　　　　　"identifier": [<br/>
　　　　　　　　　　　　　　{<br/>
　　　　　　　　　　　　　　　　"system": "http://hl7.jp/fhir/ePrescription/InsuranceMedicalInstitutionNo",<br/>
　　　　　　　　　　　　　　　　"value": "1310000001"<br/>
　　　　　　　　　　　　　　}<br/>
　　　　　　　　　　　　],<br/>
　　　　　　　　　　　　"name": "クリニックX",<br/>
　　　　　　　　　　　　"telecom": [<br/>
　　　　　　　　　　　　　　{<br/>
　　　　　　　　　　　　　　　　"system": "phone",<br/>
　　　　　　　　　　　　　　　　"value": "03-0000-0001"<br/>
　　　　　　　　　　　　　　}<br/>
　　　　　　　　　　　　],<br/>
　　　　　　　　　　　　"address": [<br/>
　　　　　　　　　　　　　　{<br/>
　　　　　　　　　　　　　　　　"text": "163-0490 東京都新宿区西新宿2-1-1"<br/>
　　　　　　　　　　　　　　}<br/>
　　　　　　　　　　　　]<br/>
　　　　　　　　　　},<br/>
　　　　　　　　　　"search": {<br/>
　　　　　　　　　　　　"mode": "include"<br/>
　　　　　　　　　　}<br/>
　　　　　　　　},<br/>
　　　　　　　　"version": "1"<br/>
　　　　　　}<br/>
　　　　]<br/>
　　}<br/>
}<br/>
<br/>
異常終了<br/>
{<br/>
　　"errorCode": "PLAT500",<br/>
　　"errorMessage": "例外内容"<br/>
}<br/>
<!-- ↑↑↑ここに書く↑↑↑ -->
</td></tr></table>

### 備考
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
なし
<!-- ↑↑↑ここに書く↑↑↑ -->
</td></tr></table>

----

[戻る](../../../1.API一覧.md)