# give input in the format    VARIABLE:PARAMETER, VARIABLE:PARAMETER
for var in $(echo $1 | sed -e 's/,/' '/g'); do
    var_name=$(echo $var | awk -F : '{print $1}')
    parameter=$(echo $var | awk -F : '{print $2}')
    value=$(aws ssm get-parameter --name $parameter --with-decryption | jq '.Parameter.Value' | xargs)
    echo export ${var_name}=\"${value}\" >>/params/params.txt
done