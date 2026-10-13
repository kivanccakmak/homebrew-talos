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
  version "0.2.18"
  license :cannot_represent

  base = "https://github.com/kivanccakmak/talos-binaries/releases/download/v#{version}"

  on_macos do
    on_arm do
      url "#{base}/tedge-darwin-arm64"
      sha256 "b280636d8a8bf484dc8a1b437c0dd20c99d8f8364d615d33358e6e6fa7d98b6b"
    end
    on_intel do
      url "#{base}/tedge-darwin-amd64"
      sha256 "1468058e58d58fc9bfa3416b09e8d920604de31d01b678ed46c81bffc60b0bd9"
    end
  end

  on_linux do
    on_arm do
      url "#{base}/tedge-linux-arm64"
      sha256 "be4603753da238e1c3b83f0bf8e223104abf13391d5ef892eb4bcf159bf7c925"
    end
    on_intel do
      url "#{base}/tedge-linux-amd64"
      sha256 "7052ce5e857fd0031a85d99b93a110f4271ee3f322ed9d49d677c65814c29d85"
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
