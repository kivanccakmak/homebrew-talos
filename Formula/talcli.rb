class Talcli < Formula
  desc "CLI and MCP server for the Talos manufacturing operations platform"
  homepage "https://talos.works"
  version "2.1.2"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/talos-binaries/releases/download/v2.1.2/talcli_2.1.2_darwin-arm64.tar.gz"
      sha256 "8cb608749950bb7996545014824303d0edf919b7cb334523dbe59887c6566228"

    else
      url "https://github.com/kivanccakmak/talos-binaries/releases/download/v2.1.2/talcli_2.1.2_darwin-amd64.tar.gz"
      sha256 "d2e99d1e699107f0a292bac1409b862a1e0ee3d4c71f2d1aa2d27b4a0f529e22"

    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/talos-binaries/releases/download/v2.1.2/talcli_2.1.2_linux-arm64.tar.gz"
      sha256 "b635e1ebd4b04af9b88b4746aa354eadbfa74ece56c24c497965ca6471461e76"

    else
      url "https://github.com/kivanccakmak/talos-binaries/releases/download/v2.1.2/talcli_2.1.2_linux-amd64.tar.gz"
      sha256 "ff66513452112a0083bdeb189e78ad114d7d79d0bb80f23a3702837e01063bee"

    end
  end

  def install
    bin.install "talcli"
  end

  test do
    system "#{bin}/talcli", "version"
  end
end
