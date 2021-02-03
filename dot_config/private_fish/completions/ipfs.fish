#Completions for `ipfs` command
function __fish_ipfs_no_subcommand -d "Test to exclude subcommand from a list"
    set -l cmd (commandline -poc)
    set -e cmd[1]
    for i in $cmd
        if contains -- $i $argv
            return 1
        end
    end
    return 0
end

# Options
complete -c ipfs -F -n __fish_no_arguments -s c -l config -d "Path to the configuration file to use"
complete -c ipfs -f -n __fish_no_arguments -s D -l debug -d "Operate in debug mode"
complete -c ipfs -f -n __fish_no_arguments -l help -d "Show the full command help text"
complete -c ipfs -f -n __fish_no_arguments -s h -d "Show a short version of the command help text"
complete -c ipfs -f -n __fish_no_arguments -l offline -d "Run the command offline"
complete -c ipfs -x -n __fish_no_arguments -l api -d "Use a specific API instance (defaults to /ip4/127.0.0.1/tcp/5001)"
complete -c ipfs -x -n __fish_no_arguments -l cid-base -d "Multibase encoding used for version 1 CIDs in output"
complete -c ipfs -f -n __fish_no_arguments -l upgrade-cidv0-in-output -d "Upgrade version 0 to version 1 CIDs in output"
complete -c ipfs -x -n __fish_no_arguments -l enc -l encoding -d "The encoding type the output should be encoded with (json, xml, or text) (Default: text)"
complete -c ipfs -f -n __fish_no_arguments -l stream-channels -d "Stream channel output"
complete -c ipfs -x -n __fish_no_arguments -l timeout -d "Set a global timeout on the command"

# Subcommands
## Help Commands
set -gu __ipfs_basic_cmds init add cat get ls refs
set -gu __ipfs_data_struct_cmds block object files dag
set -gu __ipfs_advanced_cmds daemon mount resolve name key dns pin repo stats p2p filestore
set -gu __ipfs_network_cmds id bootstrap swarm dht ping diag
set -gu __ipfs_tool_cmds config version update commands cid log
set -gu __ipfs_subcmds $__ipfs_basic_cmds $__ipfs_data_struct_cmds $__ipfs_advanced_cmds $__ipfs_network_cmds $__ipfs_tool_cmds
for subcmd in $__ipfs_subcmds
    complete -c ipfs -n "__fish_seen_subcommand_from $subcmd" -f -l help -d "Show the full command help text"
    complete -c ipfs -n "__fish_seen_subcommand_from $subcmd" -f -s h -d "Show a short version of the command help text"
end

## Basic Commands
### /ipfs/ path header
set -gu __ipfs_need_path cat get ls refs files publish
for subcmd in $__ipfs_need_path
    complete -c ipfs -n "__fish_seen_subcommand_from $subcmd" -x -a /ipfs/ -d "Add ipfs path header"
end

### init
set -gu __init_cond "__fish_seen_subcommand_from init"

complete -c ipfs -n __fish_use_subcommand -f -a init -d "Initialize ipfs local configuration"
complete -c ipfs -x -n "$__init_cond" -s a -l algorithm -d "string - Cryptographic algorithm to use for key generation. Default: ed25519"
complete -c ipfs -x -n "$__init_cond" -s b -l bits -d "int - Number of bits to use in the generated RSA private key"
complete -c ipfs -x -n "$__init_cond" -s e -l empty-repo -d "bool - Don't add and pin help files to the local storage"
complete -c ipfs -x -n "$__init_cond" -s p -l profile -d "string - Apply profile settings to config. Multiple profiles can be separated by ','"

### add
set -gu __add_cond "__fish_seen_subcommand_from add"

