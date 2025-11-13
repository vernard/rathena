#!/bin/bash

### Copy empty /import-tmpl/* files to remove missing file errors in log
cp -r /rathena/conf/import-tmpl/* /rathena/conf/import/

### Replace env vars in conf files ###
for template_file in $(find /rathena/conf/import -name "*.template"); do
    output_file="${template_file%.template}"
    envsubst < "$template_file" > "$output_file"
done

# Start rAthena
./athena-start watch
