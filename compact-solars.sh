# http://forum.industrial-craft.net/index.php?page=Thread&threadID=4827

MODSLUG="compact-solars"
cd ../public_html/repo/mods/$MODSLUG

if [ ! -d mods ]
then
        mkdir mods
else
        rm -r mods/* 2>/dev/null
fi
 
MOD_VERSION=$(wget -q http://files.minecraftforge.net/CompactSolars/ -O- | \
grep -P -A 1 "Recommended\-1\.5\.2" | tail -1 | grep -o -P "\d\.\d\.\d\.\d\d")

if [ ! -e $MODSLUG-$MOD_VERSION.zip ]
then
    wget -q http://files.minecraftforge.net/CompactSolars/compactsolars-universal-1.5.2-$MOD_VERSION.zip \
    -O mods/compactsolars-universal-1.5.2-$MOD_VERSION.zip
    zip -r -m -q $MODSLUG-$MOD_VERSION.zip mods
else
    rm -r mods
fi
