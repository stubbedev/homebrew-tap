class Treeman < Formula
  desc "Per-worktree development environment helper (DBs, hooks, test clones)"
  homepage "https://github.com/stubbedev/treeman"
  version "2.5.96"
  license "Apache-2.0 OR MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/treeman/releases/download/v#{version}/treeman-#{version}-darwin-arm64.tar.gz"
      sha256 "7765b48144354121e5f00797fb088306c769b516d01fdf3e329f9412971e0ef8"
    end
    on_intel do
      url "https://github.com/stubbedev/treeman/releases/download/v#{version}/treeman-#{version}-darwin-amd64.tar.gz"
      sha256 "517ca2d1587d20b85b9acf9ceef306d5f2bf1a2089f9b92ea01a2450fdc7891f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stubbedev/treeman/releases/download/v#{version}/treeman-#{version}-linux-arm64.tar.gz"
      sha256 "9616ff74976f0a731fe8b54cfc1f0d74deabc53d6e9afc34ea63b1e017c58305"
    end
    on_intel do
      url "https://github.com/stubbedev/treeman/releases/download/v#{version}/treeman-#{version}-linux-amd64.tar.gz"
      sha256 "2064e711aa0099f12f8d954c655afa427b589dab5e570a0caa668cac94029053"
    end
  end

  def install
    bin.install "treeman", "treemand"
  end

  # Lets users run `brew services start treeman` to keep
  # treemand running across reboots without invoking
  # `treeman daemon install` manually. The two installers
  # are mutually exclusive — both bind the same SOCK_STREAM
  # at $XDG_RUNTIME_DIR/treeman.sock — so the caveats
  # below ask users to pick one.
  service do
    run [opt_bin/"treemand"]
    # KeepAlive only on unexpected exits — `brew services
    # stop` and `treeman daemon stop` (clean exit 0) leave
    # the daemon down. Mirrors the dict the
    # `treeman daemon install` LaunchAgent writes so
    # behaviour matches across install paths.
    keep_alive successful_exit: false
    process_type :background
    log_path var/"log/treemand.log"
    error_log_path var/"log/treemand.log"
  end

  def caveats
    <<~CAVEATS
      To start treemand in the background:
        brew services start treeman

      Or, without homebrew-services:
        treeman daemon install

      Don't enable both — they bind the same socket.
    CAVEATS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/treeman --version")
  end
end
