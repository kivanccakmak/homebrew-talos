class Talcli < Formula
  desc "CLI tool for the Talos manufacturing operations platform"
  homepage "https://talos.works"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_darwin-arm64.tar.gz"
      sha256 "b40d3e15647ec96e5de4c24c95e9d9d5415af088d8b3a9de89571a6113a20def"
    else
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_darwin-amd64.tar.gz"
      sha256 "bb434f7781203373447125cecbeeb483069ad9cee2f670e70c1c5f6899b424e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_linux-arm64.tar.gz"
      sha256 "6536168ca9b1c99b8d0ff02c4fcff3bdabd24ad6d1e2ced578ce211669f1335b"
    else
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_linux-amd64.tar.gz"
      sha256 "a44a2bffdd09e5acd231f17d37c98760379ef3fe1940bc62fcf6125c16f02c19"
    end
  end

  def install
    # The tar.gz contains the binary with a platform suffix — rename to just talcli
    platform_binaries = Dir["talcli-*"]
    if platform_binaries.any?
      bin.install platform_binaries.first => "talcli"
    else
      bin.install "talcli"
    end
  end

  test do
    system "#{bin}/talcli", "version"
  end
end
