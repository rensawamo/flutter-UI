# di
依存関係を取り除き、外部から受け取れるようにすること
疎結合を担保する

## 使い方

生成して登録
```sh
locator.registerFactory<AppService>(() => AppService());
```

取り出す （別の場所でも完全に同じインスタンスが作成される）
```sh
locator<AppService>().execute();
```
