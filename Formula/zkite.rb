# typed: false
# frozen_string_literal: true

class Zkite < Formula
  desc "CLI for the Zerodha Kite Connect trading API"
  homepage "https://github.com/muthuishere/zerodha-kite-agent"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/muthuishere/zerodha-kite-agent/releases/download/v#{version}/zkite-darwin-arm64.tar.gz"
      sha256 "6be4fdce7e608680b21aea8c9b88f9ab433940ff12186575f09007d2253e9463"
    end
    on_intel do
      url "https://github.com/muthuishere/zerodha-kite-agent/releases/download/v#{version}/zkite-darwin-amd64.tar.gz"
      sha256 "21801eea624a1732fa58a45381648c92b0ce313a7c9eb66a89fc364a3f684060"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/muthuishere/zerodha-kite-agent/releases/download/v#{version}/zkite-linux-arm64.tar.gz"
      sha256 "06553a534680f8e3944c513613341b722a69ac847e8052450eb93059409d12fb"
    end
    on_intel do
      url "https://github.com/muthuishere/zerodha-kite-agent/releases/download/v#{version}/zkite-linux-amd64.tar.gz"
      sha256 "9eef79047ce9bde611e2ef4b8c11e8d34b8d1b4f7b7a24270ed3ab8e0abce072"
    end
  end

  def install
    bin.install "zkite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zkite version")
  end
end
