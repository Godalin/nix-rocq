{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
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
    rocq --version
  '';
  ROCQ_ENV = 1;
}