complete -c ipfs -n __fish_use_subcommand -r -a add -d "Add a file to IPFS"
complete -c ipfs -f -n "$__add_cond" -s r -l recursive -d "bool - Add directory paths recursively"
complete -c ipfs -f -n "$__add_cond" -l dereference-args -d "bool - Symlinks supplied in arguments are dereferenced"
complete -c ipfs -x -n "$__add_cond" -l stdin-name -d "string - Assign a name if the file source is stdin"
complete -c ipfs -f -n "$__add_cond" -s H -l hidden -d "bool - Include files that are hidden. Only takes effect on recursive add"
complete -c ipfs -x -n "$__add_cond" -l ignore -d "array - A rule (.gitignore-stype) defining which file(s) should be ignored (variadic, experimental)"
complete -c ipfs -r -n "$__add_cond" -l ignore-rules-path -d "string - A path to a file with .gitignore-style ignore rules (experimental)"
complete -c ipfs -f -n "$__add_cond" -s q -l quiet -d "bool - Write minimal output"
complete -c ipfs -f -n "$__add_cond" -s Q -l quieter -d "bool - Write only final hash"
complete -c ipfs -f -n "$__add_cond" -l silent -d "bool - Write no output"
complete -c ipfs -f -n "$__add_cond" -s p -l progress -d "bool - Stream progress data"
complete -c ipfs -f -n "$__add_cond" -s t -l trickle -d "bool - Use trickle-dag format for dag generation"
complete -c ipfs -f -n "$__add_cond" -s n -l only-hash -d "bool - Only chunk and hash - do not write to disk"
complete -c ipfs -f -n "$__add_cond" -s w -l wrap-with-directory -d "bool - Wrap files with a directory object"
complete -c ipfs -x -n "$__add_cond" -s s -l chunker -d "string - Chunking algorithm, size-[bytes], rabin-[min]-[avg]-[max] or buzhash (Default: size-262144)"
complete -c ipfs -f -n "$__add_cond" -l pin -d "bool - in this object when adding (Default: true)"
complete -c ipfs -f -n "$__add_cond" -l raw-leaves -d "bool - Use raw blocks for leaf nodes (experimental)"
complete -c ipfs -f -n "$__add_cond" -l nocopy -d "bool - Add the file using filestore. Implies raw-leaves (experimental)"
complete -c ipfs -f -n "$__add_cond" -l fscache -d "bool - Check the filestore for pre-existing blocks (experimental)"
complete -c ipfs -x -n "$__add_cond" -l cid-version -d "int - CID version. Defaults to 0 unless an option that depends on CIDv1 is passed (experimental)"
complete -c ipfs -x -n "$__add_cond" -l hash -d "string - Hash function to use. Implies CIDv1 if not sha2-256 (experimental) (Default: sha2-256)"
complete -c ipfs -f -n "$__add_cond" -l inline -d "bool - Inline small blocks into CIDs (experimental)"
complete -c ipfs -x -n "$__add_cond" -l inline-limit -d "int - Maximum block size to inline (experimental) (Default: 32)"

### cat
set -gu __cat_cond "__fish_seen_subcommand_from cat"

complete -c ipfs -n __fish_use_subcommand -x -a cat -d "Show IPFS object data"
complete -c ipfs -x -n "$__cat_cond" -s o -l offset -d "int64 - Byte offset to begin reading from (int64 number)"
complete -c ipfs -x -n "$__cat_cond" -s l -l length -d "int64 - Maximum number of bytes to read (int64 number)"

### get
set __get_cond "__fish_seen_subcommand_from get; and __fish_ipfs_no_subcommand block; and __fish_ipfs_no_subcommand object"

complete -c ipfs -n __fish_use_subcommand -x -a get -d "Download IPFS objects"
complete -c ipfs -r -n "$__get_cond" -s o -l output -d "string - The path where the output should be stored"
complete -c ipfs -f -n "$__get_cond" -s a -l archive -d "bool - Output a TAR archive"
complete -c ipfs -f -n "$__get_cond" -s C -l compress -d "bool - Compress the output with GZIP compression"
complete -c ipfs -x -n "$__get_cond" -s l -l compression-level -d "int - The level of compression (1-9)"

