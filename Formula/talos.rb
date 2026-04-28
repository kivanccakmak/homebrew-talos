class Talos < Formula
  desc "Talos Works desktop app — MCP installer, label printing, network discovery"
  homepage "https://talos.works"
  version "2.0.0"
  license "Proprietary"

  on_linux do
    url "https://github.com/kivanccakmak/talos-binaries/releases/download/v2.1.0/talos-#{version}-x86_64.AppImage"
    sha256 "d985c5260ae00e29f60dd7909e83d986fc7b3d2d28a2b43b150170cc6332ef93"

    def install
      appimage = "talos-#{version}-x86_64.AppImage"
      bin.install appimage => "talos"
      chmod "+x", bin/"talos"
    end
  end

  test do
    system "#{bin}/talos", "--version"
  end
end
