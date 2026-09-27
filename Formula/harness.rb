class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.65"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.65/harness_darwin_amd64"
      sha256 "c7c11f781345f18e038656cc9ae9582c29589d7ae52ca018d4c891152634bb38"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.65/harness_darwin_arm64"
      sha256 "8cfa48b98438c7ac832a953ec57da25922f7aa99fb82b2947aef8bfb7dbec6bb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.65/harness_linux_amd64"
      sha256 "99fea3d85661c2471f82a1a4be62bc6fe7b683c756f5de68410767d2283700e4"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.65/harness_linux_arm64"
      sha256 "65516c339f9eda1b3ff81d355e28c247e6653cdce6ae9e2f5aa7092f6f2da570"
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
