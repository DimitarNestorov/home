{
  description = "System configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-21.05-darwin";
    pr134283.url = "github:nixos/nixpkgs?rev=d0399846920aa1b6bf2c175f62aa2d1538d04e50";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, darwin, nixpkgs, pr134283 }: 
  let
    configuration = { pkgs, ... }: {
      nix = {
        package = pkgs.nixFlakes;
        
        extraOptions = ''
          experimental-features = nix-command flakes
        '';
      };

      services.nix-daemon.enable = true;
    };
  in {
    darwinConfigurations."Dimitars-Work-Hackintosh" = darwin.lib.darwinSystem {
      modules = [ configuration ./configuration.nix ];
      inputs = { inherit darwin nixpkgs pr134283; };
      system = "x86_64-darwin";
    };

    darwinPackages = self.darwinConfigurations."Dimitars-Work-Hackintosh".pkgs;
  };
}

