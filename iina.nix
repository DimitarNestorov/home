{ stdenv, undmg, fetchurl }:
stdenv.mkDerivation rec {
  pname = "IINA";
  version = "1.1.2";

  buildInputs = [ undmg ];
  sourceRoot = ".";
  phases = [ "unpackPhase" "installPhase" ];

  src = fetchurl {
    url = "https://dl-portal.iina.io/IINA.v${version}.dmg";
    sha256 = "783ff165c73839c87cf9fd5f4418b87131063c3be77abc94dfca0585aa992b98";
  };

  installPhase = ''
    mkdir -p "$out/Applications/IINA.app"
    cp -r "IINA.app" "$out/Applications"
  '';
}