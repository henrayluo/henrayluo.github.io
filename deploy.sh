#deploy.sh by Henray-Luo : henrayluo(at)gmail.com
#!/bin/bash

if [ -z "$1" ];then

echo "Please input parameter : 't' for test on http://0.0.0.0:4000/ and 'd' for deploy on github ."

exit

elif [ "t" = $1 ]; then
    #hexo test on http://0.0.0.0:4000/
    hexo clean
    hexo g
    open /Applications/Safari.app http://0.0.0.0:4000/
    hexo s


elif [ "d" = $1 ]; then

#    hexo clean
#    hexo g
#    hexo d
    hexo clean

elif [ "c" = $1 ]; then

    hexo clean

else
    echo "UNKWON Parameter , please input parameter : 't' for test on http://0.0.0.0:4000/ and  'd' for deploy on github ."

fi
