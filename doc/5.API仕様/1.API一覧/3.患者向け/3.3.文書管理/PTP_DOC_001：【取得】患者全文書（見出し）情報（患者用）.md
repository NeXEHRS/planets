| 機能ID | API論理名 | HTTPメソッド | URI |
| :--- | :--- | :--- | :--- |
| PTP_DOC_001 | 【取得】患者全文書（見出し）情報（患者用） | GET | {applicationPath}/participants/patients/{patientId}/compositions |

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
| 1 | 参照先 | location | string | ○ | ”self”/”remote”/"all"もしくは医療機関IDのカンマ区切りをURLエンコードを行い指定 |
| 2 | 検索開始日 | consultationDayFrom | string | ○ | 診療日の検索開始日　YYYY-MMM-DD形式 |
| 3 | 検索開始日 | consultationDayTo | string | ○ | 診療日の検索終了日　YYYY-MMM-DD形式 |

### リクエスト（パスパラメータ）
| No. | 項目名 | 物理名 | 属性 | Nullable | 設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--- |
| 1 | 患者ID | patientId | string | - | PLAT共通IDをURLエンコードを行い設定 |

### リクエスト(Body)
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | リクエスト設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| - |  |  |  |  |  |  |  |  |  | |  |  |

### サンプル（リクエスト）
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
{applicationPath}/participants/patients/11310000001000001/compositions
<!-- ↑↑↑ここに書く↑↑↑ -->
</td></tr></table>

