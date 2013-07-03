# http://thermalexpansion.wikispaces.com

MODSLUG="thermal-expansion"
cd ../public_html/repo/mods/$MODSLUG

if [ ! -d mods ]
then
        mkdir mods
else
        rm -r mods/* 2>/dev/null
fi
 
MOD_VERSION=$(wget -q http://thermalexpansion.wikispaces.com/Downloads -O- | \
grep -o -P -m 2 "Latest Version\: \d\.\d\.\d\.\d" | tail -1 | cut -f 3 -d ' ')

if [ ! -e $MODSLUG-$MOD_VERSION.zip ]
then
    wget -q https://dl.dropboxusercontent.com/u/57416963/Minecraft/Mods/ThermalExpansion/release/ThermalExpansion-$MOD_VERSION.jar \
    -O mods/ThermalExpansion-$MOD_VERSION.jar
    zip -r -m -q $MODSLUG-$MOD_VERSION.zip mods
else
    rm -r mods
fi
