| 機能ID | API論理名 | HTTPメソッド | URI |
| :--- | :--- | :--- | :--- |
| PRV_ROL_005 | 【更新】権限の要求取消（医療機関用） | PUT | {applicationPath}/providers/permission/requests/{permissionApprovalId} |

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
| 1 | 権限承認ID | permissionApprovalId | string | - | 権限承認IDを設定する。 |

### リクエスト(Body)
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | リクエスト設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| - |  |  |  |  |  |  |  |  |  | |  |  |

### サンプル（リクエスト）
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
{applicationPath}/providers/permission/requests/3fa04331-85fd-4cb5-819d-d240145a74ca
<!-- ↑↑↑ここに書く↑↑↑ -->
</td></tr></table>

### レスポンス
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | レスポンス設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| 1 | 権限管理オブジェクト | permissonGroup | ○ |  |  |  |  |  | ○ | object | - |  |
| 2 | 権限グループ管理ID| permissionGroupId |  | ○ |  |  |  |  | - | string | - |  |
| 3 | ステータス | status |  | ○ |  |  |  |  | - | string | - | 権限の承認状態を設定する。<br/>0:承認要求中<br/>1:承認済み<br/>2:承認拒否<br/>3:承認取下げ |
| 4 | 権限要求者ID（医療機関） | requestedOrganizationId |  | ○ |  |  |  |  | - | string | - |  |
| 5 | 権限要求者ID（診療科） | requestedDepartmentId |  | ○ |  |  |  |  | - | string | - |  |
| 6 | 権限要求者ID（個人） | requestedPersonalId |  | ○ |  |  |  |  | - | string | - |  |
| 7 | 権限要求日時 | requestedDatetime |  | ○ |  |  |  |  | - | date | - |  |
| 8 | 権限承認リスト | permissionApproval | ○ |  |  |  |  |  | ○ | array | - |  |
| 9 | 権限承認ID | permissionApprovalId |  | ○ |  |  |  |  | - | string | - |  |
| 10 | ステータス | status |  | ○ |  |  |  |  | - | string | - | 権限の承認状態を設定する。<br/>0:承認要求中<br/>1:承認済み<br/>2:承認拒否<br/>3:承認取下げ |
| 11 | 権限承認者ID（医療機関） | allowableOrganizationId |  | ○ |  |  |  |  | - | string | - |  |
| 12 | 権限承認者ID（診療科） | allowableDepartmentId |  | ○ |  |  |  |  | - | string | - |  |
| 13 | 権限承認者ID（個人） | allowablePersonalId |  | ○ |  |  |  |  | - | string | - |  |
| 14 | 権限コメントリスト | permissionComment | ○ |  |  |  |  |  | ○ | array | - |  |
| 15 | 権限コメントID | permissionCommentId |  | ○ |  |  |  |  | - | string | - |  |
| 16 | 医療機関ID | organizationId |  | ○ |  |  |  |  | - | string | - |  |
| 17 | 診療科ID | departmentId |  | ○ |  |  |  |  | - | string | - |  |
| 18 | 個人ID | personalId |  | ○ |  |  |  |  | - | string | - |  |
| 19 | コメント | comment |  | ○ |  |  |  |  | - | string | - |  |

| エラー条件 | 
| :--- |
| システムエラー<br/>・API共通仕様に準拠<br/>業務エラー<br/>・なし |

### サンプル（レスポンス）
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
正常終了<br/>
{<br/>
　　"permissionGroup": {<br/>
　　　　"permissionGroupId": "6a7a8516-610d-4c35-bf95-9e7b5219a852",<br/>
　　　　"status": "3",<br/>
　　　　"requestedOrganizationId": "1310000001",<br/>
　　　　"requestedDepartmentId": "",<br/>
　　　　"requestedPersonalId": "ececfc9e-4b53-48c0-96da-482ffdf69a95",<br/>
　　　　"requestedDatetime": "Oct 7, 2021, 7:51:02 PM"<br/>
　　},<br/>
　　"permissionApproval": [<br/>
　　　　{<br/>
　　　　　　"status": "3",<br/>
　　　　　　"allowablePersonalId": "db04b087-52ee-4d69-9861-07e4d3db325e",<br/>
　　　　}<br/>
　　],<br/>
　　"permissionComment": [<br/>
　　　　{<br/>
　　　　　　"personalId": "db04b087-52ee-4d69-9861-07e4d3db325e",<br/>
　　　　　　"comment": "承認します"<br/>
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