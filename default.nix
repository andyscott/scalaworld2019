let
  inherit (import <nixpkgs> {}) fetchFromGitHub;
  nixpkgs = fetchFromGitHub {
    owner  = "NixOS";
    repo   = "nixpkgs";
    rev    = "release-18.09";
    sha256 = "1ib96has10v5nr6bzf7v8kw7yzww8zanxgw2qi1ll1sbv6kj6zpd";
  };
  pkgs = import nixpkgs {};
  texlive = pkgs.texlive.combine {
    inherit (pkgs.texlive)
    scheme-small
    noto
    mweights
    cm-super
    cmbright
    fontaxes
    csquotes
    wrapfig
    pgf
    cutwin
    beamer;
  };
in {
  scala-world-2019 = pkgs.stdenv.mkDerivation {
    name = "scala-world-2019";
    src = ./.;

    buildInputs = [
      texlive
      pkgs.pandoc
    ];
  };
}
