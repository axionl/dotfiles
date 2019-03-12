# Defined in - @ line 1
function scour-color --description 'alias scour-color=scour --enable-viewboxing --enable-id-stripping --enable-comment-stripping --shorten-ids --remove-descriptive-elements --create-groups --strip-xml-space --strip-xml-prolog --indent=none --no-line-breaks'
	scour --enable-viewboxing --enable-id-stripping --enable-comment-stripping --shorten-ids --remove-descriptive-elements --create-groups --strip-xml-space --strip-xml-prolog --indent=none --no-line-breaks $argv;
end
