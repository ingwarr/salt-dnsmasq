{%- from "dnsmasq/map.jinja" import server with context %}
{%- if server.enabled %}

dnsmasq_server_packages:
  pkg.installed:
  - names: {{ server.pkgs }}

/etc/dnsmasq.conf:
  file.managed:
  - source: salt://dnsmasq/files/dnsmasq.conf
  - template: jinja
  - require:
    - pkg: dnsmasq_server_packages

dnsmasq_server_service:
  service.running:
    - enable: true
    - name: 
       - dnsmasq
    - watch:
      - file: /etc/dnsmasq.conf
{%- endif %}
