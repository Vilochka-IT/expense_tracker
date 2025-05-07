# To learn more about how to use Nix to configure your environment
# see: https://firebase.google.com/docs/studio/customize-workspace
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-24.05"; # or "unstable"

  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.dart
    pkgs.jdk17
    pkgs.unzip


    # pkgs.go
    # pkgs.python311
    # pkgs.python311Packages.pip
    # pkgs.nodejs_20
    # pkgs.nodePackages.nodemon
  ];

  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"
    ];

    # Enable previews
    previews = {
    enable = true;
    previews = {
      web = {
        command = [
          "flutter" "run" "--machine" "-d" "web-server"
          "--web-hostname" "0.0.0.0" "--web-port" "$PORT"
        ];
        manager = "flutter";
        cwd = "expense_tracker_client";
      };
      android = {
        command = [
          "flutter" "run" "--machine" "-d" "android"
          "-d" "localhost:5555"
        ];
        manager = "flutter";
        cwd = "expense_tracker_client";
      };
    };
  };

    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        # Example: install JS dependencies from NPM
        # npm-install = "npm install";
      };
      # Runs when the workspace is (re)started
      onStart = {
        # Example: start a background task to watch and re-build backend code
        # watch-backend = "npm run watch-backend";
      };
    };
  };
}

