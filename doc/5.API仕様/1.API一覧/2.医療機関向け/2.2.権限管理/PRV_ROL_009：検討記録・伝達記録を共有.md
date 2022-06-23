| 機能ID | API論理名 | HTTPメソッド | URI |
| :--- | :--- | :--- | :--- |
| PRV_ROL_009 | 検討記録・伝達記録を共有 | POST | {applicationPath}/providers/patients/document/{documentKey}/share |

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
| 1 | 文書キー | documentKey | string | - | URLエンコードを行う |

### リクエスト(Body)
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | リクエスト設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| - |  |  |  |  |  |  |  |  |  |  |  |  |

### サンプル（リクエスト）
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
{applicationPath}/providers/patients/patients/document/urn%3Auuid%3A3e178fa0-b57e-8980-d95d-0b8c4c8f3d66/share
<!-- ↑↑↑ここに書く↑↑↑ -->
</td></tr></table>

### レスポンス
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | レスポンス設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| 1 | Bundleの登録結果リスト | bundleResultList | ○ |  |  |  |  |  | ○ | array | - |  |
| 2 | 医療機関ID | organizationId |  | ○ |  |  |  |  | - | string | - |  |
| 3 | ステータス | status |  | ○ |  |  |  |  | - | string | - | success：正常 |
| 4 | 診断内容 | diagnostics |  | ○ |  |  |  |  | - | string | - |  |
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
　　　　　　"documentKey": "urn:uuid:3e178fa0-b57e-8980-d95d-0b8c4c8f3d66"<br/>
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