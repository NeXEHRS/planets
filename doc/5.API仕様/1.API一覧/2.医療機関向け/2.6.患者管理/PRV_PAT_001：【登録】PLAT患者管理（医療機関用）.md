| 機能ID | API論理名 | HTTPメソッド | URI |
| :--- | :--- | :--- | :--- |
| PRV_PAT_001 | 【登録】PLAT患者管理（医療機関用） | POST | {applicationPath}/providers/patients |

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
| - |  |  |  |  |  |

### リクエスト（パスパラメータ）
| No. | 項目名 | 物理名 | 属性 | Nullable | 設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--- |
| - |  |  |  |  |  |

### リクエスト(Body)
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | リクエスト設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| 1 | Patientの登録対象オブジェクト | patientResource | ○ |  |  |  |  |  | - | object | - |  |
| 2 | Patient構造体 |  |  | ○ |  |  |  |  | - | - | - | OpenFRUCtoSのPatientリソースの仕様に準拠する<br/>[参考：4.Patientリソース構造体について](../../../9.API補足説明資料/4.Patientリソース構造体について.md) |

### サンプル（リクエスト）
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
{<br/>
　　"patientResource": {<br/>
　　　　"resourceType": "Patient",<br/>
　　　　"text": {<br/>
　　　　　　"status": "generated",<br/>
　　　　　　"div": "&lt;div xmlns=\"http://www.w3.org/1999/xhtml\"&gt;～～～&lt;/div&gt;"<br/>
　　　　},<br/>
　　　　"identifier": [<br/>　
　　　　　　{<br/>
　　　　　　　　"system": "https://www.plat.org/",　<font color="red">→PLAT共通ID用の値（固定）</font><br/>
　　　　　　　　"value": "d2db2727-eb07-2e54-fcbd-5ed011499cb7"　<font color="red">→PLAT共通IDを設定</font><br/>
　　　　　　},<br/>
　　　　　　{<br/>
　　　　　　　　"system": "urn:oid:1.2.392.100495.20.3.51.11310000001",　<font color="red">→"1.2.392.100495.20.3.51." は固定。11310000001は"1"(固定値) + 対象医療機関の医療機関コードを設定</font><br/>
　　　　　　　　"value": "clinicX_p00001"　<font color="red">→病院ごとの患者IDを設定</font><br/>
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
}<br/>
<!-- ↑↑↑ここに書く↑↑↑ -->
</td></tr></table>

### レスポンス
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | レスポンス設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| 1 | Patient構造体 |  | ○ |  |  |  |  |  |  | - | - | OpenFRUCtoSのPatientリソースの仕様に準拠する |

| エラー条件 | 
| :--- |
| システムエラー<br/>・API共通仕様に準拠<br/>業務エラー<br/>・なし |

### サンプル（レスポンス）
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
正常終了<br/>
{<br/>
　　"resourceType": "Patient",<br/>
　　"id": "10",<br/>
　　"meta": {<br/>
　　　　"versionId": "1",<br/>
　　　　"lastUpdated": "2021-10-08T21:12:58.924+09:00"<br/>
　　},<br/>
　　"text": {<br/>
　　　　"status": "generated",<br/>
　　　　"div": "&lt;div xmlns=\"http://www.w3.org/1999/xhtml\"&gt;～～～&lt;/div&gt;"<br/>
　　},<br/>
　　"identifier": [<br/>
　　　　{<br/>
　　　　　　"system": "https://www.plat.org/",<br/>
　　　　　　"value": "025a20e7-f68c-40ad-8bce-2afcc69cc8bd"<br/>
　　　　},<br/>
　　　　{<br/>
　　　　　　"system": "urn:oid:1.2.392.100495.20.3.51.11310000001",<br/>
　　　　　　"value": "clinicX_p00001"<br/>
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