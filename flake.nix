{
  description = "Coq Dev Environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      # system = "x86_64-darwin";
    in
    {
      devShells."${system}".default =
        let
          pkgs = import nixpkgs {
            inherit system;
          };
        in
        pkgs.mkShell {
          packages = with pkgs; [
            coq
            coqPackages.stdlib
            coqPackages.coq-elpi
            coqPackages.vscoq-language-server
          ];
          shell = nixpkgs.legacyPackages.x86_64-linux.zsh;
          shellHook = ''
            echo "Welcome to the Rocq Shell!"
            echo "We will Rocq you up!"
            rocq --version
          '';
          ROCQ_ENV = 1;
        };
    };
}
