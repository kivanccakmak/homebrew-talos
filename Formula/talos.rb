class Talos < Formula
  desc "Talos Works desktop app — MCP installer, label printing, ERP migration sidecar"
  homepage "https://talos.works"
  version "2.2.1"
  license "Proprietary"

  on_linux do
    on_arm do
      url "https://github.com/kivanccakmak/talos-binaries/releases/download/v#{version}/Talos-#{version}-linux-arm64.AppImage"
      sha256 "e047d60ea205be1b9b21eae894299428886e0aeb68e9e4f6324fc5b3221bb3bb"

      def install
        appimage = "Talos-#{version}-linux-arm64.AppImage"
        bin.install appimage => "talos"
        chmod "+x", bin/"talos"
      end
    end
    # x86_64 Linux build deferred this release — pinned to v2.2.0 until next build
    on_intel do
      url "https://github.com/kivanccakmak/talos-binaries/releases/download/v2.2.0/Talos-2.2.0-linux-x86_64.AppImage"
      sha256 "af71a9c788243b5733d21073bd7503d9ba591832ae8fa35338de3bc64d8dac29"

      def install
        appimage = "Talos-2.2.0-linux-x86_64.AppImage"
        bin.install appimage => "talos"
        chmod "+x", bin/"talos"
      end
    end
  end

  test do
    system "#{bin}/talos", "--version"
  end
end
