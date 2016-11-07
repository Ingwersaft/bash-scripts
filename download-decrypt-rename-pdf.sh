#!/bin/bash
echo "start"
readarray FILE < processed
echo ${#FILE[@]}
mkdir pdf
for LINE in "${FILE[@]}"
do
        #echo "handling line: ${LINE}"
        IFS=$'\t' read -r -a array <<< "$LINE"
        URL="${array[0]}"
        NAME="${array[1]}"
        echo "$URL"
        echo "$NAME"
        wget $URL -O "pdf/${NAME}_pw.pdf"
        qpdf -password=1386 -decrypt "pdf/${NAME}_pw.pdf" "pdf/${NAME}.pdf"
        rm "pdf/${NAME}_pw.pdf"
        echo "line done"
        echo ""
done

/* example lines in processed:
https://jura.urz.uni-heidelberg.de/mat/file_viewer.php?fid=13161        BGH_NJW_1985_794_Haftungsmilderung_Schenkung_Kartoffelpülpe
https://jura.urz.uni-heidelberg.de/mat/file_viewer.php?fid=13599        BGH_NJW_2005_3211_Terrier_Welpe
https://jura.urz.uni-heidelberg.de/mat/file_viewer.php?fid=12995        BGH_NJW_2006_2839_Ersatzlieferung_beim_Stückkauf
https://jura.urz.uni-heidelberg.de/mat/file_viewer.php?fid=13557        BGH_NJW_2011_2278_Erfüllungsort_der_Nacherfüllung
*/
