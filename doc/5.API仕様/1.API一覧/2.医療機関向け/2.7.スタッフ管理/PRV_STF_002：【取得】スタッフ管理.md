| 機能ID | API論理名 | HTTPメソッド | URI |
| :--- | :--- | :--- | :--- |
| PRV_STF_002 | 【取得】スタッフ管理 | GET | {applicationPath}/providers/staffs/{staffId} |

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
| 1 | 名称 | name | string | ○ | 漢字もしくはカナの前方一致検索 |

### リクエスト（パスパラメータ）
| No. | 項目名 | 物理名 | 属性 | Nullable | 設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--- |
| 1 | スタッフID | staffId | string | - | スタッフIDを設定する。クエリパラメータ指定が無い場合は必須入力となる。 |

### リクエスト(Body)
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | リクエスト設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| - |  |  |  |  |  |  |  |  |  |  |  |  |

### サンプル（リクエスト）
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
＜パスパラメータ指定の場合＞<br/>
　　{applicationPath}/providers/staffs/3fa04331-85fd-4cb5-819d-d240145a74ca<br/>
＜クエリパラメータ指定の場合＞<br/>
　　{applicationPath}/providers/staffs?name=ヤマダタロウ
<!-- ↑↑↑ここに書く↑↑↑ -->
</td></tr></table>

### レスポンス
| No. | 項目名 | 物理名 | L1 | L2 | L3 | L4 | L5 | L6 | 繰返し | 属性 | Nullable | レスポンス設定要領 |
| :--- | :--- | :--- | :--: | :--: | :--: | :--: | :--: | :--: | :--- | :--- | :--- | :--- |
| 1 | リスト | - | ○ |  |  |  |  |  |  | array | - |  |
| 2 | スタッフID | staffId |  | ○ |  |  |  |  |  | string | - |  |
| 3 | 救急フラグ | emergencyFlg |  | ○ |  |  |  |  |  | string | - | 0:通常、1:救急 |
| 4 | 名前(漢字) | nameKanji |  | ○ |  |  |  |  |  | string | - |  |
| 5 | 名前(カナ) | namekana |  | ○ |  |  |  |  |  | string | - |  |
| 6 | バージョン | version |  | ○ |  |  |  |  |  | string | - |  |
| 7 | 更新日時 | updatedDatetime |  | ○ |  |  |  |  |  | string | - |  |

| エラー条件 | 
| :--- |
| システムエラー<br/>・API共通仕様に準拠<br/>業務エラー<br/>・なし |

### サンプル（レスポンス）
<table><tr><td>
<!-- ↓↓↓ここに書く↓↓↓ -->
正常終了<br/>
[<br/>
　　{<br/>
　　　　"staffId": "aef656e5-0735-4757-a369-83a2b34110bd",<br/>
　　　　"emergencyFlg": 0,<br/>
　　　　"nameKanji": "田中一郎",<br/>
　　　　"nameKana": "タナカイチロウ",<br/>
　　　　"version": 0,<br/>
　　　　"updatedDatetime": "Oct 7, 2021, 7:50:46 PM"<br/>
　　},<br/>
　　{<br/>
　　　　"staffId": "ececfc9e-4b53-48c0-96da-482ffdf69a95",<br/>
　　　　"emergencyFlg": 0,<br/>
　　　　"nameKanji": "佐藤次郎",<br/>
　　　　"nameKana": "サトウジロウ",<br/>
　　　　"version": 0,<br/>
　　　　"updatedDatetime": "Oct 7, 2021, 7:50:50 PM"<br/>
　　}<br/>
]<br/>
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