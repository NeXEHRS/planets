| 機能ID | API論理名 | HTTPメソッド | URI |
| :--- | :--- | :--- | :--- |
| PRV_ROL_003 | 【登録】権限の要求（承認済み）（医療機関用） | POST | {applicationPath}/providers/permissions/approval |

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
| 1 | コメント | comment | ○ |  |  |  |  |  | - | string | - | 権限承認の際のコメント |
| 2 | 権限要求リスト | permissionApproval | ○ |  |  |  |  |  | ○ | array | - |  |
| 3 | 許可可能者ID（医療機関） | allowableOrganizationId |  | ○ |  |  |  |  | - | string | - | 組織単位で設定する際は必須 |
| 4 | 許可可能者ID（診療科） | allowableDepartmentId |  | ○ |  |  |  |  | - | string | ○ | 組織単位で設定する際に診療科まで許可者を絞る際は設定 |
| 5 | 許可可能者ID（個人） | allowablePersonalId |  | ○ |  |  |  |  | - | string | - | 個人単位で設定する際は必須 |
| 6 | 権限リスト | permissionList | ○ |  |  |  |  |  | ○ | array | - |  |
| 7 | 権限保持対象区分 | classification |  | ○ |  |  |  |  | - | string | - | 1:個人、2:組織 |
| 8 | 許可者ID | permissionId |  | ○ |  |  |  |  | - | string | - | 付与する対象者のPLAT_IDまたはSTAFF_IDを設定 |
| 9 | 権限種別 | type |  | ○ |  |  |  |  | - | string | - | "01:ReadOnly(参照のみ)<br/>02:UpdateOnly(参照、更新、削除)<br/>03:FullAccess(参照、登録、更新、削除)<br/>04:AccessDeny(権限無し)" |
| 10 | 有効期限（開始） | expirationFrom |  | ○ |  |  |  |  | - | date | - | 権限の有効期限（FROM） |
| 11 | 有効期限（終了） | expirationTo |  | ○ |  |  |  |  | - | date | - | 権限の有効期限（TO） |
| 12 | 権限詳細リスト | detailList |  | ○ |  |  |  |  | ○ | array | - |  |
| 13 | 対象パス | path |  |  | ○ |  |  |  | - | string | ○ | 権限チェック対象の階層パス |
| 14 | 演算子 | operator |  |  | ○ |  |  |  | - | string | ○ | "パスに対して値をどうチェックするか<br/>01:＝ ※ 現時点では「＝」のみ" |
| 15 | 値 | value |  |  | ○ |  |  |  | - | string | ○ | 階層パスのチェックする値 |

### サンプル（リクエスト）
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
医療機関が患者へ保険医療記録の閲覧権限を要求する場合<br/>
{<br/>
　　"comment": "患者1への権限要求",<br/>
　　"permissionApproval": [<br/>
　　　　{<br/>
　　　　　　"allowablePersonalId": "6d86c3e2-aa16-6a0c-89df-a4d40bcc83ca"　→　患者のPLAT共通IDを設定<br/>
　　　　}<br/>
　　],<br/>
　　"permissionList": [<br/>
　　　　{<br/>
　　　　　　"classification": "2",<br/>
　　　　　　"permissionId": "1310000001", →医療機関IDを設定<br/>
　　　　　　"type": "01",<br/>
　　　　　　"expirationFrom": "Mar 2, 2021, 1:00:00 AM",<br/>
　　　　　　"expirationTo": "Mar 2, 2025, 1:00:00 AM",<br/>
　　　　　　"detailList": [<br/>
　　　　　　　　{<br/>
　　　　　　　　　　"path": "Composition.subject:Patient.identifier",<br/>
　　　　　　　　　　"operator": "01",<br/>
　　　　　　　　　　"value": "https://www.plat.org/|6d86c3e2-aa16-6a0c-89df-a4d40bcc83ca"<br/>
　　　　　　　　},<br/>
　　　　　　　　{<br/>
　　　　　　　　　　"path": "type.coding.code",　→BundleのPath（文書タイプ）<br/>
　　　　　　　　　　"operator": "01",　<br/>
　　　　　　　　　　"value": "01"　→文書タイプの値<br/>
　　　　　　　　}<br/>
　　　　　　]<br/>
　　　　}<br/>
　　]<br/>
}<br/>
<!-- ↑↑↑ここに書く↑↑↑ -->
</td></tr></table>

