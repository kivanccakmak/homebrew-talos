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
  version "0.2.10"
  license :cannot_represent

  base = "https://github.com/kivanccakmak/talos-binaries/releases/download/v#{version}"

  on_macos do
    on_arm do
      url "#{base}/tedge-darwin-arm64"
      sha256 "a2f06af07467b7dd8507dfd61a66a902e2a0d4759d17a1470b5538ef3892ce39"
    end
    on_intel do
      url "#{base}/tedge-darwin-amd64"
      sha256 "20c7b476d62db3a371e7b38e42b9c511761d6e78f792d81c56a99b2e47981085"
    end
  end

  on_linux do
    on_arm do
      url "#{base}/tedge-linux-arm64"
      sha256 "d36d3aa0883bc10d4d3ed8ae0f8ee4182e50a1a479e3e701b9904d764674e32e"
    end
    on_intel do
      url "#{base}/tedge-linux-amd64"
      sha256 "df3fb37f38565d381727e80f7dfb1bc9c702b514afa2a638b9956ba720db8e76"
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
