{ stdenv, undmg, fetchurl }:
stdenv.mkDerivation rec {
  pname = "Brave-Browser";
  version = "1.29.80";

  buildInputs = [ undmg ];
  sourceRoot = ".";
  phases = [ "unpackPhase" "installPhase" ];

  src = fetchurl {
    url = "https://github.com/brave/brave-browser/releases/download/v${version}/Brave-Browser-x64.dmg";
    sha256 = "2d3ee87acf18fce7ae7e62fdc5c4f55fd409a64478b55ad3c637224d80c1e312";
  };

  installPhase = ''
    mkdir -p "$out/Applications/Brave Browser.app"
    cp -r "Brave Browser.app" "$out/Applications"
  '';
}