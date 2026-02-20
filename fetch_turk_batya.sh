#!/bin/bash
echo "🦀 Юсуф крадёт у Игоря..."
> yusuf_hotdog_reality.txt

RAW_URL="https://raw.githubusercontent.com/igareck/vpn-configs-for-russia/main/WHITE-CIDR-RU-checked.txt"
curl -s "$RAW_URL" | grep -E "^vless://" | shuf | head -12 > yusuf_hotdog_reality.txt

echo "" >> yusuf_hotdog_reality.txt
echo "# 🦃 ИГОРЬКА: $(date)" >> yusuf_hotdog_reality.txt
echo "✅ Игорёк: $(wc -l < yusuf_hotdog_reality.txt) VLESS"
