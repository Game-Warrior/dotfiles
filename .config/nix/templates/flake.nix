
{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { self, nixpkgs }: {

    packages.aarch64-darwin = {
      defaultPackage = let
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;
      in pkgs.buildEnv {
        name = "home-packages";
        paths = with pkgs; [
          # general tools
        ];
      };
    };

    # Define a development shell for 'aarch64-darwin'
    devShells.aarch64-darwin.default = let
      pkgs = nixpkgs.legacyPackages.aarch64-darwin;
    in pkgs.mkShell {
      buildInputs = with pkgs; [
        # List of packages
      ];
    };

    packages = {
      x86_64-linux = {
        defaultPackage = let
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
        in pkgs.buildEnv {
          name = "home-packages";
          paths = with pkgs; [
            # general tools
          ];
         };
       };
     };

    devShells.x86_64-linux.default = let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in pkgs.mkShell {
      buildInputs = with pkgs; [
        # List of packages
      ];
    };
  };
}
