class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.42"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.42/harness_darwin_amd64"
      sha256 "80255abe5657aa546d1d6d9e13621685d48a2934ce99309dd959733cfcbf9f6f"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.42/harness_darwin_arm64"
      sha256 "08036196f5c9958ef863a53960adee5c34d7da3119d72be14e0980ad20c74a35"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.42/harness_linux_amd64"
      sha256 "3a9e952038064a69ef375db29b3884a5b954b10136e13cc347f81531c108efd8"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.42/harness_linux_arm64"
      sha256 "d39676101c9eae77d39db13e573ce383197442bf8543ff0398c799fa13fac86b"
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
