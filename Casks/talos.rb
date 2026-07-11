cask "talos" do
  version "2.2.6"
  sha256 "aae5673c45e177beb7c134a7b8fa189ebec907f35728b5804a2302088bb22400"

  url "https://github.com/kivanccakmak/talos-binaries/releases/download/v#{version}/Talos-#{version}-macos-arm64.dmg",
      verified: "github.com/kivanccakmak/talos-binaries/"
  name "Talos"
  desc "MCP installer, label printing, ERP migration sidecar, network discovery for manufacturing"
  homepage "https://talos.works"

  app "Talos.app"
end
