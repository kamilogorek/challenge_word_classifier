rm -rf hashes_no_apostrophe
mkdir hashes_no_apostrophe
for hashes in {1..8}
do
    for bits in {1..8}
    do
        node hash.js words_no_apostrophe.txt hashes\_no\_apostrophe/hashes$hashes\_bits$bits.txt $hashes $bits
        gzip -9c hashes\_no\_apostrophe/hashes$hashes\_bits$bits.txt > hashes\_no\_apostrophe/hashes$hashes\_bits$bits\_compressed.txt
    done
done
ls -lSrh hashes_no_apostrophe > stats_no_apostrophe.txt
