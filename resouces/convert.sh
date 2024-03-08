
# ADRules
cp adrules_domainset.txt adrules_domainset2.txt
sed -i "s/^\+\./        \"/g" adrules_domainset.txt
sed -i "s/$/\",/g" adrules_domainset.txt
sed -i "$ s/,$//" adrules_domainset.txt
sed -i "/^#/a{\n  \"version\": 1,\n  \"rules\": [\n    {\n      \"domain\": [" adrules_domainset.txt
sed -i "/^#/d" adrules_domainset.txt
sed -i "s/^\+\./        \"\./g" adrules_domainset2.txt
sed -i "s/$/\",/g" adrules_domainset2.txt
sed -i "$ s/,$//" adrules_domainset2.txt
sed -i "/^#/a\      ],\n      \"domain_suffix\": [" adrules_domainset2.txt
sed -i "$ a\      ]\n    }\n  ]\n}" adrules_domainset2.txt
sed -i "/^#/d" adrules_domainset2.txt
cp adrules_domainset.txt adrules_domainset.json
cat adrules_domainset2.txt >> adrules_domainset.json

# Convert
cp adrules_domainset.json adrules.json && rm adrules_domainset.json
./sing-box rule-set compile ./adrules.json -o adrules.srs