### ls
set -gu __ls_cond "__fish_seen_subcommand_from ls"

complete -c ipfs -n __fish_use_subcommand -x -a ls -d "List links from an object"
complete -c ipfs -x -n "$__ls_cond" -s v -l headers -d "bool - Print table headers (Hash, Size, Name)"
complete -c ipfs -x -n "$__ls_cond" -l resolve-type -d "bool - Resolve linked objects to find out their types (Default: true)"
complete -c ipfs -x -n "$__ls_cond" -l size -d "bool - Resolve linked objects to find out their file size (Default: true)"
complete -c ipfs -x -n "$__ls_cond" -s s -l stream -d "bool - Enable experimental streaming of directory entries as they are traversed"

### refs
set -gu __refs_cond "__fish_seen_subcommand_from refs"

complete -c ipfs -n __fish_use_subcommand -x -a refs -d "List hashes of links from an object"
complete -c ipfs -x -n "$__refs_cond" -l format -d "string - Emit edges with given format. Available tokens: <src> <dst> <linkname> (Default: <dst>)"
complete -c ipfs -f -n "$__refs_cond" -s e -l edges -d "bool - Emit edge format: `<from> -> <to>`"
complete -c ipfs -f -n "$__refs_cond" -s u -l unique -d "bool - Omit duplicate refs from output"
complete -c ipfs -f -n "$__refs_cond" -s r -l recursive -d "bool - Recursively list links of child nodes"
complete -c ipfs -x -n "$__refs_cond" -l max-depth -d "int - Only for recursive refs, limits fetch and listing to the given depth (Default: -1)"


## Data Structure Commands
### block
set -gu __block_cond "__fish_seen_subcommand_from block"
set -gu __block_put_cond "$__block_cond; and __fish_seen_subcommand_from put"
set -gu __block_rm_cond "$__block_cond; and __fish_seen_subcommand_from rm"

complete -c ipfs -n __fish_use_subcommand -x -a block -d "Interact with raw blocks in the datastore"

complete -c ipfs -x -n "$__block_cond" -a get -d "Get a raw IPFS block"

complete -c ipfs -x -n "$__block_cond" -a put -d "Store input as an IPFS block"

complete -c ipfs -x -n "$__block_put_cond" -s f -l format -d "string - cid format for blocks to be created with"
complete -c ipfs -x -n "$__block_put_cond" -l mhtype -d "string - multihash hash function (Default: sha2-256)"
complete -c ipfs -x -n "$__block_put_cond" -l mhlen -d "int - multihash hash length (Default: -1)"

complete -c ipfs -x -n "$__block_cond" -a rm -d "Remove IPFS block(s)"
complete -c ipfs -f -n "$__block_rm_cond" -s f -l force -d "bool - Ignore nonexistent blocks"
complete -c ipfs -f -n "$__block_rm_cond" -s q -l quiet -d "bool - Write minimal output"

complete -c ipfs -x -n "$__block_cond" -a stat -d "Print information of a raw IPFS block"

### object
set -gu __object_cond "__fish_seen_subcommand_from object"
set -gu __object_diff_cond "$__object_cond; and __fish_seen_subcommand_from diff"
set -gu __object_get_cond "$__object_cond; and __fish_seen_subcommand_from get"
set -gu __object_links_cond "$__object_cond; and __fish_seen_subcommand_from links"
set -gu __object_patch_cond "$__object_cond; and __fish_seen_subcommand_from patch"
set -gu __object_patch_add_link_cond "$__object_cond; and __fish_seen_subcommand_from patch; and __fish_seen_subcommand_from add-link"
set -gu __object_put_cond "$__object_cond; and __fish_seen_subcommand_from put"
set -gu __object_stat_cond "$__object_cond; and __fish_seen_subcommand_from stat"

complete -c ipfs -n __fish_use_subcommand -x -a object -d "Interact with raw dag nodes"

