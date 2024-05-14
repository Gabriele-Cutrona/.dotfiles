{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it shouldflake.lock
  # manage.
  home.username = "gabriele-cutrona";
  home.homeDirectory = "/home/gabriele-cutrona";
  targets.genericLinux.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [ fcitx5-mozc fcitx5-gtk ];
    fcitx5.catppuccin.enable = true;
  };

  programs.git = {
    enable = true;
    userName = "Gabriele-Cutrona";
    userEmail = "106313541+Gabriele-Cutrona@users.noreply.github.com";
    extraConfig.color.ui = "auto";
    extraConfig.init.defaultBranch = "main";
  };

  xdg.enable = true;
  catppuccin = {
    flavour = "mocha";
    accent = "lavender";
  };

  gtk = {
    enable = true;
    catppuccin.enable = true;
    iconTheme.name = "Papirus";
    iconTheme.package = pkgs.papirus-icon-theme;
  };
  services.mako.enable = true;
  services.mako.catppuccin.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    pkgs.fastfetch
    pkgs.eza
    pkgs.bat
    pkgs.sl
    pkgs.zoxide
    pkgs.cava

    pkgs.micro
    pkgs.neovim
    pkgs.wl-clipboard
    pkgs.lazygit
    pkgs.nodejs

    pkgs.pamixer
    pkgs.asciiquarium-transparent
    pkgs.brightnessctl
    pkgs.grimblast
    pkgs.freetube
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # symlink to the Nix store copy.
    ".zshrc".source = dotFiles/zshrc;
    ".themes".source = dotFiles/themes;
    ".config/nvim/init.lua".source = ./init.lua;
    ".config/wofi".source = dotFiles/wofi;
    ".config/hypr".source = dotFiles/hypr;
    ".config/waybar".source = dotFiles/waybar;
    ".local/share/blackbox/schemes/Catppuccin-Mocha.json".source = dotFiles/Catppuccin-Mocha.json;


    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/gabriele-cutrona/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
