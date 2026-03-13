class Talcli < Formula
  desc "CLI tool for the Talos manufacturing operations platform"
  homepage "https://talos.works"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_darwin-arm64.tar.gz"
      sha256 "5727a863bf02411c2928106328be382172456726c8a7ea8f4df1eb0cefdfbb1f"
    else
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_darwin-amd64.tar.gz"
      sha256 "6e6a8bcc4e7e3f717d34ddf83d98a190a9dd32d7b7087e6bfa4dcd854689d016"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_linux-arm64.tar.gz"
      sha256 "5df572f4d7d76de80f4d70b4c1234183359ccaafa74248766e3ec3a756e1d82a"
    else
      url "https://github.com/kivanccakmak/talcli/releases/download/v#{version}/talcli_#{version}_linux-amd64.tar.gz"
      sha256 "ed1f558c1d67abaad4065c6c12aec5f86fafb2b04a9975e24f07873d6ac199cb"
    end
  end

  def install
    # The tar.gz contains the binary with a platform suffix — rename to just talcli
    platform_binaries = Dir["talcli-*"]
    if platform_binaries.any?
      bin.install platform_binaries.first => "talcli"
    else
      bin.install "talcli"
    end
  end

  test do
    system "#{bin}/talcli", "version"
  end
end
