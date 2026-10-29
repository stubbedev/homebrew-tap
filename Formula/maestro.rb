class Maestro < Formula
  desc "Composer, natively: a drop-in replacement for the composer command"
  homepage "https://github.com/stubbedev/maestro"
  version "1.0.12"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/stubbedev/maestro/releases/download/v1.0.12/maestro_darwin_arm64"
    sha256 "e75dba4c286cfe5debb47cb5988e93be97f6ad83e4d4a77f0f3308041d888535"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.12/maestro_linux_amd64"
      sha256 "b73f5447faa8bec674bda342e2944da2d76c566d0810b86445962fb1a9a220b4"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.12/maestro_linux_arm64"
      sha256 "09df5c7736408e69a6eda9942c67461ed733d2aae00310adb2800c7c2b7c415b"
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
