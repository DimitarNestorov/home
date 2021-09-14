{ stdenv, undmg, fetchurl }:
stdenv.mkDerivation rec {
  pname = "Ledger-Live";
  version = "2.33.1";

  buildInputs = [ undmg ];
  sourceRoot = ".";
  phases = [ "unpackPhase" "installPhase" ];

  src = fetchurl {
    url = "https://github.com/LedgerHQ/ledger-live-desktop/releases/download/v${version}/ledger-live-desktop-${version}-mac.dmg";
    sha256 = "sha256-x+3dkXjUHaY6wvFleJVHbCOaSAXq9+Xop0HglBjYuaY=";
  };

  installPhase = ''
    mkdir -p "$out/Applications/Ledger Live.app"
    cp -r "Ledger Live.app" "$out/Applications"
  '';
}