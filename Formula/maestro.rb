class Maestro < Formula
  desc "Composer, natively: a drop-in replacement for the composer command"
  homepage "https://github.com/stubbedev/maestro"
  version "1.0.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.8/maestro_darwin_amd64"
      sha256 "4e04a896b5f2e3613d67ddf7e238e94327ef89be38ee2fa484f1cb91d9fc3fd4"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.8/maestro_darwin_arm64"
      sha256 "04d77a0e882047514bcc72619567ae82a534c4b4a7e83dfeed3f9975c15eb904"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.8/maestro_linux_amd64"
      sha256 "49c5517e7cc17728f4db3047ff5ae1b58f1bf8c59c1fe3988ab545914b3a4602"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.8/maestro_linux_arm64"
      sha256 "7e70b8ec830e7c168143c432a62b5588f7eb34abaad76811cbae4b1c8758c197"
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
