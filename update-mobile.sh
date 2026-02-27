#!/bin/bash
cd ~/clash/auto3-14lotka
echo "🔄 $(date): $(wc -l < reality-mobile.txt) → GitHub Pages"

# Pull свежие с телефона
git pull origin main

# Push на ПК (синхрон)
git add reality-mobile.txt
git commit -m "🔄 $(wc -l < reality-mobile.txt) nodes $(date +%H:%M)" || true
git push origin main

echo "✅ Pages: https://ilonipop-oss.github.io/auto3-14lotka/reality-mobile.txt"
