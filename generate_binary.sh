rm -rf hashes_binary_no_apostrophe
mkdir hashes_binary_no_apostrophe
for hashes in {1..8}
do
    for bits in {1..8}
    do
        node hash_binary.js uniq.txt hashes\_binary\_no\_apostrophe/hashes$hashes\_bits$bits.txt $hashes $bits
        gzip -9c hashes\_binary\_no\_apostrophe/hashes$hashes\_bits$bits.txt > hashes\_binary\_no\_apostrophe/hashes$hashes\_bits$bits\_compressed.txt
    done
done
ls -lSrh hashes_binary_no_apostrophe > stats_binary_no_apostrophe.txt
