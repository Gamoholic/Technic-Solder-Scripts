# http://ae-mod.info/

MODSLUG="appliedenergistics"
cd ../public_html/repo/mods/$MODSLUG

if [ ! -d mods ]
then
        mkdir mods
else
        rm -r mods/* 2>/dev/null
fi
 
MOD_VERSION=$(wget -q http://ae-mod.info/Downloads/ -O- | grep -i -o -P "rv\d\d\.." | sed 's/\./\-/')

if [ ! -e $MODSLUG-$MOD_VERSION.zip ]
then
    wget -q http://ae-mod.info/releases/appeng-$MOD_VERSION.zip -O mods/appeng-$MOD_VERSION.zip
    zip -r -m -q $MODSLUG-$MOD_VERSION.zip mods
else
    rm -r mods
fi
