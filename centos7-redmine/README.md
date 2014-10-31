# usage

    docker run --privileged -it -d -p 8080:80 --name redmine tukiyo3/centos7-redmine

# see also

* [Apache上でRuby on Railsアプリケーションを動かす／Passenger(mod_rails for Apache)の利用 — Redmine.JP](http://redmine.jp/tech_note/apache-passenger/)
  * /opt/redmine/tmp/restart.txt を作るとRAILSだけリスタートしてくれる。apacheをリスタートしたくない時便利。
  * chown -R apache:apache $RAILS_ROOT をしないと以下に書き込みが出来ない。
    * $RAILS_ROOT/log
    * $RAILS_ROOT/tmp
