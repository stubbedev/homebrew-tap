class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.48"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.48/harness_darwin_amd64"
      sha256 "ed212fdd4b1f84d01c5b88563b2b0a62d4e9f22e66e42830d1cae87dd8e9f9bd"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.48/harness_darwin_arm64"
      sha256 "450b4d7742d4d71aeae0c49a18c56fd0d940c36243f3f858281464c27827d842"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.48/harness_linux_amd64"
      sha256 "43212841442871446cc3c0aeead30359753b8c67cb6a63ce8fc304f286c7b54b"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.48/harness_linux_arm64"
      sha256 "3019acac845c649067e9bbd157161095b49bc83be8c03f803cd34389f7e7bd52"
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
