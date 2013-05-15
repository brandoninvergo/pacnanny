#!/bin/bash
# Written by Brandon Invergo
# This script is in the public domain.


# color: always, never, auto
COLOR=always
BROWSER=w3m

display_news () {
    # arg 1 is a list of dates of news items, each on its own line
    local IFS=$'\n'
    # reformat the RSS so that each item is on its own line
    items=`cat $2 | tr -d '\n' | sed -e 's|<item>|\n<item>|g'`
    while IFS= read -r d; do
        # get the article's date in seconds since 1970
        art_date=`date -d "$d" '+%s'`
        # if it's new, show it
        if [[ $art_date -gt $3 ]]; then
            URL=`sed -e "/lastBuildDate/d" <(echo "$items") | \
                 grep --color=never $d | \
                 grep -o --color=never "<link>https://.*</link>" | \
                 sed -e "s|<link>\(.*\)</link>|\1|"`
            printf "Opening news item from $d\n"
            $BROWSER $URL
        fi
    done <<EOF
$1
EOF
}

display_msgs () {
    # Remove annoying gconf/dconf schema deprecation warnings
    sed -i -e '/warning: Schema/d' $1

    warnings=`grep --color=$COLOR warning: $1`
    if [ "x$warnings" != "x" ]; then
        printf "\nWarnings:\n"
        printf "$warnings\n"
    fi
    
    pacsaves=`grep --color=$COLOR -o "[-0-9_/a-z\.].pacsave" $1`
    if [ "x$pacsaves" != "x" ]; then
        printf "\nNew pacsave files:\n"
        printf "$pacsaves\n"
    fi

    pacnews=`grep --color=$COLOR -o "[-0-9_/a-z\.].pacnew" $1`
    if [ "x$pacnews" != "x" ]; then
        printf "\nNew pacnew files:\n"
        printf "$pacnews\n"
    fi
}

if [ $COLOR = "never" ]; then
    printf ":: Checking for Arch Linux news...\n"
else    
    printf "\e[1;34m::\e[0;1m Checking for Arch Linux news...\e[0m\n"
fi

last_update=$(date -d "`grep 'pacman -Syu' /var/log/pacman.log | \
                        tail -n1 | grep -o '[-0-9\]* [:0-9]*'`" '+%s')
news=./arch_news.rss
wget --quiet https://www.archlinux.org/feeds/news/ -O $news
article_dates=`sed -e "/lastBuildDate/d" $news | \
               grep -o -E "[0-9]+ [A-Za-z]+ [0-9]+ [0-9:]+"`

display_news "$article_dates" $news $last_update
rm $news

paclog=`mktemp`
pacman --color $COLOR -Syu | tee $paclog

display_msgs $paclog
