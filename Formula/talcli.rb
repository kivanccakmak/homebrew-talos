class Talcli < Formula
  desc "CLI tool for the Talos manufacturing operations platform"
  homepage "https://talos.works"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_darwin-arm64.tar.gz"
      sha256 "2632fa24e4a734589d7459f3c41110d9b3e5bee58ee98fcd56b0dbcc29573676"
    else
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_darwin-amd64.tar.gz"
      sha256 "67cfc760db86eaf131a2d81c43d35a498354842979e47cf665a943aef70d1faf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_linux-arm64.tar.gz"
      sha256 "7a25b74180d43ccd66a6f1a5cbc683d5c3fea26e1c61b4868dda9c953044eafa"
    else
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_linux-amd64.tar.gz"
      sha256 "a62217f1b6fca1efb5c39e6f5b96f2172ccf428ebd368d1f231dd2277abb6bc8"
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
