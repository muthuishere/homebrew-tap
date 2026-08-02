# typed: false
# frozen_string_literal: true

# Homebrew formula for cljgo — Clojure hosted on Go.
# Installs the prebuilt release binary (tree-walk REPL + `cljgo run`).
# Note: `cljgo build` (AOT to a native binary) also needs the cljgo source
# tree today for its generated go.mod replace directive — see the README.
class Cljgo < Formula
  desc "Clojure hosted on Go — tree-walk REPL, AOT-emits Go, universal Go interop"
  homepage "https://github.com/muthuishere/cljgo"
  version "0.8.9"
  license "EPL-1.0"

  on_macos do
    on_arm do
      url "https://github.com/muthuishere/cljgo/releases/download/v#{version}/cljgo_#{version}_darwin_arm64.tar.gz"
      sha256 "060bc8a20f70603f012267ccb49d0419a0b640f5cfaaafd08c183998395ac8e6"
    end
    on_intel do
      url "https://github.com/muthuishere/cljgo/releases/download/v#{version}/cljgo_#{version}_darwin_amd64.tar.gz"
      sha256 "6ccab9442722170dc9ad7fffeec424cfdd63521fcb55466a784b07d405a7daf0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/muthuishere/cljgo/releases/download/v#{version}/cljgo_#{version}_linux_arm64.tar.gz"
      sha256 "279b7f19594998a8f52fb71471e83e85417957e75b7d00d0e624082de22500ed"
    end
    on_intel do
      url "https://github.com/muthuishere/cljgo/releases/download/v#{version}/cljgo_#{version}_linux_amd64.tar.gz"
      sha256 "b4bbf9938a379606ff1b395f1911d074d3a95d3af28608902a6ef042e4a27066"
    end
  end

  def install
    bin.install "cljgo"
  end

  test do
    assert_match "cljgo", shell_output("#{bin}/cljgo version")
  end
end
