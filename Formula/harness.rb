class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.22"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.22/harness_darwin_amd64"
      sha256 "6275bf4567633d369b3711a8acd05e9343734ecabff216df5468a46edf1bd115"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.22/harness_darwin_arm64"
      sha256 "838b8e73e481a17962214a306aec1e42d06c14fd90cd3f78204e15caf8f1d1c6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.22/harness_linux_amd64"
      sha256 "7a603fdc8aa7e93c2773db442903a76296f89528184159abe2f2d173f798daa8"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.22/harness_linux_arm64"
      sha256 "2ab548ecd2e8cbad844c8d534833aef540e43b42a3b85324659cb40801abab74"
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
