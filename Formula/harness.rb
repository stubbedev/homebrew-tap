class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.83"
  license "FSL-1.1-MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/harness/releases/download/v0.0.83/harness_darwin_arm64"
      sha256 "f77c52127d0e5ae75e6ad6f734aafef5b28b557349a961c03a726bfffba3a934"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.83/harness_linux_amd64"
      sha256 "1a649463ece76e733f496b41772c0379dd0541079fec9dac184cc46afbb98cca"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.83/harness_linux_arm64"
      sha256 "8b8f10e5433ed505a2083b7228f9da63aeb1d8485a03ff149d1d74ad78372887"
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