complete -c ipfs -x -n "$__object_cond" -a data -d "Output the raw bytes of an IPFS object"
complete -c ipfs -f -n "$__object_diff_cond" -s v -l verbose -d "Print extra information"

complete -c ipfs -x -n "$__object_cond" -a diff -d "Display the diff between two ipfs objects"

complete -c ipfs -x -n "$__object_cond" -a get -d "Get and serialize the DAG node named by <key>"
complete -c ipfs -x -n "$__object_get_cond" -l data-encoding -d "string - Encoding type of the data field, either 'text' or 'base64' (Default: text)"

complete -c ipfs -x -n "$__object_cond" -a links -d "Output the links pointed to by the specified object"
complete -c ifps -f -n "$__object_links_cond" -s v -l headers -d "Print table headers (Hash, Size, Name)"

complete -c ipfs -x -n "$__object_cond" -a new -d "Create a new object from an ipfs template"

complete -c ipfs -x -n "$__object_cond" -a patch -d "Create a new merkledag object based on an existing one"
complete -c ipfs -x -n "$__object_patch_cond" -a add-link -d "Add a link to a given object"
complete -c ipfs -x -n "$__object_patch_add_link_cond" -s p -l create -d "bool - Create intermediary nodes"
complete -c ipfs -x -n "$__object_patch_cond" -a append-data -d "Append data to the data segment of a dag node"
complete -c ipfs -x -n "$__object_patch_cond" -a rm-link -d "Remove a link from a given object"
complete -c ipfs -x -n "$__object_patch_cond" -a set-data -d "Set the data field of an IPFS object"

complete -c ipfs -x -n "$__object_cond" -a put -d "Store input as a DAG object, print its key"
complete -c ipfs -x -n "$__object_put_cond" -l inputenc -d "string - Encoding type of input data. One of: {\"protobuf\", \"json\"} (Default: json)"
complete -c ipfs -x -n "$__object_put_cond" -l datafieldenc -d "string - Encoding type of the data field, either 'text' or 'base64' (Default: text)"
complete -c ipfs -f -n "$__object_put_cond" -l pin -d "bool - Pin this object when adding"
complete -c ipfs -f -n "$__object_put_cond" -s q -l quiet -d "bool - Write minimal output"

complete -c ipfs -x -n "$__object_cond" -a stat -d "Get stats for the DAG node named by <key>"
complete -c ipfs -f -n "$__object_stat_cond" -l human -d "bool - Print sizes in human readable formant (e.g., 1K 234M 2G)"

### files
set -gu __files_cond "__fish_seen_subcommand_from files"
set -gu __files_chcid_cond "$__files_cond; and __fish_seen_subcommand_from chcid"
set -gu __files_ls_cond "$__files_cond; and __fish_seen_subcommand_from ls"
set -gu __files_mkdir_cond "$__files_cond; and __fish_seen_subcommand_from mkdir"
set -gu __files_read_cond "$__files_cond; and __fish_seen_subcommand_from read"
set -gu __files_rm_cond "$__files_cond; and __fish_seen_subcommand_from rm"
set -gu __files_stat_cond "$__files_cond; and __fish_seen_subcommand_from stat"
set -gu __files_write_cond "$__files_cond; and __fish_seen_subcommand_from write"

complete -c ipfs -n __fish_use_subcommand -x -a files -d "Interact with objects as if they were a unix filesystem"

complete -c ipfs -x -n "$__files_cond" -a chcid -d "Change the cid version or hash function of the root node of a given path"
complete -c ipfs -x -n "$__files_chcid_cond" -l cid-ver -l cid-version -d "Cid version to use. (experimental)"
complete -c ipfs -x -n "$__files_chcid_cond" -l hash -d "string - Hash function to use. Will set Cid version to 1 if used. (experimental)"

complete -c ipfs -x -n "$__files_cond" -a cp -d "Copy any IPFS files and directories into MFS (or copy within MFS)"

complete -c ipfs -x -n "$__files_cond" -a flush -d "Flush a given path's data to disk"

