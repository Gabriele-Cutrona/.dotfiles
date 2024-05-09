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
  };

  programs.git = {
    enable = true;
    userName = "Gabriele-Cutrona";
    userEmail = "106313541+Gabriele-Cutrona@users.noreply.github.com";
    extraConfig.color.ui = "auto";
    extraConfig.init.defaultBranch = "main";
  };

  programs.nixvim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    opts.number = true;
    opts.relativenumber = true;

    clipboard.register = "unnamedplus";
    clipboard.providers.wl-copy.enable = true;

    keymaps = [ { key = "<Space>e"; action = "<cmd>NvimTreeToggle<CR>"; } { key = "<Space>w"; action = "<cmd>ToggleTerm<CR>"; } ];

    plugins = {
      telescope.enable = true;
      luasnip.enable = true;
      bufferline.enable = true;
      lualine.enable = true;
      leap.enable = true;
      nvim-tree.enable = true;
      nix.enable = true;
      nvim-autopairs.enable = true;
      toggleterm.enable = true;
      which-key.enable = true;

      lsp.enable = true;
      lsp.servers.tsserver.enable = true;

      cmp.enable = true;
      cmp.settings.sources = [{name = "nvim_lsp";} {name = "path";} {name = "buffer";}];
      cmp.settings.mapping = {
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<C-n>" = "cmp.mapping.select_next_item()";
        "<C-p>" = "cmp.mapping.select_prev_item()";
        "<Tab>" = "cmp.mapping.confirm({ select = true })";
      };
    };

    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
    };
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

    pkgs.pamixer
    pkgs.asciiquarium-transparent
    pkgs.brightnessctl
    pkgs.grimblast
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
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    ".zshrc".source = dotFiles/zshrc;
    ".themes".source = dotFiles/themes;
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
