cask "talos" do
  version "2.2.5"
  sha256 "445498903004b4d58722c9e34d64c4ae9138439e7aba70971e0ff41d8d91a3f0"

  url "https://github.com/kivanccakmak/talos-binaries/releases/download/v#{version}/Talos-#{version}-macos-arm64.dmg",
      verified: "github.com/kivanccakmak/talos-binaries/"
  name "Talos"
  desc "MCP installer, label printing, ERP migration sidecar, network discovery for manufacturing"
  homepage "https://talos.works"

  app "Talos.app"
end