complete -c ipfs -x -n "$__files_cond" -a ls -d "List directories in the local mutable namespace"
complete -c ipfs -f -n "$__files_ls_cond" -s l -l long -d "bool - Use log listing format"
complete -c ipfs -f -n "$__files_ls_cond" -s U -d "Do not sort; list entires in directory order"

complete -c ipfs -x -n "$__files_cond" -a mkdir -d "Make directories"
complete -c ipfs -f -n "$__files_mkdir_cond" -s p -l parents -d "bool - No error if existing, make parent directories as needed"
complete -c ipfs -x -n "$__files_mkdir_cond" -l cid-ver -l cid-version -d "int - Cid version to use (experimental)"
complete -c ipfs -x -n "$__files_mkdir_cond" -l hash -d "string - Hash function to use. Will set Cid version to 1 if used (experimental)"

complete -c ipfs -x -n "$__files_cond" -a mv -d "Move files"

complete -c ipfs -x -n "$__files_cond" -a read -d "Read a file in a given MFS"
complete -c ipfs -x -n "$__files_read_cond" -s o -l offset -d "int64 - Byte offset to begin reading from"
complete -c ipfs -x -n "$__files_read_cond" -s n -l count -d "int54 - Maximum number of bytes to read"

complete -c ipfs -x -n "$__files_cond" -a rm -d "Remove a file"
complete -c ipfs -f -n "$__files_rm_cond" -s r -l recursive -d "bool - Recursively remove directories"
complete -c ipfs -f -n "$__files_rm_cond" -l force -d "bool - Forciby remove target at path; implies -r for directories"

complete -c ipfs -x -n "$__files_cond" -a stat -d "Display file status"
complete -c ipfs -x -n "$__files_stat_cond" -l format -d "string - Print statistics in given format. Allowed tokens: <hash> <size> <cumulsize> <type> <childs>. Conflicts with other format options (Default: <hash>)"
complete -c ipfs -f -n "$__files_stat_cond" -l hash -d "bool - Print only hash. Implies '--format=<hash>'. Conflicts with other format options"
complete -c ipfs -f -n "$__files_stat_cond" -l size -d "bool - Print only size. Implies '--format=<cumulsize>'. Conflicts with other format options"
complete -c ipfs -f -n "$__files_stat_cond" -l with-local -d "bool - Compute the amount of the dag that is local, and if possible the total size"

complete -c ipfs -x -n "$__files_cond" -a write -d "Write to a mutable file in a given filesystem"
complete -c ipfs -x -n "$__files_write_cond" -s o -l offset -d "int64 - Byte offset to begin writing at"
complete -c ipfs -f -n "$__files_write_cond" -s e -l create -d "bool - Create the file if it does not exist"
complete -c ipfs -f -n "$__files_write_cond" -s p -l parents -d "bool - Make parent directories as needed"
complete -c ipfs -f -n "$__files_write_cond" -s t -l truncate -d "bool - Truncate the file to size zero before writing"
complete -c ipfs -x -n "$__files_write_cond" -s n -l count -d "int64 - Maximum number of bytes to read"
complete -c ipfs -f -n "$__files_write_cond" -l raw-leaves -d "bool - Use raw blocks for newly created leaf nodes (experimental)"
complete -c ipfs -x -n "$__files_write_cond" -l cid-ver -l cid-version -d "int - Cid version to use (experimental)"
complete -c ipfs -x -n "$__files_write_cond" -l hash -d "string - Hash function to use. Will set Cid version to 1 if used (experimental)"


### dag
set -gu __dag_cond "__fish_seen_subcommand_from dag"
set -gu __dag_export_cond "$__dag_cond; and __fish_seen_subcommand_from export"
set -gu __dag_import_cond "$__dag_cond; and __fish_seen_subcommand_from import"
set -gu __dag_put_cond "$__dag_cond; and __fish_seen_subcommand_from put"
set -gu __dag_stat_cond "$__dag_cond; and __fish_seen_subcommand_from stat"

