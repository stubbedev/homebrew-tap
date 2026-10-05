class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.76"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.76/harness_darwin_amd64"
      sha256 "d57e0e9e57edcb0ba42dfa14f05a5e2195a900c39bae3a56e270520f267a123d"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.76/harness_darwin_arm64"
      sha256 "7508062fdb4420b581bb09c3d02ce3d5bf0d9aef72ab19b80f12a997bbbb79cd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.76/harness_linux_amd64"
      sha256 "dbf8897df63983af556e46ab9df1a8efab376270f5789f594d32dc30a3db07ca"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.76/harness_linux_arm64"
      sha256 "df1715600009fe6ac0ebc0cfed1d7252e56265fae17d8b06db3ffcaa62fd5c72"
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
