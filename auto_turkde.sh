#!/bin/bash
cd ~/autoPilotka || exit 1
echo "🚀 TURKDE START: $(date)"
source .env 2>/dev/null || echo "⚠️ .env optional"

# Тянем турецких батек
./fetch_turk_batya.sh
echo "🦃 Загружено $(wc -l < turkde_hybrid.txt 2>/dev/null || echo 0) турецких Бать! $(date)"

# Git (credential.helper store работает)
git add . || true
git commit -m "🦃🌭 TURKDE: $(wc -l < turkde_hybrid.txt 2>/dev/null || echo 0) серверов" || true
git push || true

echo "✅ TURKDE END: $(wc -l < turkde_hybrid.txt 2>/dev/null || echo 0) серверов | $(date)" >> logs/turkde.log
