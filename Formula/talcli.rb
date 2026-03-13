class Talcli < Formula
  desc "CLI tool for Talos Works — full CRUD, MCP server, label printing"
  homepage "https://talos.works"
  version "0.7.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/talos-desktop-tools/releases/download/v1.1.8/talcli-0.7.0-darwin-arm64"
      sha256 "64e36eb45977613cc087c6668bb42e20f566c8067f131b8a7294b1b96c7ab91b"

      def install
        bin.install "talcli-0.7.0-darwin-arm64" => "talcli"
      end
    else
      url "https://github.com/kivanccakmak/talos-desktop-tools/releases/download/v1.1.8/talcli-0.7.0-darwin-amd64"
      sha256 "202ec73c1cf418d3b6247c6367a16d828ce136013e448af8ff44bb2f6e81209e"

      def install
        bin.install "talcli-0.7.0-darwin-amd64" => "talcli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/talos-desktop-tools/releases/download/v1.1.8/talcli-0.7.0-linux-arm64"
      sha256 "2021129a6f8c93c8c7bd28cb8311b08210bc3cb9d108fd758a92cd8ad0975f3c"

      def install
        bin.install "talcli-0.7.0-linux-arm64" => "talcli"
      end
    else
      url "https://github.com/kivanccakmak/talos-desktop-tools/releases/download/v1.1.8/talcli-0.7.0-linux-amd64"
      sha256 "4e53a4c078aed3b65d8f5d6974e4cfc1aaadc954352d49cdc50bc1f664f6e569"

      def install
        bin.install "talcli-0.7.0-linux-amd64" => "talcli"
      end
    end
  end

  test do
    system "#{bin}/talcli", "version"
  end
end