### レスポンス
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | レスポンス設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| 1 | 権限管理オブジェクト | permissonGroup | ○ |  |  |  |  |  | - | object | - |  |
| 2 | 権限グループ管理ID | permissionGroupId |  | ○ |  |  |  |  | - | string | - |  |
| 3 | ステータス | status |  | ○ |  |  |  |  | - | string | - | 権限の承認状態を設定する。<br/>0:承認要求中<br/>1:承認済み<br/>2:承認拒否<br/>3:承認取下げ |
| 4 | 権限要求者ID（医療機関） | requestedOrganizationId |  | ○ |  |  |  |  | - | string | - |  |
| 5 | 権限要求者ID（診療科） | requestedDepartmentId |  | ○ |  |  |  |  | - | string | - |  |
| 6 | 権限要求者ID（個人） | requestedPersonalId |  | ○ |  |  |  |  | - | string | - |  |
| 7 | 権限要求日時 | requestedDatetime |  | ○ |  |  |  |  | - | string | - |  |
| 8 | 権限リスト | permissionList | ○ |  |  |  |  |  | ○ | array | - |  |
| 9 | 権限管理ID | permissionManagementId |  | ○ |  |  |  |  | - | string | - |  |
| 10 | 権限保持対象区分 | classification |  | ○ |  |  |  |  | - | string | - | 1:個人、2:組織 |
| 11 | 許可者ID | permissionId |  | ○ |  |  |  |  | - | string | - | 付与する対象者のPLAT_IDまたはSTAFF_IDを設定 |
| 12 | 権限種別 | type |  | ○ |  |  |  |  | - | string | - | 01:ReadOnly(参照のみ)<br/>02:UpdateOnly(参照、更新、削除)<br/>03:FullAccess(参照、登録、更新、削除)<br/>04:AccessDeny(権限無し) |
| 13 | 有効期限（開始） | expirationFrom |  | ○ |  |  |  |  | - | date | - | 権限の有効期限（FROM） |
| 14 | 有効期限（終了） | expirationTo |  | ○ |  |  |  |  | - | date | - | 権限の有効期限（TO） |
| 15 | 権限詳細リスト | detailList |  | ○ |  |  |  |  | ○ | array | - |  |
| 16 | 対象パス | path |  |  | ○ |  |  |  | - | string | - | 権限チェック対象の階層パス |
| 17 | 演算子 | operator |  |  | ○ |  |  |  | - | string | - | パスに対して値をどうチェックするか<br/>01:＝ ※ 現時点では「＝」のみ |
| 18 | 値 | value |  |  | ○ |  |  |  | - | string | - | 階層パスのチェックする値 |
| 19 | 権限承認リスト | permissionApproval | ○ |  |  |  |  |  | ○ | array | - |  |
| 20 | ステータス | status |  | ○ |  |  |  |  | - | string | - | 権限の承認状態を設定する。<br/>0:承認要求中<br/>1:承認済み<br/>2:承認拒否<br/>3:承認取下げ |
| 21 | 権限承認者ID（医療機関） | allowableOrganizationId |  | ○ |  |  |  |  | - | string | - |  |
| 22 | 権限承認者ID（診療科） | allowableDepartmentId |  | ○ |  |  |  |  | - | string | - |  |
| 23 | 権限承認者ID（個人） | allowablePersonalId |  | ○ |  |  |  |  | - | string | - |  |
| 24 | 承認日時 | approvedDatetime |  | ○ |  |  |  |  | ○ | date | - |  |
| 25 | 権限コメントリスト | permissionComment | ○ |  |  |  |  |  | ○ | array | - |  |
| 26 | 医療機関ID | organizationId |  | ○ |  |  |  |  | - | string | - |  |
| 27 | 診療科ID | departmentId |  | ○ |  |  |  |  | - | string | - |  |
| 28 | 個人ID | personalId |  | ○ |  |  |  |  | - | string | - |  |
| 29 | コメント | comment |  | ○ |  |  |  |  | - | string | - |  |

| エラー条件 | 
| :--- |
| システムエラー<br/>・API共通仕様に準拠<br/>業務エラー<br/>・なし |

### サンプル（レスポンス）
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
正常終了<br/>
{<br/>
　　"permissionGroup": {<br/>
　　　　"permissionGroupId": "d79650b4-1f72-4ee8-85dd-1aaa049d0da9",<br/>
　　　　"status": "0",<br/>
　　　　"requestedOrganizationId": "1310000001",<br/>
　　　　"requestedDepartmentId": "",<br/>
　　　　"requestedPersonalId": "faab8ced-33ce-4ef9-800a-7c8310020ecc",<br/>
　　　　"requestedDatetime": "Oct 6, 2021, 9:44:07 PM"<br/>
　　},<br/>
　　"permissionList": [<br/>
　　　　{<br/>
　　　　　　"detailList": [<br/>
　　　　　　　　{<br/>
　　　　　　　　　　"path": "Composition.subject:Patient.identifier",<br/>
　　　　　　　　　　"operator": "01",<br/>
　　　　　　　　　　"value": "https://www.plat.org/|0034fff5-296b-4ece-b2b8-a97e34ae5cf2"<br/>
　　　　　　　　},<br/>
　　　　　　　　{<br/>
　　　　　　　　　　"path": "type.coding.code",<br/>
　　　　　　　　　　"operator": "01",<br/>
　　　　　　　　　　"value": "01"<br/>
　　　　　　　　}<br/>
　　　　　　],<br/>
　　　　　　"permissionManagementId": "c42e5ca3-fb57-4e5a-9b75-a9b08aeddda4",<br/>
　　　　　　"classification": "1",<br/>
　　　　　　"permissionId": "faab8ced-33ce-4ef9-800a-7c8310020ecc",<br/>
　　　　　　"type": "01",<br/>
　　　　　　"expirationFrom": "Mar 2, 2021, 1:00:00 AM",<br/>
　　　　　　"expirationTo": "Feb 23, 2022, 1:00:00 AM"<br/>
　　　　}<br/>
　　],<br/>
　　"permissionApproval": [<br/>
　　　　{<br/>
　　　　　　"status": "0",<br/>
　　　　　　"allowablePersonalId": "0034fff5-296b-4ece-b2b8-a97e34ae5cf2",<br/>
　　　　　　"approvedDatetime": "Feb 23, 2021, 1:00:00 AM"<br/>
　　　　}<br/>
　　],<br/>
　　"permissionComment": [<br/>
　　　　{<br/>
　　　　　　"organizationId": "1310000001",<br/>
　　　　　　"departmentId": "",<br/>
　　　　　　"personalId": "faab8ced-33ce-4ef9-800a-7c8310020ecc",<br/>
　　　　　　"comment": "クリニックX医師Bへの権限承認をお願いします"<br/>
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