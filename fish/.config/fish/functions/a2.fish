# Defined in - @ line 0
function a2 --wraps aria2c --description 'alias a2 aria2c'
    aria2c --http-proxy=http://127.0.0.1:9998 $argv
end
