# Homebrew formula for tedge — Talos Edge appliance binary.
# Lives in the kivanccakmak/homebrew-talos tap (file MUST be Formula/tedge.rb so
# the class name `Tedge` resolves). Pin sha256 per release from dist/SHA256SUMS.
#   brew tap kivanccakmak/talos && brew install tedge
#
# Brew covers dev boxes + 64-bit hosts (macOS arm64, Linux arm64/amd64). The
# 32-bit Pi (armv7) install path is apt/curl|sh, not brew.
class Tedge < Formula
  desc "Talos Edge — one Raspberry-Pi binary: cst18d/ender/screwdriver/fr3/ocpp"
  homepage "https://talos.works"
  version "0.2.0"
  license :cannot_represent

  base = "https://github.com/kivanccakmak/talos-binaries/releases/download/v#{version}"

  on_macos do
    on_arm do
      url "#{base}/tedge-darwin-arm64"
      sha256 "9667f35424088ed4161ba089ac4f735ae373b74dd5ac9544db1021526ea832c6"

      def install
        bin.install "tedge-darwin-arm64" => "tedge"
      end
    end
  end

  on_linux do
    on_arm do
      url "#{base}/tedge-linux-arm64"
      sha256 "bcdba466222c226dd37e4aebf5bd51565e1e894675da0c1f2ccba69f2c6db918"

      def install
        bin.install "tedge-linux-arm64" => "tedge"
      end
    end
    on_intel do
      url "#{base}/tedge-linux-amd64"
      sha256 "cecab0b74db5d5aec87fa930c4b54351e8fd014e2f7569f08355fa8e665eb81e"

      def install
        bin.install "tedge-linux-amd64" => "tedge"
      end
    end
  end

  test do
    assert_match "tedge", shell_output("#{bin}/tedge --version")
  end
end
