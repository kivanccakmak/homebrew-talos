class Talcli < Formula
  desc "CLI tool for Talos Works — 500+ MCP tools, label printing, ERP integration"
  homepage "https://talos.works"
  version "2.0.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/talos-desktop-tools/releases/download/v2.0.0/talcli-2.0.0-darwin-arm64"
      sha256 "85a735c818db9d3aaaf8a3793cc9d25694284ca3ecc0a81bd9fd0282e27a3576"

      def install
        bin.install "talcli-2.0.0-darwin-arm64" => "talcli"
      end
    else
      url "https://github.com/kivanccakmak/talos-desktop-tools/releases/download/v2.0.0/talcli-2.0.0-darwin-amd64"
      sha256 "ff2898c2cd6653e184b5eb6e3dd0f1f732a9e3c8adf3c4db5e862846eb1bc38e"

      def install
        bin.install "talcli-2.0.0-darwin-amd64" => "talcli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/talos-desktop-tools/releases/download/v2.0.0/talcli-2.0.0-linux-arm64"
      sha256 "d0a3ea63a2b52a75cece0e931abfe66323ab3a03ec8616ef503226e228afc5c8"

      def install
        bin.install "talcli-2.0.0-linux-arm64" => "talcli"
      end
    else
      url "https://github.com/kivanccakmak/talos-desktop-tools/releases/download/v2.0.0/talcli-2.0.0-linux-amd64"
      sha256 "df743037b3fd1625c6b3cc3272cab52d5123126d7e35a14a8ce9ec84d9937cb9"

      def install
        bin.install "talcli-2.0.0-linux-amd64" => "talcli"
      end
    end
  end

  test do
    system "#{bin}/talcli", "version"
  end
end
