class TalosAgent < Formula
  desc "ERP agent desktop app for Talos Works"
  homepage "https://talos.works"
  version "1.1.8"
  license "Proprietary"

  on_linux do
    url "https://github.com/kivanccakmak/talos-desktop-tools/releases/download/v#{version}/talos-agent-#{version}-arm64"
    sha256 "7957be02ffe9ec23486effcf1f40f4d80c8388b09e68639012c278cf761c4cad"
  end

  def install
    bin.install "talos-agent-#{version}-arm64" => "talos-agent"
    chmod "+x", bin/"talos-agent"
  end
end
