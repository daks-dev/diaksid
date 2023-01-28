#!/bin/bash

ac="yes";
until [ $ac = "-" ]; do
    echo -e "";
    echo -e "+ : start [node]";
    echo -e "";
    echo -e "1 : npm:install";
    echo -e "2 : npm:update";
    echo -e "3 : npm:upgrade";
    echo -e "";
    echo -e "4 : svelte:check";
    echo -e "5 : vite:build";
    echo -e "";
    echo -e "7 : generate:sitemap";
    echo -e "8 : generate:CSS";
    echo -e "9 : generate:images";
    echo -e "0 : clean";
    echo -e "";
    echo -e "m : memcached:restart";
    echo -e "s : ▼ supervisor";
    echo -e "n : ▼ nginx";
    echo -e "";
    echo -e "Type \c ";
    read  ac;
    case $ac in
        "+")
            echo -e "> start [node]";
            node build/index.js;;

        "1")
            echo -e "> npm:install";
            npm install;;

        "2")
            echo -e "> npm:update";
            npm update;;

        "3")
            echo -e "> npm:upgrade";
            npm upgrade;;

        "4")
            echo -e "> svelte:check";
            npm run check;;

        "5")
            echo -e "> vite:build";
            npm run build;;

        "7")
            echo -e "> generate:sitemap";
            npm run generate:sitemap;;

        "8")
            echo -e "> generate:CSS";
            npm run smui-theme-light;
            npm run smui-theme-dark;;

        "9")
            echo -e "> gzipper:compress";
            npm run compress;;

        "0")
            echo -e "> clean";
            npm run clean;;

        "m")
            echo -e "> memcached:restart";
            sudo service memcached restart;;

        "s")
            acc="yes";
            until [[ $acc == "-" ]]; do
                echo -e "";
                echo -e "    1 : stop vps.daks";
                echo -e "    2 : start vps.daks";
                echo -e "    3 : restart vps.daks";
                echo -e "    4 : restart all";
                echo -e "    - : exit";
                echo -e "";
                echo -e "    Type \c ";
                read  acc;
                case $acc in
                    "1")
                        echo -e "> supervisor:stop vps.daks";
                        sudo supervisorctl stop vps.daks;;
                    "2")
                        echo -e "> supervisor:start vps.daks";
                        sudo supervisorctl start vps.daks;;
                    "3")
                        echo -e "> supervisor:restart vps.daks";
                        sudo supervisorctl reread;
                        sudo supervisorctl restart vps.daks;;
                    "4")
                        echo -e "> supervisor restart all";
                        sudo systemctl restart supervisor;;
                esac
            done;;

        "n")
            acc="yes";
            until [[ $acc == "-" ]]; do
                echo -e "";
                echo -e "    1 : restart";
                echo -e "    2 : status";
                echo -e "";
                echo -e "    - : exit";
                echo -e "";
                echo -e "    Type \c ";
                read  acc;
                case $acc in
                    "1")
                        echo -e "> nginx restart";
                        sudo systemctl restart nginx.service;;
                    "2")
                        echo -e "> nginx status";
                        sudo systemctl status nginx.service;;
                esac
            done;;
    esac
done
echo -e "";
