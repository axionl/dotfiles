# Defined in - @ line 1
function pcm --wraps='sudo pacman' --description 'alias pcm sudo pacman'
  sudo pacman $argv;
end
