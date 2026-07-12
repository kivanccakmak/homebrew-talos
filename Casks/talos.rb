cask "talos" do
  version "2.2.7"
  sha256 "172839d472fe5523cd13cad96164c773576e1d2b7f8659ff1d97fc7c0cdf68b5"

  url "https://github.com/kivanccakmak/talos-binaries/releases/download/v#{version}/Talos-#{version}-macos-arm64.dmg",
      verified: "github.com/kivanccakmak/talos-binaries/"
  name "Talos"
  desc "MCP installer, label printing, ERP migration sidecar, network discovery for manufacturing"
  homepage "https://talos.works"

  app "Talos.app"
end
