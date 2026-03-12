class Talcli < Formula
  desc "CLI tool for the Talos manufacturing operations platform"
  homepage "https://talos.works"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_darwin-arm64.tar.gz"
      sha256 "2a4aa0a52fe1e742d497c6dbe98d38a4b4992851e81f2c3d649729894172de45"
    else
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_darwin-amd64.tar.gz"
      sha256 "fbde31e570893d12c43851d5f605a2c767ea557a7f4c9f878c40e4b7edb0e36c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_linux-arm64.tar.gz"
      sha256 "b1618f79950af0c1bf9b4af10323ee2e20b23dcac68f8f89f7a14e4a5ee06c1c"
    else
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_linux-amd64.tar.gz"
      sha256 "ec5138745eafc4117528b108c049d1a9ea9681252f2bd528c476b67d6ce0edfe"
    end
  end

  def install
    bin.install "talcli"
  end

  test do
    system "#{bin}/talcli", "version"
  end
end
