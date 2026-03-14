class Talcli < Formula
  desc "CLI tool for Talos Works — full CRUD, MCP server, label printing"
  homepage "https://talos.works"
  version "0.8.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/talos-desktop-tools/releases/download/v1.1.9/talcli-0.8.0-darwin-arm64"
      sha256 "8d05340ae4ef84ea01c7097dfaa9bc523d00a985759b82b77c512b0b05385966"

      def install
        bin.install "talcli-0.8.0-darwin-arm64" => "talcli"
      end
    else
      url "https://github.com/kivanccakmak/talos-desktop-tools/releases/download/v1.1.9/talcli-0.8.0-darwin-amd64"
      sha256 "6e195cd0004144c8745e318be4d8cff106b2990ddf4789ac568169b04bf390c6"

      def install
        bin.install "talcli-0.8.0-darwin-amd64" => "talcli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/talos-desktop-tools/releases/download/v1.1.9/talcli-0.8.0-linux-arm64"
      sha256 "afcc2c655c39137383c83f56af0c76af81c71765b492f8b92db605aef4f0a139"

      def install
        bin.install "talcli-0.8.0-linux-arm64" => "talcli"
      end
    else
      url "https://github.com/kivanccakmak/talos-desktop-tools/releases/download/v1.1.9/talcli-0.8.0-linux-amd64"
      sha256 "8fb0cdafd5ba530d81ea37a0c6ff792833d2e4f7a0b5dd641df73eb815fdc3f6"

      def install
        bin.install "talcli-0.8.0-linux-amd64" => "talcli"
      end
    end
  end

  test do
    system "#{bin}/talcli", "version"
  end
end
