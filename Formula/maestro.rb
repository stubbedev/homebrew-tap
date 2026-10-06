class Maestro < Formula
  desc "Composer, natively: a drop-in replacement for the composer command"
  homepage "https://github.com/stubbedev/maestro"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.1/maestro_darwin_amd64"
      sha256 "d08807e64a34ea508f0fb045c1d3ee1636da79987de5c00a9f44fe5fd3a1826c"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.1/maestro_darwin_arm64"
      sha256 "9c808afc37e42e935728fe2f6215fc361b8292ca6e1e332b1ee6bb6d0343c78e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.1/maestro_linux_amd64"
      sha256 "4c436b5258ea53755d454149ad28ba9ef7202058693af69ffce74e54c0aca5dc"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.1/maestro_linux_arm64"
      sha256 "717e2c5bba5d6293a16ca5a8d5343ae9bfd1b474d35829f2c0e17e4a46dac015"
    end
  end

  depends_on "php"

  def install
    bin.install asset => "maestro"
    chmod 0555, bin/"maestro"
  end

  def caveats
    <<~EOS
      To use maestro as composer:
        ln -s "#{opt_bin}/maestro" "$(brew --prefix)/bin/composer"
    EOS
  end

  def test
    assert_match "maestro version #{version}", shell_output("#{bin}/maestro --version 2>&1")
  end

  def asset
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.intel? ? "amd64" : "arm64"
    "maestro_#{os}_#{arch}"
  end
end
