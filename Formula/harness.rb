class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.51"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.51/harness_darwin_amd64"
      sha256 "375317068f898ca276bc502b261e075af1e8f4e8bf7eee212eee5ae313af87ed"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.51/harness_darwin_arm64"
      sha256 "2a9d9d1e5c696969cb24513df9c61d4e5a0502f519a0f92d7265bd8e11daf8a9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.51/harness_linux_amd64"
      sha256 "ca65d71033fa60e5fae9cc3e9d849861d4f1d1c631cbfb484f37d04e331f5432"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.51/harness_linux_arm64"
      sha256 "6245cad1701bd0c61d87b8a8a262d4c24464eadf3f2cd5c18473d970b2cedfa1"
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
