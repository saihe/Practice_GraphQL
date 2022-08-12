# メモ

## Restとの違い

- Restはリソースごとにエンドポイントを作成するが、GraphQLではエンドポイントは全て同じ
  - クエリの内容をリゾルバで解釈して処理を分ける仕組み
- RestはHTTPメソッドによって処理を分けていたが、GraphQLでは全てPOSTになる
  - クエリの（ry

## リクエストメモ

- 取得でも更新系でもPOSTのみ
- application/jsonのみっぽい
- リクエストボディのJSONは以下の漢字
  - 取得→{"query": "{メソッド名{取得項目を半角スペース区切りで列挙、ネストする場合はさらにエンティティを列挙し波括弧を追加}}"}
  - 更新→{"query": "mutation{メソッド名(input: {パラメータをJSON形式できさい}){レスポンスの取得項目を半角スペース区切りで列挙}}"}
- 更新の `mutaion` とか丸括弧の中の `input:` はそうしないとダメなのか、リゾルバの定義のよるのかはわからない

### query

``` sh
curl -X POST http://localhost:8080/query -H 'content-type: application/json' -d '{"query": "{todos{text done user {name}}}"}'
```

### mutation

``` sh
curl -X POST http://localhost:8080/query -H 'content-type: application/json' -d '{"query": "mutation{createTodo(input: {text: \"todo\", userId: \"1\"}){id}}"}'
```
