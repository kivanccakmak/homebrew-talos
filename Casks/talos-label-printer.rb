cask "talos-label-printer" do
  version "1.1.7"
  sha256 "c73ebc79e913bc2e68967341ef81193e4c27f64475179de75331f47d84046a21"

  url "https://github.com/kivanccakmak/talos-desktop-tools/releases/download/v#{version}/talos-label-printer-#{version}-arm64.dmg"
  name "Talos Label Printer"
  desc "Label printer desktop app for Talos Works"
  homepage "https://talos.works"

  app "Talos Label Printer.app"
end
