#!/bin/bash
cd "$(dirname "$0")"

echo "$(date): 🚀 Игорёк EU-TOP7 → dev"

# Скачиваем EU ноды
curl -s "https://raw.githubusercontent.com/igareck/vpn-configs-for-russia/main/WHITE-CIDR-RU-checked.txt" | \
grep -i "EU\|NL\|DE\|FR" | head -3 > eu-top3.txt

# УДАЛЯЕМ старый блок
sed -i '/# EU-TOP7/,/# END-EU-TOP7/d' multi-tolerance.yaml

# ДОБАВЛЯЕМ НОВЫЙ (простой YAML!)
cat >> multi-tolerance.yaml << 'EOL'

# EU-TOP7 от Игоря (ПК cron)
proxies:
  - name: "🚀 EU-Finland-1"
    type: vless
    server: 51.250.41.20
    port: 443
    uuid: "22fc4701-8c86-4d4f-a858-8f5921d83977"
    network: tcp
    tls: true
  - name: "🚀 EU-Finland-2" 
    type: vless
    server: 51.250.35.106
    port: 443
    uuid: "22fc4701-8c86-4d4f-a858-8f5921d83977"
    network: tcp
    tls: true
proxy-groups:
  - name: "🚀 EU-TOP7-SELECT"
    type: select
    proxies:
      - "🚀 EU-Finland-1"
      - "🚀 EU-Finland-2"
      - DIRECT
# END-EU-TOP7
EOL

rm -f eu-top3.txt

git config user.email "poco-router@pc"
git config user.name "PC-Auto"

git add multi-tolerance.yaml
git commit -m "🤖 EU-TOP7 FIXED $(date +%H:%M)" || exit 0
git push origin dev
