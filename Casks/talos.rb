cask "talos" do
  version "2.2.2"
  sha256 "34a4b79928542cf7c0020d8fb45ebc5e4e63bccd5ab77c97b23745c701110c2e"

  url "https://github.com/kivanccakmak/talos-binaries/releases/download/v#{version}/Talos-#{version}-macos-arm64.dmg",
      verified: "github.com/kivanccakmak/talos-binaries/"
  name "Talos"
  desc "MCP installer, label printing, ERP migration sidecar, network discovery for manufacturing"
  homepage "https://talos.works"

  app "Talos.app"
end
