cask "talos" do
  version "2.2.4"
  sha256 "6843568b9bfa7a399c5499328d00738012f572a6c378f4693b1d9d0f77d07b31"

  url "https://github.com/kivanccakmak/talos-binaries/releases/download/v#{version}/Talos-#{version}-macos-arm64.dmg",
      verified: "github.com/kivanccakmak/talos-binaries/"
  name "Talos"
  desc "MCP installer, label printing, ERP migration sidecar, network discovery for manufacturing"
  homepage "https://talos.works"

  app "Talos.app"
end
