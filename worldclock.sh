#/bin/sh

if [ $# -eq 0 ]; then
    echo "worldclock [EST | EDT | PST | PDT | GMT | UCT | UTC | JST]"
    exit 0
fi
case "$1" in
   [Pp][DdSs][Tt] ) env TZ=US/Pacific date;; 
   [Ee][DdSs][Tt] ) env TZ=US/Eastern date;; 
   [Gg][Mm][Tt] ) env TZ=Etc/GMT date;; 
   [Uu][Cc][Tt] ) env TZ=Etc/UCT date;; 
   [Uu][Tt][Cc] ) env TZ=Etc/UTC date;; 
   [Jj][Ss][Tt] ) env TZ=Asia/Tokyo date;; 
   "list" ) 
       if ! command -v timedatectl &> /dev/null
       then
           echo " timedatectl command not found."
       else
           timedatectl list-timezones
       fi
       ;;
   * ) env TZ="$1" date;; 
esac