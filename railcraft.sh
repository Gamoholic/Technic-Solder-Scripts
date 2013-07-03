# http://railcraft.info

MODSLUG="railcraft"
cd ../public_html/repo/mods/$MODSLUG

if [ ! -d mods ]
then
        mkdir mods
else
        rm -r mods/* 2>/dev/null
fi
 
MOD_VERSION=$(wget -q http://railcraft.info/releases -O- | \
grep -o -P -m 1 "\d\.\d\.\d\.\d")

if [ ! -e $MODSLUG-$MOD_VERSION.zip ]
then
    wget -q https://dl.dropboxusercontent.com/u/38558957/Minecraft/Railcraft_1.5.2-$MOD_VERSION.jar \
    -O mods/Railcraft_1.5.2-$MOD_VERSION.jar
    zip -r -m -q $MODSLUG-$MOD_VERSION.zip mods
else
    rm -r mods
fi
