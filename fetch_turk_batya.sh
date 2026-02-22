#!/bin/bash
cd ~/autoPilotka

echo "🚀 TÜRK+DEUTSCH START: $(date)"
echo "🦀 igareck WHITE-CIDR-RU → TÜRKİYE+DEUTSCHLAND..."

curl -sL "https://raw.githubusercontent.com/igareck/vpn-configs-for-russia/main/WHITE-CIDR-RU-checked.txt" -o /tmp/white_cidr.txt

# 🦃 TÜRKİYE FILTER
echo "🦃 Фильтр ТУРЦИЯ..."
grep -iE "Turkey|🇹🇷|tr-|turk|istanbul|ankara|izmir|turkiye" /tmp/white_cidr.txt > turk.txt || true

# 🇩🇪 DEUTSCHLAND FILTER  
echo "🇩🇪 Фильтр ГЕРМАНИЯ..."
grep -iE "Germany|🇩🇪|de-|berlin|frankfurt|munich|deutschland|bundesrepublik" /tmp/white_cidr.txt > deutsch.txt || true

# 🔥 МЕРЖ TÜRK+DEUTSCH
cat turk.txt deutsch.txt > all_eu.txt

TURK_COUNT=$(grep -c "Turkey\|🇹🇷\|tr-" all_eu.txt || echo 0)
DEUTSCH_COUNT=$(grep -c "Germany\|🇩🇪\|de-" all_eu.txt || echo 0)
TOTAL_COUNT=$(wc -l < all_eu.txt)

echo "✅ 🦃 TÜRK: $TURK_COUNT | 🇩🇪 DEUTSCH: $DEUTSCH_COUNT | 🔥 TOTAL: $TOTAL_COUNT"

# 🔨 ЧИСТКА
sed -i 's|vless://vless://*|vless://|g; s|hiddifyng://||g' all_eu.txt

# 📤 ЮСУФ + ХАНС HOTDOGS
echo "# 🦃🇩🇪 İGÖRЬKA + HANS EU-ONLY $(date)" > yusuf_hotdog_reality.txt
echo "✅ 🦃$TURK_COUNT TÜRK + 🇩🇪$DEUTSCH_COUNT DEUTSCH = 🔥$TOTAL_COUNT VLESS" >> yusuf_hotdog_reality.txt
cat all_eu.txt >> yusuf_hotdog_reality.txt

rm -f /tmp/white_cidr.txt turk.txt deutsch.txt all_eu.txt
echo "🌭🥨 ЮСУФ+ХАНС: $TOTAL_COUNT ЕС хотдогов! $(date)"
