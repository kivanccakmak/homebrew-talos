class TalosLabelPrinter < Formula
  desc "Label printer desktop app for Talos Works"
  homepage "https://talos.works"
  version "1.1.7"
  license "Proprietary"

  on_linux do
    url "https://github.com/kivanccakmak/talos-desktop-tools/releases/download/v#{version}/talos-label-printer-#{version}-arm64.AppImage"
    sha256 "7f45f1f57f517a677c73170ea5e637bc8040cada770700954cebdf0f18a8fdee"
  end

  def install
    appimage = "talos-label-printer-#{version}-arm64.AppImage"
    bin.install appimage => "talos-label-printer"
    chmod "+x", bin/"talos-label-printer"
  end
end
