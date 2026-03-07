class TalosLabelPrinter < Formula
  desc "Label printer desktop app for Talos Works"
  homepage "https://talos.works"
  version "1.1.8"
  license "Proprietary"

  on_linux do
    url "https://github.com/kivanccakmak/talos-desktop-tools/releases/download/v#{version}/talos-label-printer-#{version}-arm64.AppImage"
    sha256 "2bfcb43a0b1f180686fddb149331905d501420275fc5835b56c68ee360521d2f"
  end

  def install
    appimage = "talos-label-printer-#{version}-arm64.AppImage"
    bin.install appimage => "talos-label-printer"
    chmod "+x", bin/"talos-label-printer"
  end
end
