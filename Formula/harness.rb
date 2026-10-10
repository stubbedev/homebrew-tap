class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.79"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.79/harness_darwin_amd64"
      sha256 "cf200483dc686a27a5890ad1c321c1b48409cc5d7ff2c624deec7b752d372f16"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.79/harness_darwin_arm64"
      sha256 "08396e10d48752f18b9c043db3c8c40e9b6b91892d18a1244994020293c573a8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.79/harness_linux_amd64"
      sha256 "70b8fd965802e878c6e600d35ea4dbddb14dee371430574810d2613e8d61ad19"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.79/harness_linux_arm64"
      sha256 "d731eb6c69a9aa344aa6f494324c95e947e3db319a4f681e6bad0d6161e4f99f"
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
