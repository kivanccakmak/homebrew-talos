class Talcli < Formula
  desc "CLI tool for the Talos manufacturing operations platform"
  homepage "https://talos.works"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_darwin-arm64.tar.gz"
      sha256 "4808a27e1899837c37cdcc02df8eb4bd17dc056d402edac43b4a6d5366ca0e51"
    else
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_darwin-amd64.tar.gz"
      sha256 "419af37a2d97c81baa4f9fd5bcfea8c539ed86d7ef109aeed8c0f9064e61ed5c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_linux-arm64.tar.gz"
      sha256 "4ebc8b77f834b9c4226175526f0e08eb84d1cb256d1498397ce35cfe8a8898fd"
    else
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_linux-amd64.tar.gz"
      sha256 "9230d6c18c705707240ac2837369d02d66015919df78625151b235c950a8ce43"
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
