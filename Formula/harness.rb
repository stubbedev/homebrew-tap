class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.27"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.27/harness_darwin_amd64"
      sha256 "3eb7873f0c91bcb320967e3862da4c7e61ca520ae20b506a354099a59fcc02d2"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.27/harness_darwin_arm64"
      sha256 "d1bc784ecdce2d7c2b709be164b2e889f88afef3410d5f2e084d289e8987bbd7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.27/harness_linux_amd64"
      sha256 "146d1081c4c11136fca1e74c5423b6fa3c53c53e8299bdd94d29ef25afade7f8"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.27/harness_linux_arm64"
      sha256 "a766ad5176c619b25c50f05c924b775f09f5d3bd92272909d06b6db0bf8c61eb"
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
