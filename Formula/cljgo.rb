# typed: false
# frozen_string_literal: true

# Homebrew formula for cljgo — Clojure hosted on Go.
# Installs the prebuilt release binary (tree-walk REPL + `cljgo run`).
# Note: `cljgo build` (AOT to a native binary) also needs the cljgo source
# tree today for its generated go.mod replace directive — see the README.
class Cljgo < Formula
  desc "Clojure hosted on Go — tree-walk REPL, AOT-emits Go, universal Go interop"
  homepage "https://github.com/muthuishere/cljgo"
  version "0.2.0"
  license "EPL-1.0"

  on_macos do
    on_arm do
      url "https://github.com/muthuishere/cljgo/releases/download/v#{version}/cljgo_#{version}_darwin_arm64.tar.gz"
      sha256 "f843fd526e68e7a5f77b06b267ec4dd9b60f1dda6cbdd463d88dd4f0ea38966f"
    end
    on_intel do
      url "https://github.com/muthuishere/cljgo/releases/download/v#{version}/cljgo_#{version}_darwin_amd64.tar.gz"
      sha256 "1da60c6b927fb0ab8fb57d01c5d5c70f9126161c47d8aa78b5e051bd4295e8ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/muthuishere/cljgo/releases/download/v#{version}/cljgo_#{version}_linux_arm64.tar.gz"
      sha256 "d1530fc353d91e2c73fed0607b642fb68d2d4d5336e8aa58194f4f1daec78ece"
    end
    on_intel do
      url "https://github.com/muthuishere/cljgo/releases/download/v#{version}/cljgo_#{version}_linux_amd64.tar.gz"
      sha256 "7e7a31a4941e8e472f562619ee39f7b6d3f64c7b1f5aaede7c26709862d15ea3"
    end
  end

  def install
    bin.install "cljgo"
  end

  test do
    assert_match "cljgo", shell_output("#{bin}/cljgo version")
  end
end
