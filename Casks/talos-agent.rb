cask "talos-agent" do
  version "1.1.7"
  sha256 "9dce6649acfe5d888241c01c127b17925b58693a1d7bb75586908ff59a35b6d2"

  url "https://github.com/kivanccakmak/talos-desktop-tools/releases/download/v#{version}/talos-agent-#{version}.dmg"
  name "Talos Agent"
  desc "ERP agent desktop app for Talos Works"
  homepage "https://talos.works"

  app "TalosAgent.app"
end
