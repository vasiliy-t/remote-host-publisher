#!/bin/sh

while test $# -gt 0; do
        case "$1" in
                -s)
                        shift
                        if test $# -gt 0; then
                                export SOURCE=$1
                        else
                                echo "no name specified"
                                exit 1
                        fi
                        shift
                        ;;
                --source*)
                        export SOURCE=`echo $1 | sed -e 's/^[^=]*=//g'`
                        shift
                        ;;
                 -h)
                        shift
                        if test $# -gt 0; then
                                export HOST=$1
                        else
                                echo "no name specified"
                                exit 1
                        fi
                        shift
                        ;;
                --host*)
                        export HOST=`echo $1 | sed -e 's/^[^=]*=//g'`
                        shift
                        ;;                       
                 -d)
                        shift
                        if test $# -gt 0; then
                                export DESTINATION=$1
                        else
                                echo "no name specified"
                                exit 1
                        fi
                        shift
                        ;;
                --destination*)
                        export DESTINATION=`echo $1 | sed -e 's/^[^=]*=//g'`
                        shift
                        ;;                       
                *)
                        break
                        ;;
        esac
done

mkdir -p $HOME/.ssh

ssh-keyscan ${HOST} >> $HOME/.ssh/known_hosts

sshpass -p "$RSYNC_PASSWORD" rsync ${SOURCE} vasiliy@${HOST}:${DESTINATION}

