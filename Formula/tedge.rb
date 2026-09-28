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
  version "0.2.12"
  license :cannot_represent

  base = "https://github.com/kivanccakmak/talos-binaries/releases/download/v#{version}"

  on_macos do
    on_arm do
      url "#{base}/tedge-darwin-arm64"
      sha256 "a94f4e0726a5bf37dcc338dc5ebdcecfbf4f4c3a99f56a7ee1a7bb748624afaf"
    end
    on_intel do
      url "#{base}/tedge-darwin-amd64"
      sha256 "78b5ae31eadfc3be0323f3e282a24207f427112c73efd64712d5960497f64cda"
    end
  end

  on_linux do
    on_arm do
      url "#{base}/tedge-linux-arm64"
      sha256 "f5a73786e1bf9f5df055776671d4abb93ec35e88e186e9b6db24069a63a8a430"
    end
    on_intel do
      url "#{base}/tedge-linux-amd64"
      sha256 "fbd9f7d78fbb0bb2db1cccb467a0db856436a709afd7f50b3e3a43a51167d146"
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
