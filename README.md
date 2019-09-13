# BACKPACKER's note


旅をする人の情報共有を目的としたアプリケーションです。  

## サイトURL

.....  

## 環境

使用言語  
- ruby 2.6.2  
- rails 5.2.3    

データーベース  
- mysql 8.0.17    

開発環境  
- Docker for Mac    

本番環境  
- AWS  
  - EC2  
  - RDS  
  - S3  
  - Route53  


## 主な機能

- CRUD機能(ユーザー、ノートに使用)  
- ログイン機能(ユーザーに使用)  
- コメント機能(ノートにコメントができる仕様)  
- 画像アップロード機能(active storageを使用、複数アップ可)  
- お気に入り機能  
- １対１のメッセージ機能  
- 検索機能(ransackを使用)、タグ検索機能  
- ユーザー管理機能  
- ページネーション機能  
- AJAX通信(お気に入り機能、コメント機能で実装)  
- i18nによる国際化  
- bootstrapによるデザイン(グリットシステム含む)  
- Rspecによるテスト  
  - 単体テスト(model spec, controller spec)  
  - 統合テスト(system spec)  
  - factory_bot  

## 今後の課題
- フォロー機能の実装  
- googoleマップAPIと連携し地図表示を実装する  
- 各機能の必要なテストを増やす
- Dockerの理解を深める
