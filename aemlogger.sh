function aemlog() {
    tail -fn 128 "$@" | awk '
    /SEVERE/ {print "\033[35m" $0 "\033[39m"}
    /ERROR/ {print "\033[31m" $0 "\033[39m"}
    /WARN/ {print "\033[33m" $0 "\033[39m"}
    /DEBUG/ {print "\033[30m" $0 "\033[39m"}
    !/SEVERE|ERROR|WARN|DEBUG/ {print $0 }
';}

#Just use it as aemlog and pass the type of log as a parameter..
# aemlog error.log or even multiple logs aemlog error.log audit.log response.log