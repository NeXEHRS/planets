| 機能ID | API論理名 | HTTPメソッド | URI |
| :--- | :--- | :--- | :--- |
| PTP_DOC_006 | 【登録】特定文書　（※一括登録含む）（患者用） | POST | {applicationPath}/participants/patients/documents |

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
| - |  | | |  |  |

### リクエスト（パスパラメータ）
| No. | 項目名 | 物理名 | 属性 | Nullable | 設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--- |
| - |  | | |  |  |

### リクエスト(Body)
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | リクエスト設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| 1 | Bundleの登録対象リスト | bundleList | ○ |  |  |  |  |  | - | object | - |  |
| 2 | Bundle構造体 |  |  | ○ |  |  |  |  | ○ | - | - | OpenFRUCtoSのBundleリソースの仕様に準拠する<br/>[参考：3.Bundleリソース構造体について](../../../9.API補足説明資料/3.Bundleリソース構造体について.md) |

### サンプル（リクエスト）
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
{<br/>
　　"bundleList":[<br/>
　　　　{<br/>
　　　　　　"resourceType": "Bundle",<br/>
　　　　　　"id": "1",<br/>
　　　　　　"meta": {<br/>
　　　　　　　　"versionId": "1",<br/>
　　　　　　　　"lastUpdated": "2021-07-12T13:55:48.899+09:00"<br/>
　　　　　　},<br/>
　　　　　　"identifier": {<br/>
　　　　　　　　"system": "urn:ietf:rfc:3986",<br/>
　　　　　　　　"value": "urn:uuid:48eb2225-4947-19f4-f59f-0b048ebae42e"<br/>
　　　　　　},<br/>
　　　　　　"type": "document",<br/>
　　　　　　"timestamp": "2021-03-01T09:00:00+09:00",<br/>
　　　　　　"entry": [<br/>
　　　　　　　　{<br/>
　　　　　　　　　　"fullUrl": "urn:uuid:cb6a36fb-f7ce-ddb7-40d2-e918d90149f7",<br/>
　　　　　　　　　　"resource": {<br/>
　　　　　　　　　　　　"resourceType": "Composition",<br/>
　　　　　　　　　　　　"id": "urn:uuid:24ada691-1828-4ff9-9694-9705e0ffbbe7",<br/>
　　　　　　　　　　　　"text": {<br/>
　　　　　　　　　　　　　　"status": "generated",<br/>
　　　　　　　　　　　　　　"div": "&lt;div xmlns=\"http://www.w3.org/1999/xhtml\"&gt;処方箋サンプル&lt;/div&gt;"<br/>
　　　　　　　　　　　　},<br/>
　　　　　　　　　　　　"identifier": {<br/>
　　　　　　　　　　　　　　"system": "urn:oid:1.2.392.100495.20.3.11",<br/>
　　　　　　　　　　　　　　"value": "11310000001000001000001"<br/>
　　　　　　　　　　　　},<br/>
　　　　　　　　　　　　"status": "preliminary",<br/>
　　　　　　　　　　　　"type": {<br/>
　　　　　　　　　　　　　　"coding": [<br/>
　　　　　　　　　　　　　　　　{<br/>
　　　　　　　　　　　　　　　　　　"system": "urn:oid:1.2.392.100495.20.2.11",<br/>
　　　　　　　　　　　　　　　　　　"code": "01",<br/>
　　　　　　　　　　　　　　　　　　"display": "保険医療記録"<br/>
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
　　　　　　　　　　　　　　　　"display": "TISサンプルA病院"<br/>
　　　　　　　　　　　　　　}<br/>
　　　　　　　　　　　　],<br/>
　　　　　　　　　　　　"title": "処方箋サンプル_患者1_A病院_医師A1",<br/>
　　　　　　　　　　　　"event": [<br/>
　　　　　　　　　　　　　　{<br/>
　　　　　　　　　　　　　　　　"code": [<br/>
　　　　　　　　　　　　　　　　　　{<br/>
　　　　　　　　　　　　　　　　　　　　"text": "処方箋交付"<br/>
　　　　　　　　　　　　　　　　　　}<br/>
　　　　　　　　　　　　　　　　],<br/>
　　　　　　　　　　　　　　　　"period": {<br/>
　　　　　　　　　　　　　　　　　　"start": "2021-09-29",<br/>
　　　　　　　　　　　　　　　　　　"end": "2021-09-29"<br/>
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
　　　　　　　　},<br/>
　　　　　　}<br/>
・・・省略・・・<br/>
　　　　}<br/>
　　]<br/>
}<br/>
<!-- ↑↑↑ここに書く↑↑↑ -->
</td></tr></table>

### レスポンス
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | レスポンス設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| 1 | Bundleの登録結果リスト | bundleResultList | ○ |  |  |  |  |  | ○ | array | - |  |
| 2 | 医療機関ID | organizationId |  | ○ |  |  |  |  | - | string | - |  |
| 3 | 状態 | status |  | ○ |  |  |  |  | - | string | - | success：正常 |
| 4 | 診断内容 | diagnostics |  | ○ |  |  |  |  | - | string | ○ |  |
| 5 | ID | id |  | ○ |  |  |  |  | - | string | - | Bundle ID |
| 6 | 文書キー | documentKey |  | ○ |  |  |  |  | - | string | - |  |

| エラー条件 | 
| :--- |
| システムエラー<br/>・API共通仕様に準拠<br/>業務エラー<br/>・なし |

### サンプル（レスポンス）
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
正常終了<br/>
{<br/>
　　"bundleResultList": [<br/>
　　　　{<br/>
　　　　　　"organizationId": "1310000001",<br/>
　　　　　　"status": "success",<br/>
　　　　　　"diagnostics": "",<br/>
　　　　　　"id": "30",<br/>
　　　　　　"documentKey": "urn:uuid:48eb2225-4947-19f4-f59f-0b048ebae42e"<br/>
　　　　}<br/>
　　]<br/>
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