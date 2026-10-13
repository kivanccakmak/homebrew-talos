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
  version "0.2.20"
  license :cannot_represent

  base = "https://github.com/kivanccakmak/talos-binaries/releases/download/v#{version}"

  on_macos do
    on_arm do
      url "#{base}/tedge-darwin-arm64"
      sha256 "212a48cdcfe0434abfe51a6ecdcecb703a0e4d06649bdb19f585a0ed6aca1e9b"
    end
    on_intel do
      url "#{base}/tedge-darwin-amd64"
      sha256 "06d68d36f0561424e1ba3110d1c3acf1478f52d45aa90aff935ca46a4af1815d"
    end
  end

  on_linux do
    on_arm do
      url "#{base}/tedge-linux-arm64"
      sha256 "ad680528ca391024540b0adac878c717630a3256c63f6a303042fbdc28d53b60"
    end
    on_intel do
      url "#{base}/tedge-linux-amd64"
      sha256 "4764d4f86f30a144e25080c313058f26e59ce79b42c47c032534f15f3b8c5d3c"
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
