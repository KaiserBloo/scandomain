if [ $1 == 'quick' ]
then
        export URL=$2; echo "Quick Mode"; assetfinder $URL > $URL.txt; awk '!seen[$0]++' $URL.txt; sed -i -e 's/^/http:\/\//' $URL.txt; cat $URL.txt | fff | grep -E '200|201|202|300|301|302|307|308'; rm -rf $URL.txt;
else
        export URL=$2; assetfinder $URL > $URL.txt; subfinder -d $URL -o $URL.txt -silent;echo ""; awk '!seen[$0]++' $URL.txt; sed -i -e 's/^/http:\/\//' $URL.txt; cat $URL.txt | fff | grep -E '200|201|202|300|301|302|307|308'; rm -rf $URL.txt;
fi
echo ""
echo "URLs for searching on censys binaryedge etc.:"
echo "https://search.censys.io/search?resource=hosts&sort=RELEVANCE&per_page=25&virtual_hosts=EXCLUDE&q=${URL}"
echo "https://app.binaryedge.io/services/query?query=${URL}&page=1"
echo "https://www.shodan.io/search?query=${URL}"
echo "https://cs.github.com/?scopeName=All+repos&scope=&q=${URL}"
echo "https://sourcegraph.com/search?q=context:global+${URL}&patternType=literal"
