class Srv < Formula
  desc "Traefik + TLS + DNS edge layer for static, proxy, and container sites"
  homepage "https://github.com/stubbedev/srv"
  version "0.4.31"
  license "MIT"

  depends_on "mkcert"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/srv/releases/download/v#{version}/srv-#{version}-darwin-arm64.tar.gz"
      sha256 "60b6ce61adfe4bc3e555baa54a575a77a3513e2a2315a08484f2be2686e6fbde"
    end
    on_intel do
      url "https://github.com/stubbedev/srv/releases/download/v#{version}/srv-#{version}-darwin-amd64.tar.gz"
      sha256 "0b33eb2d60ec8e82cb7081aa8c30f0300b33b4241ba2ab7189916ff6e0890d53"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stubbedev/srv/releases/download/v#{version}/srv-#{version}-linux-arm64.tar.gz"
      sha256 "4ec886955ffcffd02aafc2e4c1b230613107197a09c1485eea2ae5f4a337139a"
    end
    on_intel do
      url "https://github.com/stubbedev/srv/releases/download/v#{version}/srv-#{version}-linux-amd64.tar.gz"
      sha256 "772283b01ccae363e577456d13f57637431f67328ea12286154ff8039edf00fe"
    end
  end

  def install
    bin.install "srv"
  end

  service do
    run [opt_bin/"srv", "daemon", "start", "--foreground"]
    keep_alive successful_exit: false
    process_type :background
    log_path var/"log/srv.log"
    error_log_path var/"log/srv.log"
  end

  def caveats
    <<~CAVEATS
      srv needs Docker installed and running.

      To start the watch daemon in the background:
        brew services start srv

      Or, without homebrew-services:
        srv daemon install

      Don't enable both — they register competing launchd / systemd
      units that race over the same Docker watcher.

      First-time setup (Traefik, dnsmasq, mkcert CA, Docker network):
        srv install
    CAVEATS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/srv version")
  end
end
