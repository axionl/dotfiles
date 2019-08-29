function tzst --description "compress a directory for zstd"
    if contains -- -d $argv
        command tar --zstd -xf $argv[2] 2>/dev/null
        echo "Output directory: $argv[2]" | sed 's/.tar.zst//g'
    else
        command tar --zstd -cf $argv.tar.zst $argv 2>/dev/null
        echo "Output file: $argv.tar.zst"
    end
end

complete -c tzst -s d -l decompress -d "Decompress a zstd file to directory"