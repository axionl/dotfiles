# Defined in - @ line 1
function scour-mono --description 'alias scour-mono=scour --enable-viewboxing --enable-id-stripping --enable-comment-stripping --shorten-ids --remove-descriptive-elements --create-groups --strip-xml-space --strip-xml-prolog --nindent=4'
	scour --enable-viewboxing --enable-id-stripping --enable-comment-stripping --shorten-ids --remove-descriptive-elements --create-groups --strip-xml-space --strip-xml-prolog --nindent=4 $argv;
end
