{ stdenv, undmg, fetchurl }:
stdenv.mkDerivation rec {
  pname = "Ungoogled-Chromium";
  version = "92.0.4515.159-1.1_x86-64";

  buildInputs = [ undmg ];
  sourceRoot = ".";
  phases = [ "unpackPhase" "installPhase" ];

  src = fetchurl {
    url = "https://github.com/kramred/ungoogled-chromium-macos/releases/download/${version}/ungoogled-chromium_${version}-macos.dmg";
    sha256 = "1ef1120e242a9ebd874ee06cd42c40c9d4160edbbd9f4d04c154b38849be4e31";
  };

  installPhase = ''
    mkdir -p "$out/Applications/Chromium.app"
    cp -r Chromium.app "$out/Applications"
  '';
}