#!/bin/bash
cd ~/autoPilotka

echo "🚀 TÜRKDE START: $(date)"
echo "🦀 Скачиваем igareck WHITE-CIDR-RU-checked.txt..."

# ✅ ТОЛЬКО igareck по закону
curl -sL "https://raw.githubusercontent.com/igareck/vpn-configs-for-russia/main/WHITE-CIDR-RU-checked.txt" -o /tmp/white_cidr.txt

echo "🦃 Фильтр ТУРЦИЯ only..."
grep -iE "Turkey|🇹🇷|tr-|turk|istanbul|ankara|izmir|turkiye" /tmp/white_cidr.txt > turk_only.txt || {
    echo "❌ ТУРЦИЯ НЕ НАЙДЕНА в igareck!"
    exit 1
}

TURK_COUNT=$(wc -l < turk_only.txt)
echo "✅ $TURK_COUNT ТУРЕЦКИХ VLESS! $(date)"

# Очистка мусора
sed -i 's|vless://vless://*|vless://|g; s|hiddifyng://||g' turk_only.txt

# Юсуф hotdog
echo "# 🦃 İGÖRЬKA TÜRK-ONLY $(date)" > yusuf_hotdog_reality.txt
echo "✅ $TURK_COUNT ТУРЕЦКИХ VLESS" >> yusuf_hotdog_reality.txt
cat turk_only.txt >> yusuf_hotdog_reality.txt

rm -f /tmp/white_cidr.txt turk_only.txt
echo "🌭 Юсуф готов: $TURK_COUNT 🇹🇷 хотдогов!"
