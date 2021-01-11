# Defined in - @ line 1
function diffc --wraps='diff -ura --color' --description 'alias diffc diff -ura --color'
  diff -ura --color $argv | bat;
end
