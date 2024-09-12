SOLUTION=(challenge
challenge/emptyDir
challenge/emptyDir/.rambling.txt
challenge/emptyDir/.report.txt
challenge/emptyDir/.science.txt.TREASURE
challenge/emptyDir/.secret-dir
challenge/firstDir
challenge/firstDir/analysis.txt
challenge/firstDir/brandNew-1.txt
challenge/firstDir/lots-of-words.txt
challenge/firstDir/random-text-file.txt.TREASURE
challenge/firstDir/secretmessage.txt
challenge/firstDir/subdir
challenge/firstDir/subdir/donotchangeme.txt
challenge/firstDir/subdir/donotcountme.txt
challenge/firstDir/subdir/donotremoveme.txt
challenge/firstDir/subdir/fake-extension.pdf
challenge/firstDir/subdir/file-with-txt-extension.txt.TREASURE
challenge/firstDir/subdir/no-txt-extension
challenge/firstDir/sum45-1.txt
challenge/secondDir
challenge/secondDir/essay.txt.TREASURE
challenge/secondDir/pleaseremoveme.txt
challenge/secondDir/project-abstract.txt
challenge/secondDir/project-report-edited.txt.TREASURE
challenge/secondDir/project-report.txt
challenge/secondDir/removeme
challenge/secondDir/removeme/change.me.txt
challenge/secondDir/removeme/insane-ramblings.txt
challenge/secondDir/removeme/nomatch.txt.duplicate
challenge/secondDir/removeme/normal-ramblings.txt
challenge/secondDir/removeme/poetic-ramblings.txt.TREASURE
challenge/secondDir/removeme/report.txt
challenge/secondDir/removeme/report.txt.duplicate
challenge/secondDir/removeme/sum16547167file.txt
challenge/secondDir/sum16771410now.txt
challenge/secondDir/thankyou.txt
challenge/thirdDir
challenge/thirdDir/first-draft.txt
challenge/thirdDir/fourthDir
challenge/thirdDir/fourthDir/fifthDir
challenge/thirdDir/fourthDir/fifthDir/sixthDir
challenge/thirdDir/fourthDir/fifthDir/sixthDir/fourth-draft.txt
challenge/thirdDir/fourthDir/fifthDir/sixthDir/seventhDir
challenge/thirdDir/fourthDir/fifthDir/sixthDir/seventhDir/eighthDir
challenge/thirdDir/fourthDir/fifthDir/sixthDir/seventhDir/eighthDir/ninthDir
challenge/thirdDir/fourthDir/fifthDir/sixthDir/seventhDir/eighthDir/ninthDir/final-draft.txt.TREASURE
challenge/thirdDir/fourthDir/fifthDir/sixthDir/seventhDir/eighthDir/ninthDir/morenumbers.csv
challenge/thirdDir/fourthDir/fifthDir/sixthDir/seventhDir/eighthDir/ninthDir/morenumbers.csv.duplicate
challenge/thirdDir/fourthDir/fifthDir/sixthDir/seventhDir/eighthDir/ninthDir/mynumbers.csv
challenge/thirdDir/fourthDir/fifthDir/sixthDir/seventhDir/eighthDir/ninthDir/sum26827.file.txt
challenge/thirdDir/fourthDir/fifthDir/sixthDir/seventhDir/eighthDir/sixth-draft.txt
challenge/thirdDir/fourthDir/fifthDir/sixthDir/seventhDir/fifth-draft.txt
challenge/thirdDir/fourthDir/fifthDir/third-draft.txt
challenge/thirdDir/fourthDir/second-draft.txt)



COMP=(`find challenge | sort`)

# echo ${#COMPFILE[@]}

SUCCESS="PASS"

if [[ ${#SOLUTION[@]} != ${#COMP[@]} ]]; then 
    SUCCESS="FAIL"
else 
    for ((ITER=0; ITER < ${#SOLUTION[@]}; ITER++)); do 
        if [[ ${SOLUTION[$ITER]} != ${COMP[$ITER]} ]]; then
            SUCCESS="FAIL"
        fi
    done
fi 

echo $SUCCESS
