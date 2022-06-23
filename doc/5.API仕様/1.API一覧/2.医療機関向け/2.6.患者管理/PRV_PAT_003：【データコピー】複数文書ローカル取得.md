| 機能ID | API論理名 | HTTPメソッド | URI |
| :--- | :--- | :--- | :--- |
| PRV_PAT_003 | 【データコピー】複数文書ローカル取得 | POST | {applicationPath}/providers/patients/document/copy/{patientId}/{startDate} |

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
|  | なし |  |  |  |  |

### リクエスト（パスパラメータ）
| No. | 項目名 | 物理名 | 属性 | Nullable | 設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--- |
| 1 | 患者ID | patientId | string | - | URLエンコードを行う |
| 2 | 取得開始日 | startDate | string | - | YYYYMMDD形式で指定 |

### リクエスト(Body)
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | リクエスト設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| 1 | Patientの登録対象オブジェクト | patientResource | ○ |  |  |  |  |  | - | object | - |  |
| 2 | Patient構造体 |  |  | ○ |  |  |  |  | - | - | - | OpenFRUCtoSのPatientリソースの仕様に準拠する |

### サンプル（リクエスト）
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
{applicationPath}/providers/patients/document/copy/clinicX_p00001/20110901
<!-- ↑↑↑ここに書く↑↑↑ -->
</td></tr></table>

### レスポンス
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | レスポンス設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| 1 | Bundleの登録結果リスト | bundleResultList | ○ |  |  |  |  |  | ○ | array | - |  |
| 2 | 医療機関ID | organizationId |  | ○ |  |  |  |  | - | string | - |  |
| 3 | 状態 | status |  | ○ |  |  |  |  | - | string | - | success：正常 |
| 4 | 診断内容 | diagnostics |  | ○ |  |  |  |  | - | string | ○ |  |
| 5 | ID | id |  | ○ |  |  |  |  | - | string | - | BundleID |
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
　　　　},<br/>
　　　　{<br/>
　　　　　　"organizationId": "1310000001",<br/>
　　　　　　"status": "success",<br/>
　　　　　　"diagnostics": "",<br/>
　　　　　　"id": "33",<br/>
　　　　　　"documentKey": "urn:uuid:4b46f0a9-a5a6-3ef5-20de-8ab83f0629bf"<br/>
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