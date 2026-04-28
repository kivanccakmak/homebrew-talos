class Talcli < Formula
  desc "CLI tool for Talos Works — 500+ MCP tools, label printing, ERP integration"
  homepage "https://talos.works"
  version "2.1.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/talos-binaries/releases/download/v2.1.0/talcli_2.1.0_darwin-arm64.tar.gz"
      sha256 "8de1e7bb871681d5087c85be958c64c30f0cdf2b21be7924c6169e70be33fa92"

      def install
        bin.install "talcli-darwin-arm64" => "talcli"
      end
    else
      url "https://github.com/kivanccakmak/talos-binaries/releases/download/v2.1.0/talcli_2.1.0_darwin-amd64.tar.gz"
      sha256 "0f4e844ab79fda8314b5a2bdace23b422bdbec45179208eb61cabdef50e9c7dd"

      def install
        bin.install "talcli-darwin-amd64" => "talcli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/talos-binaries/releases/download/v2.1.0/talcli_2.1.0_linux-arm64.tar.gz"
      sha256 "1f15dce3302cb9079f6c932906b5bfe1594cd0512ceb231f380bc260db3b8a96"

      def install
        bin.install "talcli-linux-arm64" => "talcli"
      end
    else
      url "https://github.com/kivanccakmak/talos-binaries/releases/download/v2.1.0/talcli_2.1.0_linux-amd64.tar.gz"
      sha256 "4ac5c1be2dc77da4b47a08d470e9f8576dad8dd9c246199f85103b73349a9aa3"

      def install
        bin.install "talcli-linux-amd64" => "talcli"
      end
    end
  end

  test do
    system "#{bin}/talcli", "version"
  end
end
