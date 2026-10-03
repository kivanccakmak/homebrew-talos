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
  version "0.2.14"
  license :cannot_represent

  base = "https://github.com/kivanccakmak/talos-binaries/releases/download/v#{version}"

  on_macos do
    on_arm do
      url "#{base}/tedge-darwin-arm64"
      sha256 "93407c5dced95c55253f57440285cce760072721b030acec4ff3b7461037fa3c"
    end
    on_intel do
      url "#{base}/tedge-darwin-amd64"
      sha256 "243493928bb35af50a36ecec2bd9876445fe0924c8c36271f028c7db96db9be2"
    end
  end

  on_linux do
    on_arm do
      url "#{base}/tedge-linux-arm64"
      sha256 "1ab2a1ccda070a70ba244f0a2ab180ca4314cdf0f0815957212b30666b96fc31"
    end
    on_intel do
      url "#{base}/tedge-linux-amd64"
      sha256 "e23e58c205287fc0d7992486e61df4b6be0efb43e8da5569abb0c494bb174e5f"
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
