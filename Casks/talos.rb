cask "talos" do
  version "2.2.8"
  sha256 "84da349d1be8666af065f33029649976165126e531750a3cd969cb56558b46ec"

  url "https://github.com/kivanccakmak/talos-binaries/releases/download/v#{version}/Talos-#{version}-macos-arm64.dmg",
      verified: "github.com/kivanccakmak/talos-binaries/"
  name "Talos"
  desc "MCP installer, label printing, ERP migration sidecar, network discovery for manufacturing"
  homepage "https://talos.works"

  app "Talos.app"
end