### レスポンス
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | レスポンス設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| 1 | 検索結果 | searchResults | ○ |  |  |  |  |  | - | object | - |  |
| 2 | 件数 | count |  | ○ |  |  |  |  | - | integer | - | 検索結果件数 |
| 3 | リモート存在フラグ | remoteDataExists |  | ○ |  |  |  |  | - | boolean | - | ローカルにないデータがリモートに存在する場合、true |
| 4 | 取得データリスト | results |  | ○ |  |  |  |  | ○ | array | - |  |
| 5 | 医療機関情報 | organization |  |  | ○ |  |  |  | - | string | - | OpenFRUCtoSのOganizationリソースの仕様に準拠する |
| 6 | Composition情報 | contents |  |  | ○ |  |  |  | - | string | - | OpenFRUCtoSのOganizationリソースの仕様に準拠する |

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
　　”remoteDataExists”: true,<br/>
　　"results": [<br/>
　　　　{<br/>
　　　　　　"organization": {<br/>
　　　　　　　　"fullUrl": "urn:uuid:4081daf3-d25d-42ce-9ff9-815d749b0e19",<br/>
　　　　　　　　"resource": {<br/>
　　　　　　　　　　"resourceType": "Organization",<br/>
　　　　　　　　　　"id": "urn:uuid:4081daf3-d25d-42ce-9ff9-815d749b0e19",<br/>
　　　　　　　　　　"text": {<br/>
　　　　　　　　　　　　"status": "generated",<br/>
　　　　　　　　　　　　"div": "&lt;div xmlns=\"http://www.w3.org/1999/xhtml\"&gt;&lt;ul&gt;&lt;li&gt;1310000001&lt;/li&gt;&lt;li&gt;クリニックX&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;"<br/>
　　　　　　　　　　},<br/>
　　　　　　　　　　"identifier": [<br/>
　　　　　　　　　　　　{<br/>
　　　　　　　　　　　　　　"system": "http://hl7.jp/fhir/ePrescription/InsuranceMedicalInstitutionNo",<br/>
　　　　　　　　　　　　　　"value": "1310000001"<br/>
　　　　　　　　　　　　}<br/>
　　　　　　　　　　],<br/>
 ・・・省略・・・<br/>
　　　　　　　　},<br/>
　　　　　　　　"contents": {<br/>
　　　　　　　　　　"fullUrl": "urn:uuid:24ada691-1828-4ff9-9694-9705e0ffbbe7",<br/>
　　　　　　　　　　"resource": {<br/>
　　　　　　　　　　　　"resourceType": "Composition",<br/>
　　　　　　　　　　　　"id": "urn:uuid:24ada691-1828-4ff9-9694-9705e0ffbbe7",<br/>	
　　　　　　　　　　　　"text": {<br/>
　　　　　　　　　　　　　　"status": "generated",<br/>
　　　　　　　　　　　　　　"div": "&lt;div xmlns=\"http://www.w3.org/1999/xhtml\"&gt;処方箋サンプル_患者1_クリニックX_医師A1&lt;/div&gt;"<br/>
　　　　　　　　　　　　},<br/>
　　　　　　　　　　　　"identifier": {<br/>
　　　　　　　　　　　　　　"system": "urn:oid:1.2.392.100495.20.3.11",<br/>
　　　　　　　　　　　　　　"value": "11310000001000001000001"<br/>
　　　　　　　　　　　　},<br/>
　　　　　　　　　　　　"status": "final",<br/>
　　　　　　　　　　　　"type": {<br/>
　　　　　　　　　　　　　　"coding": [<br/>
　　　　　　　　　　　　　　　　{<br/>
　　　　　　　　　　　　　　　　　　"system": "urn:oid:1.2.392.100495.20.2.11",<br/>
　　　　　　　　　　　　　　　　　　"code": "01",<br/>
　　　　　　　　　　　　　　　　　　"display": "処方箋"<br/>
　　　　　　　　　　　　　　　　}<br/>
　　　　　　　　　　　　　　]<br/>
　　　　　　　　　　　　},<br/>
　　　　　　　　　　　　"subject": {<br/>
　　　　　　　　　　　　　　"reference": "urn:uuid:75563685-6d0b-4c88-a735-50ff64507414",<br/>
　　　　　　　　　　　　　　"display": "TISサンプル患者1"<br/>
　　　　　　　　　　　　},<br/>
　　　　　　　　　　　　"date": "2021-03-01T09:00:00+09:00",<br/>
　　　　　　　　　　　　"author": [<br/>
　　　　　　　　　　　　　　{<br/>
　　　　　　　　　　　　　　　　"reference": "urn:uuid:738ba3db-e282-4fce-b66d-9e054c7a1987",<br/>
　　　　　　　　　　　　　　　　"display": "TISサンプル医師A1"<br/>
　　　　　　　　　　　　　　},<br/>
　　　　　　　　　　　　　　{<br/>
　　　　　　　　　　　　　　　　"reference": "urn:uuid:4081daf3-d25d-42ce-9ff9-815d749b0e19",<br/>
　　　　　　　　　　　　　　　　"display": "クリニックX"<br/>
　　　　　　　　　　　　　　}<br/>
　　　　　　　　　　　　],<br/>
　　　　　　　　　　　　"title": "処方箋サンプル_患者1_クリニックX_医師A1",<br/>	
　　　　　　　　　　　　"event": [<br/>
　　　　　　　　　　　　　　{<br/>
　　　　　　　　　　　　　　　　"code": [<br/>
　　　　　　　　　　　　　　　　　　{<br/>
　　　　　　　　　　　　　　　　　　　　"text": "処方箋交付"<br/>
　　　　　　　　　　　　　　　　　　}<br/>
　　　　　　　　　　　　　　　　],<br/>
　　　　　　　　　　　　　　　　"period": {<br/>
　　　　　　　　　　　　　　　　　　"start": "2021-03-01",<br/>
　　　　　　　　　　　　　　　　　　"end": "2021-03-07"<br/>
　　　　　　　　　　　　　　　　}<br/>
　　　　　　　　　　　　　　}<br/>
　　　　　　　　　　　　],<br/>
　　　　　　　　　　　　"section": [<br/>
　　　　　　　　　　　　　　{<br/>
　　　　　　　　　　　　　　　　"title": "処方指示BODY",<br/>
　　　　　　　　　　　　　　　　"entry": [<br/>
　　　　　　　　　　　　　　　　　　{<br/>
　　　　　　　　　　　　　　　　　　　　"reference": "urn:uuid:1a1fcd84-ba4c-456d-baf3-e3198e7c40fa"<br/>	
　　　　　　　　　　　　　　　　　　}<br/>
　　　　　　　　　　　　　　　　]<br/>
　　　　　　　　　　　　　　}<br/>
　　　　　　　　　　　　]<br/>
　　　　　　　　　　}<br/>
　　　　　　　　}<br/>
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