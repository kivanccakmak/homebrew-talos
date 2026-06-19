# Homebrew formula for tedge — Talos Edge appliance binary.
# Lives in the kivanccakmak/homebrew-talos tap (file MUST be Formula/tedge.rb so
# the class name `Tedge` resolves). Pin sha256 per release from dist/SHA256SUMS.
#   brew tap kivanccakmak/talos && brew install tedge
#
# Brew covers dev boxes + 64-bit hosts (macOS arm64, Linux arm64/amd64). The
# 32-bit Pi (armv7) install path is apt/curl|sh, not brew.
class Tedge < Formula
  desc "Talos Edge — one Raspberry-Pi binary: cst18d/ender/screwdriver/ocpp"
  homepage "https://talos.works"
  version "0.1.0"
  license :cannot_represent

  base = "https://github.com/kivanccakmak/talos-binaries/releases/download/v#{version}"

  on_macos do
    on_arm do
      url "#{base}/tedge-darwin-arm64"
      sha256 "956fa6a45cc92c7b2948df41c7e27b65350779230fbf70ce02e6562d2f1b8ce2"

      def install
        bin.install "tedge-darwin-arm64" => "tedge"
      end
    end
  end

  on_linux do
    on_arm do
      url "#{base}/tedge-linux-arm64"
      sha256 "4f7c4b7f6e89fc3f626ba7e91a7c9e35a488225af9dd4acaecd1cde45991640d"

      def install
        bin.install "tedge-linux-arm64" => "tedge"
      end
    end
    on_intel do
      url "#{base}/tedge-linux-amd64"
      sha256 "222ec16f68cbc9c37173589d91b9650bef220354cda1e543843535e3b171e1b6"

      def install
        bin.install "tedge-linux-amd64" => "tedge"
      end
    end
  end

  test do
    assert_match "tedge", shell_output("#{bin}/tedge --version")
  end
end
