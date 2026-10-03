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
      sha256 "4f81e6c06f66311a2433bb1cb8f76739057f70e7f16311e138ac30d8a928312b"
    end
    on_intel do
      url "#{base}/tedge-darwin-amd64"
      sha256 "b1e8d8e56c2b1a978efd31d164d598c56e23dc5eff80ce86ee95c42fab7ceb25"
    end
  end

  on_linux do
    on_arm do
      url "#{base}/tedge-linux-arm64"
      sha256 "4922c772847fb667d8eb0d4ced3ffc09c92c6ef63712356f76c5d41866b45a4c"
    end
    on_intel do
      url "#{base}/tedge-linux-amd64"
      sha256 "3218ca24f633e5bb979e247ec75ed3885cc3abfe1f966763392c0df505a01e2d"
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
