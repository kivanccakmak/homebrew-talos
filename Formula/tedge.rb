# Homebrew formula for tedge — Talos Edge appliance binary.
# Lives in the kivanccakmak/homebrew-talos tap (file MUST be Formula/tedge.rb so
# the class name `Tedge` resolves). Pin sha256 per release from dist/SHA256SUMS.
#   brew tap kivanccakmak/talos && brew install tedge
#
# Brew covers dev boxes + 64-bit hosts (macOS arm64, Linux arm64/amd64). The
# 32-bit Pi (armv7) install path is apt/curl|sh, not brew.
class Tedge < Formula
  desc "Talos Edge appliance: industrial I/O and optional camera runtime"
  homepage "https://talos.works"
  version "0.2.4"
  license :cannot_represent

  base = "https://github.com/kivanccakmak/talos-binaries/releases/download/v#{version}"

  on_macos do
    on_arm do
      url "#{base}/tedge-darwin-arm64"
      sha256 "638a89754a1e5afa766815eecd2fbb4b57c848adc98cb6f2dd326566f9fee98f"
    end
  end

  on_linux do
    on_arm do
      url "#{base}/tedge-linux-arm64"
      sha256 "6fd2de1aaa274e588b8d3c85aefd19c816ba94549db9fd38a4a0de27e9cc1f67"
    end
    on_intel do
      url "#{base}/tedge-linux-amd64"
      sha256 "234d573e380c5e9d1fa5b3bdafcff0166c1ad32d71545d3968f9770b5e906273"
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
