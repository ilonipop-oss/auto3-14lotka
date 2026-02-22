#!/bin/bash
cd ~/autoPilotka

echo "🚀 TÜRK+DEUTSCH START: $(date)"

# 🛡️ КРИТИЧЕСКИЙ ФИКС: проверяем curl
curl -sL "https://raw.githubusercontent.com/igareck/vpn-configs-for-russia/main/WHITE-CIDR-RU-checked.txt" -o /tmp/white_cidr.txt || {
    echo "❌ igareck DOWN! Используем backup..."
    curl -sL "https://raw.githubusercontent.com/ilonipop-oss/auto3-14lotka/main/yusuf_hotdog_6h_live.txt" -o /tmp/white_cidr.txt
}

# ✅ ЕС фильтр (Turkey+Germany)
grep -iE "(Turkey|Germany|🇹🇷|🇩🇪|tr-|de-|berlin|istanbul)" /tmp/white_cidr.txt > eu_filtered.txt

# 🎯 ТОП-100 IP (самые живучие)
grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' eu_filtered.txt | sort | uniq -c | sort -nr | head -100 | awk '{print $2}' > top100_ips.txt
grep -F -f top100_ips.txt eu_filtered.txt > yusuf_hotdog_reality.txt

TOTAL=$(wc -l < yusuf_hotdog_reality.txt)
echo "# 🦃🇩🇪 TOP-100 EU VLESS $(date)" > yusuf_hotdog_reality.txt
echo "✅ 🔥 $TOTAL TOP-100 LIVE VLESS" >> yusuf_hotdog_reality.txt
cat eu_filtered.txt >> yusuf_hotdog_reality.txt

rm -f /tmp/white_cidr.txt eu_filtered.txt top100_ips.txt
echo "✅ 🔥 $TOTAL ЕС хотдогов готово!"
