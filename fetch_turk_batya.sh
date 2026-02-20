#!/bin/bash
echo "🦀 Юсуф ищет турецкие VLESS батек..."

# Очищаем старые данные
> "Юсуф_на_Барбекю_с_сосисками.txt"

# ТОП-5 турецких VLESS источников (публичные)
curl -s https://raw.githubusercontent.com/barry-far/V2ray-config/main/All_Configs_base64_Sub.txt | base64 -d 2>/dev/null | grep -i "TR\|Turkey\|tr-" | grep vless | head -12 > temp_vless.txt
curl -s https://raw.githubusercontent.com/MatinGhanbari/v2ray-configs/main/subscriptions/v2ray/super-sub.txt | grep -i "tr\|turkey" | grep vless | head -4 >> temp_vless.txt

# Фильтруем рабочие (простая проверка)
grep -E "vless://[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}" temp_vless.txt | head -12 > "Юсуф_на_Барбекю_с_сосисками.txt"

# Статистика
echo "$(date): 🦃 Загружено $(wc -l < "Юсуф_на_Барбекю_с_сосисками.txt") турецких VLESS" >> "Юсуф_на_Барбекю_с_сосисками.txt"
rm -f temp_vless.txt

echo "✅ Турецкие батек готовы: $(wc -l < "Юсуф_на_Барбекю_с_сосисками.txt") шт."
