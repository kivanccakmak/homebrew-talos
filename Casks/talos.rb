cask "talos" do
  version "2.0.0"
  sha256 "93b10b511c8036961fd9d4bc6c905965cf8f8ef02ef3205758b58b1e5f60afe2"

  url "https://github.com/kivanccakmak/talos-desktop-tools/releases/download/v#{version}/talos-#{version}-arm64.dmg"
  name "Talos"
  desc "MCP installer, label printing, and network discovery for manufacturing"
  homepage "https://talos.works"

  app "Talos.app"
end