complete -c ipfs -n __fish_use_subcommand -x -a dag -d "Interact with IPLD documents (experimental)"

complete -c ipfs -x -n "$__dag_cond" -a export -d "Streams the selected DAG as a .car stream on stdout"
complete -c ipfs -f -n "$__dag_export_cond" -s p -l progress -d "bool - Display progress on CLI (Default: stderr)"

complete -c ipfs -x -n "$__dag_cond" -a get -d "Get a dag node from ipfs"

complete -c ipfs -x -n "$__dag_cond" -a import -d "Import the contents of .car files"
complete -c ipfs -f -n "$__dag_import_cond" -l silent -d "bool - No output"
complete -c ipfs -f -n "$__dag_import_cond" -l pin-roots -d "bool - Pin this object when adding"

complete -c ipfs -x -n "$__dag_cond" -a put -d "Add a dag node to ipfs"
complete -c ipfs -x -n "$__dag_put_cond" -s f -l format -d "string - Format that the object will be added as (Default: cbor)"
complete -c ipfs -x -n "$__dag_put_cond" -l input-enc -d "string - Format that the input object will be (Default: json)"
complete -c ipfs -f -n "$__dag_put_cond" -l pin -d "bool - Pin optional roots listed in the .car headers after importing (Default: true)"
complete -c ipfs -x -n "$__dag_put_cond" -l hash -d "string - Hash function to use (Default: .)"

complete -c ipfs -x -n "$__dag_cond" -a resolve -d "Resolve ipld block"

complete -c ipfs -x -n "$__dag_cond" -a stat -d "Gets stats for a DAG"
complete -c ipfs -f -n "$__dag_stat_cond" -s p -l progress -d "bool - Return progressive data while reading through the DAG (Default: true)"

## Advanced Commands
### daemon
set -gu __daemon_cond "__fish_seen_subcommand_from daemon"

complete -c ipfs -n __fish_use_subcommand -x -a daemon -d "Start a long-running daemon process"

complete -c ipfs -f -n "$__daemon_cond" -l init -d "bool - Initialize ipfs with default settings if not already initialized"
complete -c ipfs -F -n "$__daemon_cond" -l init-config -d "string - Path to existing configuration file to be loaded during --init"
complete -c ipfs -x -n "$__daemon_cond" -l init-profile -d "string - Configuration profiles to apply for --init. See ipfs init --help for more"
complete -c ipfs -x -n "$__daemon_cond" -l routing -d "string - Overrides the routing option (Default: default)"
complete -c ipfs -f -n "$__daemon_cond" -l mount -d "bool - Mounts IPFS to the filesystem"
complete -c ipfs -f -n "$__daemon_cond" -l writable -d "bool - Enable writing objects (with POST, PUT and DELETE)"
complete -c ipfs -F -n "$__daemon_cond" -l mount-ipfs -d "string - Path to the mountpoint for IPFS (if using --mount) (Defaults to config setting)"
complete -c ipfs -F -n "$__daemon_cond" -l mount-ipns -d "string - Path to the mountpoint for IPNS (if using --mount) (Defaults to config setting)"
complete -c ipfs -f -n "$__daemon_cond" -l unrestricted-api -d "bool - Allow API access to unlisted hashes"
complete -c ipfs -f -n "$__daemon_cond" -l disable-transport-encryption -d "bool - Disable transport encryption (for debugging protocols)"
complete -c ipfs -f -n "$__daemon_cond" -l enable-gc -d "bool - Enable automatic periodic repo garbage collection"
complete -c ipfs -f -n "$__daemon_cond" -l manage-fdlimit -d "bool - Check and raise file descriptor limits if needed (Default: true)"
complete -c ipfs -f -n "$__daemon_cond" -l migrate -d "bool - If true, assume yes at the migrate prompt. If false, assume no"
complete -c ipfs -f -n "$__daemon_cond" -l enable-pubsub-experiment -d "bool - Instantiate the ipfs daemon with the experimental pubsub feature enabled"
complete -c ipfs -f -n "$__daemon_cond" -l enable-namesys-pubsub -d "bool - Enable IPNS record distribution through pubsub; enables pubsub."

