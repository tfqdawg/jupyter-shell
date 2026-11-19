## <p align="center"> Jupyter Nix-Shell </p>

#### Shell Details
- Requires [Nix](https://nixos.org/download/) to be installed.
- A minimal `nix-shell` that i use for my data science works.
- No python virtual environment, since `nix-shell` is used.
- The shell was setup in a way that all runtimes, caches, configs, temporary files, etc., are redirected locally under `.nix-local/` to keep the global system clean (Just a personal thing for me.)
- Remove the entirety of `shellHook = '' ... '';` if no redirects are required by project. 

#### To Use
1. Clone repo.
2. Switch git remote.
3. Declare packages/env variable inside [*shell.nix*](shell.nix) as needed.
4. Activate nix-shell using,
```bash
# bash
nix-shell
```
5. When done, exit using,
```nix-shell
# nix-shell
exit
```

#### To Do
- [ ] progress into flake (from `shell.nix` to `flake.nix`)
