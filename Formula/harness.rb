class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.53"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.53/harness_darwin_amd64"
      sha256 "625a7e24c37c65ddfd46f1a7ea57e31e71806109f748588c5d9a73082419e48e"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.53/harness_darwin_arm64"
      sha256 "e6e3093cae56b91345df4ee0f2cc0a9deee88a42285853edd390c61f375f5544"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.53/harness_linux_amd64"
      sha256 "7a6abd9d9292fc3ad7bbce980c3f5e2c5a71b5f91ac6a940dbc95508c975392e"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.53/harness_linux_arm64"
      sha256 "0b78380deca04fe71891b2fd04f410f3419882ddd3e2f18c98fc3ab6e9266e93"
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