### mount
set -gu __mount_cond "__fish_seen_subcommand_from mount"

complete -c ipfs -n __fish_use_subcommand -x -a mount -d " Mount an IPFS read-only mount point"

complete -c ipfs -F -n "$__mount_cond" -s f -l ipfs-path -d "string - The path where IPFS should be mounted"
complete -c ipfs -F -n "$__mount_cond" -s n -l ipns-path -d "string - The path where IPNS should be mounted"

### resolve
set -gu __resolve_cond "__fish_seen_subcommand_from resolve"

complete -c ipfs -n __fish_use_subcommand -x -a resolve -d "Resolve any type of name"

complete -c ipfs -f -n "$__resolve_cond" -s r -l recursive -d "bool - Resolve until the result is an IPFS name (Default: true)"
complete -c ipfs -x -n "$__resolve_cond" -l dhtrc -l dht-record-count -d "int - Number of records to request for DHT resolution"
complete -c ipfs -x -n "$__resolve_cond" -l dhtt -l dht-timeout -d "string - Max time to collect values during DHT resolution eg '30s'. Pass 0 for no timeout"

### name
set -gu __name_cond "__fish_seen_subcommand_from name"
set -gu __name_publish_cond "__fish_seen_subcommand_from name; and __fish_seen_subcommand_from publish"
set -gu __name_pubsub_cond "__fish_seen_subcommand_from name; and __fish_seen_subcommand_from pubsub"
set -gu __name_resolve_cond "__fish_seen_subcommand_from name; and __fish_seen_subcommand_from resolve"

complete -c ipfs -n __fish_use_subcommand -x -a name -d "Publish and resolve IPNS names"

complete -c ipfs -x -n "$__name_cond" -a publish -d "Publish IPNS names"
complete -c ipfs -f -n "$__name_publish_cond" -l resolve -d "bool - Check if the given path can be resolved before publishing (Default: true)"
complete -c ipfs -x -n "$__name_publish_cond" -s t -l lifetime -d "string - Time duration that the record will be valid for (Default: 24h)"
complete -c ipfs -f -n "$__name_publish_cond" -l allow-offline -d "bool - When offline, save the IPNS record to the the local datastore without broadcasting to the network instead of simply failing"
complete -c ipfs -x -n "$__name_publish_cond" -l ttl -d "string - Time duration this record should be cached for. Uses the same syntax as the lifetime option (caution: experimental)"
complete -c ipfs -x -n "$__name_publish_cond" -s k -l key -d "string - Name of the key to be used or a valid PeerID, as listed by 'ipfs key list -l' (Default: self)"
complete -c ipfs -f -n "$__name_publish_cond" -s Q -l quieter -d "bool - Write only final hash"
complete -c ipfs -x -n "$__name_publish_cond" -l ipns-base -d "string - Encoding used for keys: Can either be a multibase encoded CID or a base58btc encoded multihash. Takes {b58mh|base36|k|base32|b...} (Default: base36)"

complete -c ipfs -x -n "$__name_cond" -a pubsub -d "IPNS pubsub management"
complete -c ipfs -x -n "$__name_pubsub_cond" -a cancel -d "Cancel a name subscription"
complete -c ipfs -f -n "$__name_pubsub_cond" -a state -d "Query the state of IPNS pubsub"
complete -c ipfs -f -n "$__name_pubsub_cond" -a subs -d "Show current name subscriptions"

complete -c ipfs -x -n "$__name_cond" -a resolve -d "Resolve IPNS names"
complete -c ipfs -f -n "$__name_resolve_cond" -s r -l recursive -d "bool - Resolve until the result is not an IPNS name (Default: true)"
