| 機能ID | API論理名 | HTTPメソッド | URI |
| :--- | :--- | :--- | :--- |
| PRV_ORG_001 | 【取得】文書情報が存在する医療機関リスト | GET | {applicationPath}/providers/patient/{patientId}/organizations |

| 連携方式 | データ形式 | 利用可能な接続先 |
| :--- | :--- | :--- |
| REST API | JSON形式（エンコーディング：utf-8） | ローカル、リモート |

### リクエスト（認証）
| No. | 項目名 | 物理名 | 属性 | Nullable | 設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--- |
| 1 | アクセストークン | Authorization | string | - | 認証処理で取得したBearer Tokenを設定 |

### リクエスト（クエリ）
| No. | 項目名 | 物理名 | 属性 | Nullable | 設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--- |
| 1 | 参照先 | location | string | - | "all"もしくは医療機関IDのカンマ区切りをURLエンコードを行い指定 |
| 2 | 検索開始日 | consultationDayFrom | string | - | 診療日の検索開始日　YYYY-MMM-DD形式 |
| 3 | 検索終了日 | consultationDayTo | string | - | 診療日の検索終了日　YYYY-MMM-DD形式 |

### リクエスト（パスパラメータ）
| No. | 項目名 | 物理名 | 属性 | Nullable | 設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--- |
| 1 | 患者ID | patientId | string | - | 医師の場合は自病院の患者ID、患者の場合はPLAT共通IDをURLエンコードを行い設定 |

### リクエスト(Body)
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | リクエスト設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| - |  |  |  |  |  |  |  |  |  | |  |  |

### サンプル（リクエスト）
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
{applicationPath}/providers/patient/11310000001000001/organization?consultationDayFrom=2021-03-01
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