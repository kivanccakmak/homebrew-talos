# Homebrew formula for tedge — Talos Edge appliance binary.
# Lives in the kivanccakmak/homebrew-talos tap (file MUST be Formula/tedge.rb so
# the class name `Tedge` resolves). Pin sha256 per release from dist/SHA256SUMS.
#   brew tap kivanccakmak/talos && brew install tedge
#
# Brew covers dev boxes + 64-bit hosts (macOS arm64, Linux arm64/amd64). The
# 32-bit Pi (armv7) install path is apt/curl|sh, not brew.
class Tedge < Formula
  desc "Talos Edge appliance: industrial I/O and Tapo C250/C260 counting/PTZ"
  homepage "https://talos.works"
  version "0.2.7"
  license :cannot_represent

  base = "https://github.com/kivanccakmak/talos-binaries/releases/download/v#{version}"

  on_macos do
    on_arm do
      url "#{base}/tedge-darwin-arm64"
      sha256 "00b2e15fc4d451325caefe9791652fc6111a7a82b9fcd32123e3d65504f05145"
    end
  end

  on_linux do
    on_arm do
      url "#{base}/tedge-linux-arm64"
      sha256 "cf92f07f0f2cc6fa5a7fec1d454c6ab3afe50b67bab15e17295bbd8cd611bee8"
    end
    on_intel do
      url "#{base}/tedge-linux-amd64"
      sha256 "31c65be2a5439045b49afaad64a759fb72121d9d49f14903f313d4a2be917859"
    end
  end

  def install
    binary = if OS.mac?
      "tedge-darwin-arm64"
    elsif Hardware::CPU.arm?
      "tedge-linux-arm64"
    else
      "tedge-linux-amd64"
    end
    bin.install binary => "tedge"
  end

  test do
    assert_match "tedge", shell_output("#{bin}/tedge --version")
  end
end
