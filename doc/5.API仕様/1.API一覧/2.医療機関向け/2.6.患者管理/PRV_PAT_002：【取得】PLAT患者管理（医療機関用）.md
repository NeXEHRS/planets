| 機能ID | API論理名 | HTTPメソッド | URI |
| :--- | :--- | :--- | :--- |
| PRV_PAT_002 | 【取得】PLAT患者管理（医療機関用） | GET | {applicationPath}/providers/patients/{patientId} |

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
| 1 | 名前 | name | string | ○ | 漢字もしくはカナの前方一致検索 |
| 2 | 住所 | address | string | ○ | 住所を前方一致検索 |
| 3 | 電話番号 | telecom | string | ○ | 電話番号を完全一致検索 |
| 4 | 性別 | gender | string | ○ | "male" か "famale"で検索 |
| 5 | 生年月日 | birthDate | date | ○ | 生年月日を完全一致検索（YYYY-MM-DD形式） |

### リクエスト（パスパラメータ）
| No. | 項目名 | 物理名 | 属性 | Nullable | 設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--- |
| 1 | 患者ID | patientId | string | ○ | クエリパラメータ指定が無い場合は必須入力となる。 |

### リクエスト(Body)
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | リクエスト設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| - |  |  |  |  |  |

### サンプル（リクエスト）
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
＜パスパラメータ指定の場合＞<br/>
　　{applicationPath}/providers/patients/ClinicX_00002<br/>
＜クエリパラメータ指定の場合＞<br/>
　　{applicationPath}/providers/patients?name=ヤマダダロウ&birthDate=1980-01-01<br/>
<!-- ↑↑↑ここに書く↑↑↑ -->
</td></tr></table>

### レスポンス
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | レスポンス設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| 1 | 検索結果 | searchResults | ○ |  |  |  |  |  | - | object | - |  |
| 2 | 件数 | count |  | ○ |  |  |  |  | - | integer | - | 検索結果件数 |
| 3 | 取得データリスト | results |  | ○ |  |  |  |  | - | array | - |  |
| 4 | 患者情報 | patients |  |  | ○ |  |  |  | - | object | - | OpenFRUCtoSのPatientリソースの仕様に準拠する |

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
　　　　　　　　"patient": {<br/>
　　　　　　　　　　"resourceType": "Patient",<br/>
　　　　　　　　　　"text": {<br/>
　　　　　　　　　　　　"status": "generated",<br/>
　　　　　　　　　　　　"div": "&lt;div xmlns=\"http://www.w3.org/1999/xhtml\"&gt;～～～&lt;/div&gt;"<br/>
　　　　　　　　　　},<br/>
　　　　　　　　　　"identifier": [<br/>
　　　　　　　　　　　　{<br/>
　　　　　　　　　　　　　　"system": "https://www.plat.org/",<br/>
　　　　　　　　　　　　　　"value": "d2db2727-eb07-2e54-fcbd-5ed011499cb7"<br/>
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
　　　　　　}<br/>
　　　　]<br/>
　　}<br/>
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