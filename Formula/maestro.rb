class Maestro < Formula
  desc "Composer, natively: a drop-in replacement for the composer command"
  homepage "https://github.com/stubbedev/maestro"
  version "1.0.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.5/maestro_darwin_amd64"
      sha256 "9fc88eb2e06f92904ef5196d61457851b7333d6c1effc4d3ac7c6cb5a71583e5"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.5/maestro_darwin_arm64"
      sha256 "8c80af8c7489f8d591ec8fb09ff163b45a029e540bd60c17818798aeb7231206"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.5/maestro_linux_amd64"
      sha256 "9a37a2cae2ccdc00ec72a43e2d225639fd9ba987342100418adf3f0cc1300db5"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.5/maestro_linux_arm64"
      sha256 "e0f1a624b547189d11d6244187f39ee87fb0cd071ebc14e7641644a979754383"
    end
  end

  # maestro runs PHP code (platform detection, plugins, scripts) with the
  # php first on PATH, whichever installed it, so Homebrew's php is only
  # an option: forcing it builds php's whole tree where no bottle fits
  # (an Intel brew on Apple Silicon) for users who already have a php.
  depends_on "php" => :optional

  def install
    bin.install asset => "maestro"
    chmod 0555, bin/"maestro"
  end

  def caveats
    <<~EOS
      maestro runs PHP code with the php first on your PATH. If you have
      none, install one (`brew install php`, or reinstall maestro with
      `--with-php`).

      To use maestro as composer:
        ln -s "#{opt_bin}/maestro" "$(brew --prefix)/bin/composer"
    EOS
  end

  def test
    assert_match "Maestro version #{version}", shell_output("#{bin}/maestro --version 2>&1")
  end

  def asset
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.intel? ? "amd64" : "arm64"
    "maestro_#{os}_#{arch}"
  end
end
