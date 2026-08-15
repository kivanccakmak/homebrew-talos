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
  version "0.2.5"
  license :cannot_represent

  base = "https://github.com/kivanccakmak/talos-binaries/releases/download/v#{version}"

  on_macos do
    on_arm do
      url "#{base}/tedge-darwin-arm64"
      sha256 "0cdd2c925592a142993108e208fd22a61df2074a066a0dd58fc360a4cd686556"
    end
  end

  on_linux do
    on_arm do
      url "#{base}/tedge-linux-arm64"
      sha256 "3ab5dd51134a3b888cc1d264530c588dceae763778efe0fecf1a359f932c3177"
    end
    on_intel do
      url "#{base}/tedge-linux-amd64"
      sha256 "18e906b0650c22eec04d2dde585c0ece43c764a3fef5412209d41c65484d83a8"
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
