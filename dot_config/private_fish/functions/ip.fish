# Defined via `source`
function ip --wraps=ip --description 'alias ip ip -c=auto'
 command ip -c=auto $argv;
end
