cask "talos" do
  version "2.2.3"
  sha256 "b5c516cf85c0ba6961a9eb89c4a0f1345abe27d356267e6078daebb7d16af91c"

  url "https://github.com/kivanccakmak/talos-binaries/releases/download/v#{version}/Talos-#{version}-macos-arm64.dmg",
      verified: "github.com/kivanccakmak/talos-binaries/"
  name "Talos"
  desc "MCP installer, label printing, ERP migration sidecar, network discovery for manufacturing"
  homepage "https://talos.works"

  app "Talos.app"
end
