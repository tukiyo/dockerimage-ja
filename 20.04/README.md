参考: @syui さんの[DockerからGUIアプリとWineアプリを使う方法 - Qiita](http://qiita.com/syui/items/b43ba220d9cd1e2fb74f)

## 日本語入力対応

* ubuntu 16.04上でdockerを使うことを想定

```rb:run.sh
docker run -ti --rm \
  -e XMODIFIERS \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v `pwd`:/home/vagrant/ \
  tukiyo3/gui
```

```bash:firefox起動
sudo aptget.sh firefox
firefox
```

## /usr/local/bin/aptget.sh

```
apt-get update -qq && apt-get install -yq $@ && apt-get clean && rm -rf /var/lib/apt/lists/*
```

* これを使ってパッケージをインストールすると容量がふくれなくて良いかと。
