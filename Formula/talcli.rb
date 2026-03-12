class Talcli < Formula
  desc "CLI tool for the Talos manufacturing operations platform"
  homepage "https://talos.works"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_darwin-arm64.tar.gz"
      sha256 "ba7bf6084508a8cc555f433037883dc20bde5a8dda60ad28e34478f086793024"
    else
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_darwin-amd64.tar.gz"
      sha256 "f066465c43159052feed44de6cd732afde7d51530a7a795d6b2257ccaef0618d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_linux-arm64.tar.gz"
      sha256 "edbd6825aceb124629fd10ebac8435e60ccdd41c8303928df2cb0764a0eba4f1"
    else
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_linux-amd64.tar.gz"
      sha256 "df43172e95d5edb3bb8ecb44b094f10216fd3341dc4b7a1423cfd29651c7c6cd"
    end
  end

  def install
    bin.install "talcli"
  end

  test do
    system "#{bin}/talcli", "version"
  end
end
