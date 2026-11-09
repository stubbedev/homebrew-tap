class Maestro < Formula
  desc "Composer, natively: a drop-in replacement for the composer command"
  homepage "https://github.com/stubbedev/maestro"
  version "1.0.14"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/stubbedev/maestro/releases/download/v1.0.14/maestro_darwin_arm64"
    sha256 "33359e58d0b6118fbf94c8f8e2f920d170850c6dbb5726349f4f4cc3f86031e3"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.14/maestro_linux_amd64"
      sha256 "2ae856a2114230653b5e62b26557a46a51164591c981f3c9621d88757ffbde8f"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.14/maestro_linux_arm64"
      sha256 "963cef28d95b80cc5d9a284eebe4eef92dbd4d69ea7c4d9e5192bbc6efc56881"
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
