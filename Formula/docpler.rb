class Docpler < Formula
  desc "Convert HWP (Korean word processor) documents to Markdown"
  homepage "https://github.com/docpler/docpler-cli"
  version "1.0.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docpler/docpler-cli/releases/download/cli-v0.1.0/docpler-aarch64-apple-darwin"
      sha256 "6f571d7347e1db848864676d0fe84cd181d4dd9cea6506d564e366329aac7d11"
    else
      url "https://github.com/docpler/docpler-cli/releases/download/cli-v0.1.0/docpler-x86_64-apple-darwin"
      sha256 "c320aa5362a555653771a69869a7739c8813a7178ca9569974b94a8081858ae5"
    end
  end

  on_linux do
    url "https://github.com/docpler/docpler-cli/releases/download/cli-v0.1.0/docpler-x86_64-unknown-linux-gnu"
    sha256 "92eb5af90a7d60f3eeeaeab1fd399f8c51467110856bea1b1c75d8c18de2a9ca"
  end

  def install
    bin.install Dir.glob("docpler*").first => "docpler"
  end

  test do
    assert_match "docpler", shell_output("#{bin}/docpler --version")
  end
end
