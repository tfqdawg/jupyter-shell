{ pkgs ? import <nixpkgs> { } }:

let
  python = pkgs.python3.withPackages (py: [
		# python 
		py.numpy
		py.pandas
		py.scipy
		py.scikit-learn
		py.matplotlib
		py.seaborn

		# jupyter
		py.jupyterlab
		py.notebook
		py.jupyter
		py.ipykernel
		py.jedi
  ]);
in
pkgs.mkShell {
  packages = [
		python
	];

  shellHook = ''
    # project root 
    export PROJECT_ROOT="$PWD"
    export LOCAL_ENV="$PROJECT_ROOT/.nix-local"

    # xdg
    export XDG_CACHE_HOME="$LOCAL_ENV/cache"
    export XDG_CONFIG_HOME="$LOCAL_ENV/config"
    export XDG_DATA_HOME="$LOCAL_ENV/share"
    export XDG_STATE_HOME="$LOCAL_ENV/state"
    export XDG_RUNTIME_DIR="$LOCAL_ENV/runtime"

    # python specifics
    export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
    export JUPYTER_DATA_DIR="$XDG_DATA_HOME/jupyter"
    export JUPYTER_RUNTIME_DIR="$XDG_RUNTIME_DIR/jupyter"
		export JUPYTER_PATH="$XDG_DATA_HOME/jupyter"
		export JUPYTER_PLATFORM_DIRS=1
		export JUPYTERLAB_SETTINGS_DIR="$JUPYTER_CONFIG_DIR/lab/user-settings"
		export JUPYTERLAB_WORKSPACES_DIR="$JUPYTER_CONFIG_DIR/lab/workspaces"
    export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
    export MPLCONFIGDIR="$XDG_CONFIG_HOME/matplotlib"
    export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME/pycache"
    export PYTHONUSERBASE="$LOCAL_ENV/pyuser"
    export PYTHONDONTWRITEBYTECODE=1
		export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"
		export SCIKIT_LEARN_DATA="$XDG_CACHE_HOME/scikit_learn"
		export SEABORN_DATA="$XDG_CACHE_HOME/seaborn"
		export HISTFILE="$XDG_STATE_HOME/bash_history"

		# temp
		export TMPDIR="$LOCAL_ENV/tmp"

    mkdir -p "$XDG_CACHE_HOME" "$XDG_CONFIG_HOME" "$XDG_DATA_HOME" \
			"$XDG_STATE_HOME" "$JUPYTER_CONFIG_DIR" "$JUPYTER_DATA_DIR" \
			"$JUPYTERLAB_SETTINGS_DIR" "$JUPYTERLAB_WORKSPACES_DIR" \
			"$IPYTHONDIR" "$MPLCONFIGDIR" "$TMPDIR" "$HOME"

    mkdir -p -m 700 "$XDG_RUNTIME_DIR" "$JUPYTER_RUNTIME_DIR"
  '';
}
