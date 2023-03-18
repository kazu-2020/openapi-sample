# ベースイメージの指定
FROM node:16.17.0-bullseye-slim AS base

# 作業ディレクトリの作成
WORKDIR /app

# 環境変数を設定
ENV NODE_ENV production

# 依存関係のコピー
COPY --chown=node:node package*.json ./

# 開発ステージの定義
FROM base AS development

# 開発環境の依存関係のインストール
RUN npm ci --production=false

# プロジェクトのソースコードをコピー
COPY --chown=node:node ./ .

# 開発環境用のポートを指定
EXPOSE 3000

# Next.jsアプリケーションを開発モードで実行
CMD ["npm", "run", "dev"]

# 本番ステージの定義
FROM base AS production

# 本番環境の依存関係のみをインストール
RUN npm ci --only=production

# プロジェクトのソースコードをコピー
COPY --chown=node:node . .

# アプリケーションのビルド
RUN npm run build

# 本番環境用のポートを指定
EXPOSE 3000

# Next.jsアプリケーションを実行
USER node
CMD ["npm", "start"]
