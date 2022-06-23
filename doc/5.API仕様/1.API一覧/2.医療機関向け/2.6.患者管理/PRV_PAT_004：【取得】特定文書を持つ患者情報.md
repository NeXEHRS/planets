| 機能ID | API論理名 | HTTPメソッド | URI |
| :--- | :--- | :--- | :--- |
| PRV_PAT_004 | 【取得】特定文書を持つ患者情報 | GET | {applicationPath}/providers/documents/patients |

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
| 1 | 参照先 | location | string | ○ | ”self”/”remote”/"all"もしくは医療機関IDのカンマ区切りをURLエンコードを行い指定 |
| 2 | 検索条件 | conditions | string | ○ | OpenFRUCtoS固有の検索文字列　{パラメータ名}={パラメータ値}を”&”でつなげてURLエンコードを行い指定 |

### リクエスト（パスパラメータ）
| No. | 項目名 | 物理名 | 属性 | Nullable | 設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--- |
| - |  |  |  |  |  |

### リクエスト(Body)
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | リクエスト設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| - |  |  |  |  |  |

### サンプル（リクエスト）
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
{applicationPath}/providers/documents/patients
<!-- ↑↑↑ここに書く↑↑↑ -->
</td></tr></table>

### レスポンス
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | レスポンス設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| 1 | 検索結果 | results | ○ |  |  |  |  |  | ○ | array | - |  |
| 2 | 医療機関情報 | organization |  | ○ |  |  |  |  | - | string | - | OpenFRUCtoSのOganizationリソースの仕様に準拠する |
| 3 | 患者情報 | contents |  | ○ |  |  |  |  | - | string | - | OpenFRUCtoSのPatientリソースの仕様に準拠する |
| 4 | 検索結果数 | count | ○ |  |  |  |  |  | - | integer | - |  |

| エラー条件 | 
| :--- |
| システムエラー<br/>・API共通仕様に準拠<br/>業務エラー<br/>・なし |

### サンプル（レスポンス）
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
正常終了<br/>
{<br/>
　　"results":[<br/>
　　　　{<br/>
　　　　　　"organization": {<br/>
　　　　　　　　"fullUrl": "http://localhost:8099/of3/Organization/1",<br/>
　　　　　　　　"resource": {<br/>
　　　　　　　　　　"resourceType": "Organization",<br/>
　　　　　　　　　　"id": "1",<br/>
　　　　　　　　　　"meta": {<br/>
　　　　　　　　　　　　"versionId": "1",<br/>
　　　　　　　　　　　　"lastUpdated": "2021-09-24T19:41:56.646+09:00"<br/>
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
　　　　"contents":{<br/>
　　　　　　"resourceType": "Patient",<br/>
　　　　　　"id": "10",<br/>
　　　　　　"meta": {<br/>
　　　　　　　　"versionId": "1",<br/>
　　　　　　　　"lastUpdated": "2021-10-05T11:44:44.808+09:00"<br/>
　　　　　　},<br/>
　　　　　　"text": {<br/>
　　　　　　　　"status": "generated",<br/>
　　　　　　　　"div": "&lt;div xmlns=\"http://www.w3.org/1999/xhtml\"&gt;TEST&lt;/div&gt;"<br/>
　　　　　　},<br/>
　　　　　　"identifier": [<br/>
　　　　　　　　{<br/>
　　　　　　　　　　"system": "https://www.plat.org/",<br/>
　　　　　　　　　　"value": "e0930731-3d80-4097-a455-1e4aa250fd7a"<br/>
　　　　　　　　},<br/>
　　　　　　　　{<br/>
　　　　　　　　　　"system": "urn:oid:1.2.392.100495.20.3.51.11310000001",<br/>
　　　　　　　　　　"value": "11310000001000001"<br/>
　　　　　　　　}<br/>
　　　　　　],<br/>
　　　　　　"active": true,<br/>
　　　　　　"name": [<br/>
　　　　　　　　{<br/>
　　　　　　　　　　"extension": [<br/>
　　　　　　　　　　　　{<br/>
　　　　　　　　　　　　　　"url": "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation",<br/>
　　　　　　　　　　　　　　"valueCode": "IDE"<br/>
　　　　　　　　　　　　}<br/>
　　　　　　　　　　],<br/>
　　　　　　　　　　"family": "山田",<br/>
　　　　　　　　　　"given": [<br/>
　　　　　　　　　　　　"太郎"<br/>
　　　　　　　　　　]<br/>
　　　　　　　　},<br/>
　　　　　　　　{<br/>
　　　　　　　　　　"extension": [<br/>
　　　　　　　　　　　　{<br/>
　　　　　　　　　　　　　　"url": "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation",<br/>
　　　　　　　　　　　　　　"valueCode": "SYL"<br/>
　　　　　　　　　　　　}<br/>
　　　　　　　　　　],<br/>
　　　　　　　　　　"family": "ヤマダ",<br/>
　　　　　　　　　　"given": [<br/>
　　　　　　　　　　　　"タロウ"<br/>
　　　　　　　　　　]<br/>
　　　　　　　　}<br/>
　　　　　　],<br/>
　　　　　　"telecom": [<br/>
　　　　　　　　{<br/>
　　　　　　　　　　"system": "phone",<br/>
　　　　　　　　　　"value": "09099999999",<br/>
　　　　　　　　　　"use": "mobile"<br/>
　　　　　　　　}<br/>
　　　　　　],<br/>
　　　　　　"gender": "male",<br/>
　　　　　　"birthDate": "1974-12-25",<br/>
　　　　　　"deceasedBoolean": false,<br/>
　　　　　　"address": [<br/>
　　　　　　　　{<br/>
　　　　　　　　　　"use": "home",<br/>
　　　　　　　　　　"line": [<br/>
　　　　　　　　　　　　"玉手町18-50"<br/>
　　　　　　　　　　],<br/>
　　　　　　　　　　"city": "柏原市",<br/>
　　　　　　　　　　"district": "大阪府",<br/>
　　　　　　　　　　"postalCode": "5820001"<br/>
　　　　　　　　}<br/>
　　　　　　]<br/>
　　　　}<br/>
　　],<br/>
　　"count":1<br/>
}<br/>
<br/>
異常終了<br/>
{<br/>
　　"errorCode": "PLAT500"<br/>
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