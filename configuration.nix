{ self, config, pkgs, lib, inputs, ... }:
let
  overlay = final: prev: {
    pr134283 = inputs.pr134283.legacyPackages.${prev.system};
  };
in {
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "slack"
  ];

  nixpkgs.overlays = [ overlay ];
  
  environment = {
    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    systemPackages = [
      pkgs.vscodium
      pkgs.direnv
      pkgs.htop
      pkgs.slack
      pkgs.pr134283.iterm2
      pkgs.imgcat
      (pkgs.callPackage ./ungoogled-chromium.nix {})
      (pkgs.callPackage ./ledger-live.nix {})
      (pkgs.callPackage ./firefox.nix {})
      (pkgs.callPackage ./brave-browser.nix {})
      (pkgs.callPackage ./transmission.nix {})
      (pkgs.callPackage ./iina.nix {})
      (pkgs.callPackage ./infinity-wallet.nix {})
    ];
  };

  homebrew = {
    enable = false;
    autoUpdate = true;
    global = {
      brewfile = true;
      noLock = true;
    };

    brews = [
      "mas"
    ];

    masApps = {
      "Unsplash Wallpapers" = 1284863847;
      "MonoSwitch" = 1568916578;
      "Trello" = 1278508951;
      "Messenger" = 1480068668;
      "Jira" = 1475897096;
      "Magnet" = 441258766;
      "Speedtest" = 1153157709;
      "Apple Configurator 2" = 1037126344;
      "Micrososft To Do" = 1274495053;
      "Twitter" = 1482454543;
      "Pasteboard Veiwer" = 1499215709;
      "Cloud Battery" = 1481005137;
    };
  };

  programs.fish = {
    enable = true;
  };

  system.stateVersion = 4;
}


#   programs.fish = {
#     enable = true;

#     # plugins = [
#     #   {
#     #     name = "bass";
#     #     src = pkgs.fetchFromGitHub {
#     #       owner = "edc";
#     #       repo = "bass";
#     #       rev = "50eba266b0d8a952c7230fca1114cbc9fbbdfbd4";
#     #       sha256 = "0ppmajynpb9l58xbrcnbp41b66g7p0c9l2nlsvyjwk6d16g4p4gy";
#     #     };
#     #   }

#     #   {
#     #     name = "foreign-env";
#     #     src = pkgs.fetchFromGitHub {
#     #       owner = "oh-my-fish";
#     #       repo = "plugin-foreign-env";
#     #       rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
#     #       sha256 = "00xqlyl3lffc5l0viin1nyp819wf81fncqyz87jx8ljjdhilmgbs";
#     #     };
#     #   }
#       # {
#       #   name = "bobthefish";
#       #   src = pkgs.fetchFromGitHub {
#       #     owner = "oh-my-fish";
#       #     repo = "theme-bobthefish";
#       #     rev = "a2ad38aa051aaed25ae3bd6129986e7f27d42d7b";
#       #     sha256 = "1fssb5bqd2d7856gsylf93d28n3rw4rlqkhbg120j5ng27c7v7lq";
#       #   };
#       # }


#   # xdg.configFile."fish/conf.d/plugin-bobthefish.fish".text = lib.mkAfter ''
#   #   for f in $plugin_dir/*.fish
#   #     source $f
#   #   end
#   #   '';
#   };
