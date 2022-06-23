| 機能ID | API論理名 | HTTPメソッド | URI |
| :--- | :--- | :--- | :--- |
| COM_ATH_001 | 【認証】認証エンドポイント | POST | {KeycloakPath}/auth/realms/{organization_id}/protocol/openid-connect/auth |

| 連携方式 | データ形式 | 利用可能な接続先 |
| :--- | :--- | :--- |
| HTTPRequest | HTTP Response(HTML) | ローカル、リモート |

### リクエストヘッダー
| No. | 項目名 | 物理名 | 属性 | Nullable | 設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--- |
| - |  |  |  |  |  |

### リクエスト（クエリ）
| No. | 項目名 | 物理名 | 属性 | Nullable | 設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--- |
| 1 | レスポンスタイプ | response_type | string | - | "code"もしくは"token"を設定 |
| 2 | クライアントID | client_id | string | - | 接続先のクライアントIDを設定 |
| 3 | リダイレクトURI | redirect_uri | string | - | 認証処理完了後にレスポンスが返却されるURI |
| 4 | スコープ | scope | string | - | "offline_access"(固定) ※トークン取得処理でIDトークンも取得したい場合は"openid"を設定する |
| 5 | ステート | state | string | ○ | 推定されにくい任意の文字列 |
| 6 | コードチャレンジ | code_challenge | string | ○ | 推定されにくい任意の文字列をSHA２５６暗号化し、Base64符号化した文字列 |
| 7 | PKCEメソッド | code_challenge_method | string | ○ | "S256"(固定) |

### リクエスト（パスパラメータ）
| No. | 項目名 | 物理名 | 属性 | Nullable | 設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--- |
| 1 | 組織ID | organization_id | string | - | 組織IDを設定 ※患者用の場合、「0000000000」を設定 |

### リクエスト(Body)
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | リクエスト設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| - |  |  |  |  |  |  |  |  |  | |  |  |

### サンプル（リクエスト）
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
/auth/realms/1310000001/protocol/openid-connect/auth<br/>
?response_type=code<br/>
&client_id=clientid1<br/>
&redirect_uri=customscheme://callback<br/>
&scope=openid<br/>
&state=gs7w643r8fwe<br/>
&code_challenge=asdf773645+jhee***<br/>
&code_challenge_method=S256
<!-- ↑↑↑ここに書く↑↑↑ -->
</td></tr></table>

### レスポンス
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | レスポンス設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| 1 |  | 画面HTML |  |  |  |  |  |  | ○ | string | - |  |

| エラー条件 | 
| :--- |
| システムエラー<br/>・API共通仕様に準拠<br/>業務エラー<br/>・なし |

### サンプル（レスポンス）
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
認証画面のHTML
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