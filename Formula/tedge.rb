# Homebrew formula for tedge — Talos Edge appliance binary.
# Lives in the kivanccakmak/homebrew-talos tap (file MUST be Formula/tedge.rb so
# the class name `Tedge` resolves). Pin sha256 per release from dist/SHA256SUMS.
#   brew tap kivanccakmak/talos && brew install tedge
#
# Brew covers dev boxes + 64-bit hosts (macOS arm64, Linux arm64/amd64). The
# 32-bit Pi (armv7) install path is apt/curl|sh, not brew.
class Tedge < Formula
  desc "Talos Edge appliance for industrial I/O, Observer and Octopus"
  homepage "https://talos.works"
  version "0.2.16"
  license :cannot_represent

  base = "https://github.com/kivanccakmak/talos-binaries/releases/download/v#{version}"

  on_macos do
    on_arm do
      url "#{base}/tedge-darwin-arm64"
      sha256 "dab13a28aa1b57a4fcda7e5c224b610d22b259a8526fabc6e49d6dbd3872cfdc"
    end
    on_intel do
      url "#{base}/tedge-darwin-amd64"
      sha256 "d7aaf230f03286537d0d19a40fb3b905730aa0fc5afcd6be71a5c710c0d45dcc"
    end
  end

  on_linux do
    on_arm do
      url "#{base}/tedge-linux-arm64"
      sha256 "90b70349303d3d5a3ca682fa2a360e0df6139dfccc89223fcf16f964254b248a"
    end
    on_intel do
      url "#{base}/tedge-linux-amd64"
      sha256 "f20e8d97e79e2fe9de6d390facc51021c201e05e45379a7d2e720c5d84430f84"
    end
  end

  def install
    binary = if OS.mac?
      Hardware::CPU.arm? ? "tedge-darwin-arm64" : "tedge-darwin-amd64"
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
