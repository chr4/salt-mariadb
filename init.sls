mariadb-server:
  pkg.installed: []

mysqld:
  service.running:
    - enable: true
    - onchanges:
      - pkg: mariadb-server
      - file: /etc/mysql/mariadb.conf.d/50-server.cnf

/etc/mysql/mariadb.conf.d/50-server.cnf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://{{ tpldir }}/server.cnf
    - require:
      - pkg: mariadb-server
