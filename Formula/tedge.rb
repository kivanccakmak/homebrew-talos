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
  version "0.2.15"
  license :cannot_represent

  base = "https://github.com/kivanccakmak/talos-binaries/releases/download/v#{version}"

  on_macos do
    on_arm do
      url "#{base}/tedge-darwin-arm64"
      sha256 "c1c800433e759c347a512eb87ebf72fb1b2ebd0aa7b3245fa2d493a937747e79"
    end
    on_intel do
      url "#{base}/tedge-darwin-amd64"
      sha256 "f975cfb822d7d15fba83af261eeac31f460c3ab5e2916c628289698d068e5c1b"
    end
  end

  on_linux do
    on_arm do
      url "#{base}/tedge-linux-arm64"
      sha256 "e8001cdb7024ba7ee6bab903aa517321fb60df6e17202751b967b0257687e98d"
    end
    on_intel do
      url "#{base}/tedge-linux-amd64"
      sha256 "643f8d9b9d92c3be8ec33b66c4a0a15f70b180956077a3f433a131dfb4774363"
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
