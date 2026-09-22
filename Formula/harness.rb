class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.43"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.43/harness_darwin_amd64"
      sha256 "4d9c306b3cd5db2c9a6514d147cc2ea2f36c572b27a0840bcfca9a60541762ca"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.43/harness_darwin_arm64"
      sha256 "186a45654ff1819502eedaffba26d4770c39d7e132ce57c1081be2361837a5bf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.43/harness_linux_amd64"
      sha256 "0ae3db05dd4fe55ae12d42eb71a91c10fac323e77bde476bd7e667b054423cbf"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.43/harness_linux_arm64"
      sha256 "ffe47fc24c8b1959cca33b2c020734865df0b789f9f71bed2ce55222b4e3b1f0"
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
