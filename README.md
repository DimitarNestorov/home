Begin by installing Xcode (iTerm requires it)

```sh
. ~/.nix-profile/etc/profile.d/nix.sh
nix build .#darwinConfigurations.Dimitars-Work-Hackintosh.system --experimental-features "nix-command flakes"
./result/sw/bin/darwin-rebuild switch --flake .#Dimitars-Work-Hackintosh
sudo chown -R dimitarnestorov /nix/store # Permissions are broken, needed correct permissions by direnv
```

===

When there are issues:

```sh
# error: opening lock file '/nix/store/ddmm7n30795qxv5yi01jh7mrimf20i34-source.lock': Permission denied
#
#        … while fetching the input 'git+file:///Users/dimitarnestorov'

sudo chown -R dimitarnestorov /nix/store
```
