for ONFILE in `find challenge`; do 
    chmod a+wr $ONFILE

    FNAME=`basename $ONFILE`
    DNAME=`dirname $ONFILE`
    
    if test -f $ONFILE; then 
        if [[ -n `echo $FNAME | grep "^removeme"` ]]; then 
            echo REMOVE $ONFILE 
            rm $ONFILE 
        elif [[ -n `echo $FNAME | grep "^changeme"` ]]; then 
            echo CHANGE $ONFILE 
            mv $ONFILE ${DNAME}/`cat $ONFILE`
        elif [[ -n `echo $FNAME | grep "^countme"` ]]; then 
            echo COUNT $ONFILE 
            SUM=0
            for ONNUM in `cat $ONFILE`; do 
                SUM=$(( $SUM + $ONNUM ))
            done 
            mv $ONFILE ${DNAME}/sum${SUM}${FNAME:7:${#FNAME}}
        elif [[ -n `echo $FNAME | grep "duplicate$"` ]]; then 
            DUPFILE=${DNAME}/${FNAME::${#FNAME}-10};
            if test -f $DUPFILE; then 
                if [[ -z `diff $DUPFILE $ONFILE` ]]; then 
                    echo DUPLICATE $ONFILE 
                    rm $ONFILE 
                fi 
            fi 
        elif [[ -n `grep '\$[0-9][0-9][0-9][0-9]\+-TREASURE-CHEST' $ONFILE` ]]; then 
            echo TREASURE $ONFILE
            mv $ONFILE ${ONFILE}.TREASURE
        fi 
    fi 
done
