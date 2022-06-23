| 機能ID | API論理名 | HTTPメソッド | URI |
| :--- | :--- | :--- | :--- |
| COM_ATH_003 | 【認証】トークン取得 | POST | {KeycloakPath}/auth/realms/{organization_id}/protocol/openid-connect/token |

| 連携方式 | データ形式 | 利用可能な接続先 |
| :--- | :--- | :--- |
| REST API | JSON形式(エンコーディング：utf-8) | ローカル、リモート |

### リクエストヘッダー
| No. | 項目名 | 物理名 | 属性 | Nullable | 設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--- |
| - |  |  |  |  |  |

### リクエスト（クエリ）
| No. | 項目名 | 物理名 | 属性 | Nullable | 設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--- |
| 1 | クライアントID | client_id | string | - | 接続先のクライアントIDを設定 |
| 2 | スコープ | scope | string | - | "offline_access"(固定) ※トークン取得処理でIDトークンも取得したい場合は"openid"を設定する |
| 3 | グラント種別 | grant_type | string | - | "authorization_code"(固定) |
| 4 | 認可コード | code | string | - | COM_ATH_001【認証】認証エンドポイントで認証成功時に取得した認可コード |
| 5 | リダイレクトURI | redirect_uri | string | - | 認証処理完了後にレスポンスが返却されるURI |
| 6 | コード検証 | code_verifier | string | - | 認証エンドポイントでcode_challengeを作成する元とした文字 |

### リクエスト（パスパラメータ）
| No. | 項目名 | 物理名 | 属性 | Nullable | 設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--- |
| 1 | 組織ID | organization_id | string | - | 組織IDを設定 ※患者用の場合、「0000000000」を設定 |

### リクエスト(Body)
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | レスポンス設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| - |  |  |  |  |  |  |  |  |  | |  |  |

### サンプル（リクエスト）
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
/auth/realms/1310000001/protocol/openid-connect/token
<!-- ↑↑↑ここに書く↑↑↑ -->
</td></tr></table>

### レスポンス
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | レスポンス設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| 1 | アクセストークン | access_token | ○ |  |  |  |  |  | - | string | - |  |
| 2 | 有効期限 | expires_in | ○ |  |  |  |  |  | - | string | - |  |
| 3 | リフレッシュトークン有効期限 | refresh_expires_in | ○ |  |  |  |  |  | - | string | - |  |
| 4 | リフレッシュトークン | refresh_token | ○ |  |  |  |  |  | - | string | - |  |
| 5 | トークン種別 | token_type | ○ |  |  |  |  |  | - | string | - |  |
| 6 | IDトークン | id_token | ○ |  |  |  |  |  | - | string | ○ | リクエスト時のscopeが"openid"の場合のみ出力される |
| 7 | アクセス不許可時間 | not-before-policy | ○ |  |  |  |  |  | - | string | - |  |
| 8 | ログインセッション状態 | session_state | ○ |  |  |  |  |  | - | string | - |  |
| 9 | スコープ | scope | ○ |  |  |  |  |  | - | string | - |  |

| エラー条件 | 
| :--- |
| システムエラー<br/>・API共通仕様に準拠<br/>業務エラー<br/>・なし |

### サンプル（レスポンス）
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
正常終了<br/>
{<br/>
　　"access_token":<br/> 　　"eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJPUEtzc～～省略～～",<br/>
　　"expires_in": 1800,<br/>
　　"refresh_expires_in": 0,<br/>
　　"refresh_token": "FVkVEtjRHBNeHVYY1kwa0ljSXBDRVQ0U0FzMHJSUnBrNHRxNW1jIn0.eyJleHAiOjE～～省略～～",<br/>
　　"token_type": "Bearer",<br/>
　　"id_token": "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJPUEtzcFVkVEtjRH～～省略～～",<br/>
　　"not-before-policy": 0,<br/>
　　"session_state": "85cefe6d-484f-44e6-a15b-5bac69ee1f09",<br/>
　　"scope": "offline_access profile email"<br/>
}<br/>
<br/>
異常終了<br/>
{<br/>
　　"error": "invalid_client",<br/>
　　"error_description": "Invalid client credentials"<br/>
}<br/>
<!-- ↑↑↑ここに書く↑↑↑ -->
</td></tr></table>

### 備考
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
<!-- ↑↑↑ここに書く↑↑↑ -->
</td></tr></table>

----

[戻る](../../../1.API一覧.md)