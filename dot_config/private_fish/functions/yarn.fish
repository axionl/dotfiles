# Defined via `source`
function yarn --wraps=yarn --description 'alias yarn use XDG_CONFIG_HOME path'
 command yarn --use-yarnrc (printf "%s/%s" "$XDG_CONFIG_HOME" "yarn/config") $argv;
end
