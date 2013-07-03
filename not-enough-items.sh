# http://www.minecraftforum.net/topic/909223-147152-smp-chickenbones-mods/

MODSLUG="not-enough-items"
cd ../public_html/repo/mods/$MODSLUG

if [ ! -d coremods ]
then
        mkdir coremods
else
        rm -r coremods/* 2>/dev/null
fi

cd coremods
wget --trust-server-names -q http://www.chickenbones.craftsaddle.org/Files/goto.php?file=NotEnoughItems\&version=1.5.1
MOD_VERSION=$(ls | grep -o -P "\d\.\d\.\d\.\d\d")
cd ..

if [ ! -e $MODSLUG-$MOD_VERSION.zip ]
then
    zip -r -m -q $MODSLUG-$MOD_VERSION.zip coremods
else
    rm -r coremods
fi
