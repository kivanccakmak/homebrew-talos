class TalosLabelPrinter < Formula
  desc "Label printer desktop app for Talos Works"
  homepage "https://talos.works"
  version "1.1.8"
  license "Proprietary"

  on_linux do
    url "https://github.com/kivanccakmak/talos-desktop-tools/releases/download/v1.1.9/talos-label-printer-1.1.8-arm64.AppImage"
    sha256 "baa1d9ec4a71a02768d5d240b218c3155d0a8fb79cbb9ff3134b3fe98cf16a22"
  end

  def install
    appimage = "talos-label-printer-1.1.8-arm64.AppImage"
    bin.install appimage => "talos-label-printer"
    chmod "+x", bin/"talos-label-printer"
  end
end
