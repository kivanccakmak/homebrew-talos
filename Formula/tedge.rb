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
  version "0.2.11"
  license :cannot_represent

  base = "https://github.com/kivanccakmak/talos-binaries/releases/download/v#{version}"

  on_macos do
    on_arm do
      url "#{base}/tedge-darwin-arm64"
      sha256 "aa96d3518c46609f87627a8dc9d2b598445b3dc4cfb4df34863525d4d4bdff3c"
    end
    on_intel do
      url "#{base}/tedge-darwin-amd64"
      sha256 "4a110e08eb20cb8d43a126edb251e3961889c64d8a161737b4177c5097508d89"
    end
  end

  on_linux do
    on_arm do
      url "#{base}/tedge-linux-arm64"
      sha256 "75298bc16924f1117f5086f4fa1b378d8b851570b480ded54d54768710e1ec7d"
    end
    on_intel do
      url "#{base}/tedge-linux-amd64"
      sha256 "d88af220199511c52328df1b2ae274420de33380753a128d35d2d59ce1dafd6d"
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
