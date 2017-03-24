{%- if pillar.dnsmasq is defined %}
include:
{%- if pillar.dnsmasq.server is defined %}
- dnsmasq.server
{%- endif %}
{%- endif %}
