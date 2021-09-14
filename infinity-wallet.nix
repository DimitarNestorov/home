{ stdenv, undmg, fetchurl }:
stdenv.mkDerivation rec {
  pname = "Infinity-Wallet";
  version = "1.0.80";

  buildInputs = [ undmg ];
  sourceRoot = ".";
  phases = [ "unpackPhase" "installPhase" ];

  src = fetchurl {
    url = "https://github.com/InfinityWallet/Releases/releases/download/v${version}-beta/InfinityWallet-${version}-beta.dmg";
    sha256 = "5cf18071ffed1190a3eb96b2d47d91f1736474705562ad974cedbd591bb69ccd";
  };

  installPhase = ''
    mkdir -p "$out/Applications/"
    cp -r "InfinityWallet.app" "$out/Applications/"
    mv "$out/Applications/InfinityWallet.app" "$out/Applications/Infinity Wallet.app"
  '';
}