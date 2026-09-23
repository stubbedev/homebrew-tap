class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.47"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.47/harness_darwin_amd64"
      sha256 "716c81f7a789c6e67cea46ecac8eb8cada807bce22521901b27cdc34fe6a0365"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.47/harness_darwin_arm64"
      sha256 "8d130a9a0c21fbf54e7ea25edad118373441d4294767a9e449de097cc945aa28"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.47/harness_linux_amd64"
      sha256 "00890b93d593c196b60ce8ab910ae8e321dfcfb9fdedffa48e2a48497873ca90"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.47/harness_linux_arm64"
      sha256 "96bdf30f8d0f835447ad43ff6c693b9cbcc5c21291fe0b268a82944c7baee016"
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
