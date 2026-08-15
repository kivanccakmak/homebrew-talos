# Homebrew formula for tedge — Talos Edge appliance binary.
# Lives in the kivanccakmak/homebrew-talos tap (file MUST be Formula/tedge.rb so
# the class name `Tedge` resolves). Pin sha256 per release from dist/SHA256SUMS.
#   brew tap kivanccakmak/talos && brew install tedge
#
# Brew covers dev boxes + 64-bit hosts (macOS arm64, Linux arm64/amd64). The
# 32-bit Pi (armv7) install path is apt/curl|sh, not brew.
class Tedge < Formula
  desc "Talos Edge appliance: industrial I/O and Tapo C260 counting/PTZ"
  homepage "https://talos.works"
  version "0.2.2"
  license :cannot_represent

  base = "https://github.com/kivanccakmak/talos-binaries/releases/download/v#{version}"

  on_macos do
    on_arm do
      url "#{base}/tedge-darwin-arm64"
      sha256 "48120bc5b14a6dbdf844449c5a4351ef6fd156cfff536ce48462905d0457083d"
    end
  end

  on_linux do
    on_arm do
      url "#{base}/tedge-linux-arm64"
      sha256 "ef10d462390f0b83fc55fdf8161f9e83ad0d27e8a2de88f367c756b854eee76a"
    end
    on_intel do
      url "#{base}/tedge-linux-amd64"
      sha256 "5f1cadbe54e3e49e1ecc3261041a747311d740be475a6f53d3618b5143e47b76"
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
