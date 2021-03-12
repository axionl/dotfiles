# Completions for `zola` command

# Options
complete -c zola -f -s h -l help -d "Prints help information"
complete -c zola -f -s V -l version -d "Prints version information"

complete -c zola -F -s c -l config -d "Path to a config file other than config.toml in the root of project"
complete -c zola -x -s r -l root -d "Directory to use as root of project [default: .]"

# Subcommands
complete -c zola -n __fish_use_subcommand -f -a build -d "Deletes the output directory if there is one and builds the site"
complete -c zola -n __fish_use_subcommand -f -a check -d "Try building the project without rendering it. Checks links"
complete -c zola -n __fish_use_subcommand -f -a help -d "Prints this message or the help of the given subcommand(s)"
complete -c zola -n __fish_use_subcommand -f -a init -d "Create a new Zola project"
complete -c zola -n __fish_use_subcommand -f -a serve -d "Serve the site. Rebuild and reload on change automatically"
