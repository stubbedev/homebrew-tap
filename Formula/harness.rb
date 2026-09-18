class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.28"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.28/harness_darwin_amd64"
      sha256 "048c9bf017358a18486ca1c5e71898c5baeb4dd7c89b70fe18b2e1b61d0110f3"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.28/harness_darwin_arm64"
      sha256 "08df0b8dc2884c9a688e98c2c6c410f7d369b31982383db1b3553d8deb77b5c3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.28/harness_linux_amd64"
      sha256 "8d82f5314ab9a86b724a55c24db8bcf6ce19de6151af852c4a7bb8696a6b6407"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.28/harness_linux_arm64"
      sha256 "33cb931ee094787e4b5fa09a38d7951f3d5aa2db46ed5f5cba35b8a7ee608a69"
    end
  end

  def install
    bin.install asset => "harness"
    chmod 0555, bin/"harness"
  end

  def test
    assert_match version.to_s, shell_output("#{bin}/harness --version")
  end

  def asset
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.intel? ? "amd64" : "arm64"
    "harness_#{os}_#{arch}"
  end
end
