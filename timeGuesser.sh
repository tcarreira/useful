#!/bin/bash
if [ -z $1 ]; then
    files="/var/log/auth.log"
else
    files="/var/log/auth.log.1 /var/log/auth.log"
fi

cat $files | grep -a -e "systemd-logind" \
    | sed 's/  / /g' \
    | awk -v year=$(date +%Y) -F'[ :]' \
'BEGIN{prevtime=0; format="%A %Y-%m-%d %H:%M"; format2="%H:%M"; 
month["Jan"]=1;month["Fev"]=2;month["Mar"]=3;month["Abr"]=4;month["Mai"]=5;month["Jun"]=6;month["Jul"]=7;month["Ago"]=8;month["Set"]=9;month["Out"]=10;month["Nov"]=11;month["Dez"]=12;
month["Jan"]=1;month["Feb"]=2;month["Mar"]=3;month["Apr"]=4;month["May"]=5;month["Jun"]=6;month["Jul"]=7;month["Aug"]=8;month["Sep"]=9;month["Oct"]=10;month["Nov"]=11;month["Dec"]=12;}
{
timestamp=mktime(year" "month[$1]" "$2" "$3" "$4" "$5);
tdif=15*int(((timestamp-prevtime)+7*60)/60/15); 
if(tdif>0 && tdif < 9999999)
    {  print strftime(format,60*15*int((timestamp+7*60)/60/15)) " ---## "tdif "m (" tdif/60 " h) <<<<|" $0"-"strftime(format2,timestamp);
    } 
prevtime=timestamp 
}' \
    | sed 's/ tcarreira-sapo-laptop /|/g' | sed 's/systemd-logind\[[0-9]*\]: //g' | cut -d'|' -f1,3


#awk -v month=$(date +%m) -v year=$(date +%Y) -F'[ :]' \
