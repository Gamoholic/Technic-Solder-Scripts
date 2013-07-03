# http://www.minecraftforum.net/topic/909223-147152-smp-chickenbones-mods/

MODSLUG="ender-storage"
cd ../public_html/repo/mods/$MODSLUG

if [ ! -d mods ]
then
        mkdir mods
else
        rm -r mods/* 2>/dev/null
fi

cd mods
wget --trust-server-names -q http://www.chickenbones.craftsaddle.org/Files/goto.php?file=EnderStorage\&version=1.5.1
MOD_VERSION=$(ls | grep -o -P "\d\.\d\.\d\.\d\d")
cd ..

if [ ! -e $MODSLUG-$MOD_VERSION.zip ]
then
    zip -r -m -q $MODSLUG-$MOD_VERSION.zip mods
else
    rm -r mods
fi
