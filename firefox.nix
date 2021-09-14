{ stdenv, undmg, fetchurl }:
stdenv.mkDerivation rec {
  pname = "Firefox";
  version = "92.0";

  buildInputs = [ undmg ];
  sourceRoot = ".";
  phases = [ "unpackPhase" "installPhase" ];

  src = fetchurl {
    url = "https://download-installer.cdn.mozilla.net/pub/firefox/releases/${version}/mac/en-US/Firefox+${version}.dmg";
    sha256 = "68978c990d06ab94364a36c49d220aeb4e07a8c5d9eaa677bb154a300612964e";
  };

  installPhase = ''
    mkdir -p "$out/Applications/Firefox.app"
    cp -r "Firefox.app" "$out/Applications"
  '';
}