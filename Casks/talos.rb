cask "talos" do
  version "2.2.9"
  sha256 "a59fd06060f279d17926c4ac788825f1b1c9b59b261e80d7f434a11c173ab2e0"

  url "https://github.com/kivanccakmak/talos-binaries/releases/download/v#{version}/Talos-#{version}-macos-arm64.dmg",
      verified: "github.com/kivanccakmak/talos-binaries/"
  name "Talos"
  desc "MCP installer, label printing, ERP migration sidecar, network discovery for manufacturing"
  homepage "https://talos.works"

  app "Talos.app"
end
