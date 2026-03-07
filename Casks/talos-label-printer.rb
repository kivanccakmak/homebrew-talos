cask "talos-label-printer" do
  version "1.1.8"
  sha256 "5c150cb493f7179cc8ca4c86db6b895975910d17b50989203e7963c77f496b0c"

  url "https://github.com/kivanccakmak/talos-desktop-tools/releases/download/v#{version}/talos-label-printer-#{version}-arm64.dmg"
  name "Talos Label Printer"
  desc "Label printer desktop app for Talos Works"
  homepage "https://talos.works"

  app "Talos Label Printer.app"
end
