cd working && gzip *.img
curl -sL https://git.io/file-transfer | sh
./transfer wet ./*.gz > zgsi.txt
cd -
cat working/zgsi.txt
