{ stdenv, undmg, fetchurl }:
stdenv.mkDerivation rec {
  pname = "Transmission";
  version = "3.00";

  buildInputs = [ undmg ];
  sourceRoot = ".";
  phases = [ "unpackPhase" "installPhase" ];

  src = fetchurl {
    url = "https://github.com/transmission/transmission-releases/raw/master/Transmission-${version}.dmg";
    sha256 = "f9984b6ba51a02bb8f880c538b28e2c7d6a3b7a22257a166cc3e1d55a133ab34";
  };

  installPhase = ''
    mkdir -p "$out/Applications/Transmission.app"
    cp -r "Transmission.app" "$out/Applications"
  '';
}