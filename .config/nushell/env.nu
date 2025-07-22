^ssh-agent -c
	| lines
	| first 2
	| parse "setenv {name} {value};"
	| transpose -r
	| into record
	| load-env

zoxide init nushell --cmd cd | save -f ~/.cache/.zoxide.nu
mise activate nu | save -f ~/.cache/.mise.nu

$env.EDITOR = "nvim"
$env.VISUAL = "nvim"
