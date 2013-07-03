# https://github.com/tcooc/AdditionalPipesBC

MODSLUG="additionalpipes"
cd ../public_html/repo/mods/$MODSLUG

if [ ! -d mods ]
then
        mkdir mods
else
        rm -r mods/* 2>/dev/null
fi
 
DOWNLOAD_URL=$(wget -q https://www.dropbox.com/sh/0hc1l4bn4dvjlni/t82-3--LmE -O- | grep -o -P "https://www.dropbox.com.*?\d\.\d\.\d\-BC\d\.\d\.\d.jar" | tail -1)
MOD_VERSION=$(echo $DOWNLOAD_URL | grep -o -P "\d\.\d\.\d\-BC\d\.\d\.\d")

if [ ! -e $MODSLUG-$MOD_VERSION.zip ]
then
    wget -q $DOWNLOAD_URL -O mods/AdditionalPipes$MOD_VERSION.jar
    zip -r -m -q $MODSLUG-$MOD_VERSION.zip mods
else
    rm -r mods
fi
