# Defined in - @ line 1
function fcp  --description 'alias fcp curl -F "c=@-" "https://fars.ee/"'
  curl -F "c=@-" "https://fars.ee/";
end
