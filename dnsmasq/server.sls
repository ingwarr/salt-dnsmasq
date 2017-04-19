{%- from "dnsmasq/map.jinja" import server with context %}
{%- if server.enabled %}

dnsmasq_server_packages:
  pkg.installed:
  - names: {{ server.pkgs }}

/etc/dnsmasq.conf:
  file.managed:
  - source: salt://dnsmasq/files/dnsmasq.conf.j2
  - template: jinja
  - require:
    - pkg: dnsmasq_server_packages

dnsmasq:
  service.running:
    - enable: True
    - reload: True 
    - watch:
      - file: /etc/dnsmasq.conf

{%- endif %}
