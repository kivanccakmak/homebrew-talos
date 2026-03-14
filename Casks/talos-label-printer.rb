cask "talos-label-printer" do
  version "1.1.8"
  sha256 "0d031100e8519dbec7a864b41a04224c4f8a399888b1d17564a748ca07214c4e"

  url "https://github.com/kivanccakmak/talos-desktop-tools/releases/download/v1.1.9/talos-label-printer-#{version}-arm64.dmg"
  name "Talos Label Printer"
  desc "Label printer desktop app for Talos Works"
  homepage "https://talos.works"

  app "Talos Label Printer.app"
end
