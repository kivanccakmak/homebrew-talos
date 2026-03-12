class Talcli < Formula
  desc "CLI tool for the Talos manufacturing operations platform"
  homepage "https://talos.works"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_darwin-arm64.tar.gz"
      sha256 "b10df5017a2c75b8e020a5b46287e7c75da8667d197929e6aface371c337b565"
    else
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_darwin-amd64.tar.gz"
      sha256 "597d6544c5563691dccc39bcf62b2a5febe07b6da6036e9ebc52c60ab015182e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_linux-arm64.tar.gz"
      sha256 "8c7e2edbe530cdd58b848802caa5fbd1793508e8cf61622b05c85b6175e40921"
    else
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_linux-amd64.tar.gz"
      sha256 "0d65392f91b9c7b4992d8bdd78aa00fa1a2f503e03516fbf369e61f9b630b5f0"
    end
  end

  def install
    bin.install "talcli"
  end

  test do
    system "#{bin}/talcli", "version"
  end
end
