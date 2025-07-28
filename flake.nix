{
  description = "Coq Dev Environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              rocq-core
              coqPackages.stdlib
              coqPackages.coq-elpi
              coqPackages.vscoq-language-server
            ];
            shell = pkgs.zsh;
            shellHook = ''
              echo "Welcome to the Rocq Shell!"
              echo "We will Rocq you up!"
              echo "Current system: ${system}"
              rocq --version
            '';
            ROCQ_ENV = 1;
          };
        }
      );
    };
}
