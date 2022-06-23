| 機能ID | API論理名 | HTTPメソッド | URI |
| :--- | :--- | :--- | :--- |
| PRV_STF_003 | 【登録】スタッフ管理（認証情報まで一括登録） | POST | {applicationPath}/providers/staffs/accounts |

| 連携方式 | データ形式 | 利用可能な接続先 |
| :--- | :--- | :--- |
| REST API | JSON形式（エンコーディング：utf-8） | ローカル |

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
| 1 | ユーザ名 | username | ○ |  |  |  |  |  |  | string | - | KeyCloakに登録するusername |
| 2 | 仮パスワード | password | ○ |  |  |  |  |  |  | string | - | KeyCloakの認証用仮パスワード |
| 3 | メールアドレス | email | ○ |  |  |  |  |  |  | string | - | KeyCloakに登録するメールアドレス情報 |
| 4 | 組織ID | organizationId | ○ |  |  |  |  |  |  | string | - |  |
| 5 | 診療科ID | departmentId | ○ |  |  |  |  |  |  | string | - |  |
| 6 | 職業 | occupation | ○ |  |  |  |  |  |  | string | - |  |
| 7 | スタッフ情報オブジェクト | staffResource | ○ |  |  |  |  |  |  | object | - |  |
| 8 | リソース種別 | resourceType |  | ○ |  |  |  |  |  | string | - | "Staff"固定 |
| 9 | 救急フラグ | emergencyFlg |  | ○ |  |  |  |  |  | string | - | 0:通常、1:救急 |
| 10 | 名称リスト | name |  | ○ |  |  |  |  |  | object | - |  |
| 11 | 拡張リスト | extension |  |  | ○ |  |  |  |  | object | - |  |
| 12 | URL | url |  |  |  | ○ |  |  |  | string | - |  |
| 13 | 値コード | valueCode |  |  |  | ○ |  |  |  | string | - | IDE：漢字、SYL：カナ　※認証情報には漢字が登録される |
| 14 | 姓 | family |  |  | ○ |  |  |  |  | string | - |  |
| 15 | 名リスト | given |  |  | ○ |  |  |  |  | object | - |  |
| 16 | 名 | - |  |  |  | ○ |  |  |  | string | - |  |

### サンプル（リクエスト）
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
{<br/>
　　"username": "yamamoto.taro",<br/>
　　"password": "plat0001",<br/>
　　"email": "yamamoto.taro@example.com",<br/>
　　"organizationId": "1310000001",<br/>
　　"departmentId": "00001",<br/>
　　"occupation": "A",<br/>
　　"staffResource": {<br/>
　　　　"resourceType": "Staff",<br/>
　　　　"emergencyFlg": false,<br/>
　　　　"name": [<br/>
　　　　　　{<br/>
　　　　　　　　"extension": [<br/>
　　　　　　　　　　{<br/>
　　　　　　　　　　　　"url": "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation",<br/>
　　　　　　　　　　　　"valueCode": "IDE"<br/>
　　　　　　　　　　}<br/>
　　　　　　　　],<br/>
　　　　　　　　"family": "山本",<br/>
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
　　　　　　　　"family": "ヤマモト",<br/>
　　　　　　　　"given": [<br/>
　　　　　　　　　　"タロウ"<br/>
　　　　　　　　]<br/>
　　　　　　}<br/>
　　　　]<br/>
　　}<br/>
}
<!-- ↑↑↑ここに書く↑↑↑ -->
</td></tr></table>

### レスポンス
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | レスポンス設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| 1 | リソース種別 | resourceType | ○ |  |  |  |  |  |  | string | - |  |
| 2 | 緊急フラグ | emergencyFlg | ○ |  |  |  |  |  |  | string | - |  |
| 3 | 名称リスト | name | ○ |  |  |  |  |  |  | array | - |  |
| 4 | 拡張リスト | extension |  | ○ |  |  |  |  |  | array | - |  |
| 5 | URL | url |  |  | ○ |  |  |  |  | string | - |  |
| 6 | 値コード | valueCode |  |  | ○ |  |  |  |  | string | - |  |
| 7 | 姓 | family |  | ○ |  |  |  |  |  | string | - |  |
| 8 | 名リスト | given |  | ○ |  |  |  |  |  | array | - |  |
| 9 | 名 | - |  |  | ○ |  |  |  |  | string | - |  |
| 10 | 識別子 | identifier | ○ |  |  |  |  |  |  | array | - |  |
| 11 | システム | system |  | ○ |  |  |  |  |  | string | - |  |
| 12 | 値 | value |  | ○ |  |  |  |  |  | string | - |  |

| エラー条件 | 
| :--- |
| システムエラー<br/>・API共通仕様に準拠<br/>業務エラー<br/>・なし |

### サンプル（レスポンス）
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
正常終了<br/>
{<br/>
　　"resourceType": "Staff",<br/>
　　"emergencyFlg": false,<br/>
　　"name": [<br/>
　　　　{<br/>
　　　　　　"extension": [<br/>
　　　　　　　　{<br/>
　　　　　　　　　　"url": "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation",<br/>
　　　　　　　　　　"valueCode": "IDE"<br/>
　　　　　　　　}<br/>
　　　　　　],<br/>
　　　　　　"family": "田中",<br/>
　　　　　　"given": [<br/>
　　　　　　　　"一郎"<br/>
　　　　　　]<br/>
　　　　},<br/>
　　　　{<br/>
　　　　　　"extension": [<br/>
　　　　　　　　{<br/>
　　　　　　　　　　"url": "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation",<br/>
　　　　　　　　　　"valueCode": "SYL"<br/>
　　　　　　　　}<br/>
　　　　　　],<br/>
　　　　　　"family": "タナカ",<br/>
　　　　　　"given": [<br/>
　　　　　　　　"イチロウ"<br/>
　　　　　　]<br/>
　　　　}<br/>
　　],<br/>
　　"identifier": [<br/>
　　　　{<br/>
　　　　　　"system": "https://www.plat.org/",<br/>
　　　　　　"value": "aef656e5-0735-4757-a369-83a2b34110bd"<br/>
　　　　}<br/>
　　]<br/>
}<br/>
<br/>
異常終了<br/>
{<br/>
　　"errorCode": "PLAT500"<br/>
}
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