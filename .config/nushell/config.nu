source ./catppuccin_mocha.nu

$env.LS_COLORS = (vivid generate catppuccin-mocha)
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
