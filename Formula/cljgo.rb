# typed: false
# frozen_string_literal: true

# Homebrew formula for cljgo — Clojure hosted on Go.
#
# Installs the prebuilt release binary. That alone gives you the REPL,
# `cljgo run`, `cljgo test` and the rest of the interpreted path — verified to
# work with no Go toolchain present at all.
#
# `cljgo build` (AOT to a native binary) shells out to the Go toolchain, so it
# needs Go — hence `depends_on "go"`. It does NOT need a cljgo source checkout:
# a release binary pins the published runtime module and fetches it from the Go
# module proxy (ADR 0028/0116). An earlier version of this comment said a source
# tree was required; that has not been true since v0.8.5.
class Cljgo < Formula
  desc "Clojure hosted on Go — tree-walk REPL, AOT-emits Go, universal Go interop"
  homepage "https://github.com/muthuishere/cljgo"
  version "0.9.0"
  license "EPL-1.0"

  depends_on "go"

  on_macos do
    on_arm do
      url "https://github.com/muthuishere/cljgo/releases/download/v#{version}/cljgo_#{version}_darwin_arm64.tar.gz"
      sha256 "ba6bd2d1daaf50651d3a86ae9ca51677ad46906f15385602174fe21f65a7939c"
    end
    on_intel do
      url "https://github.com/muthuishere/cljgo/releases/download/v#{version}/cljgo_#{version}_darwin_amd64.tar.gz"
      sha256 "e16dafa7d7defafe19cdd6aac5daffaac1b7eac7f609ce8077a8642bc5cb9d06"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/muthuishere/cljgo/releases/download/v#{version}/cljgo_#{version}_linux_arm64.tar.gz"
      sha256 "cc6f1088baea35a02201e55cb250fd07c64610e1a8e1faaee8230f17388558d7"
    end
    on_intel do
      url "https://github.com/muthuishere/cljgo/releases/download/v#{version}/cljgo_#{version}_linux_amd64.tar.gz"
      sha256 "e7298e4987f36ab81724515ee92033a1fbe5e0ac1916e7dc70481a2aeb7cb3cf"
    end
  end

  def install
    bin.install "cljgo"
  end

  test do
    # Version, then the interpreted path end-to-end — a formula test that only
    # runs `--version` cannot tell a working binary from one that dies on boot.
    assert_match version.to_s, shell_output("#{bin}/cljgo version")
    (testpath/"hello.clj").write('(println (+ 1 2))')
    assert_equal "3\n", shell_output("#{bin}/cljgo run #{testpath}/hello.clj")
  end
end
