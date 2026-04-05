class Docpler < Formula
  desc "Convert HWP (Korean word processor) documents to Markdown"
  homepage "https://github.com/docpler/docpler-cli"
  version "1.0.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docpler/docpler-cli/releases/download/cli-v1.0.0/docpler-aarch64-apple-darwin"
      sha256 "1be840ae63ae330a1aa9403c14ba9b480e550e395279724038d0eca4148efbea"
    else
      url "https://github.com/docpler/docpler-cli/releases/download/cli-v1.0.0/docpler-x86_64-apple-darwin"
      sha256 "5cebefb75a6e14854f41dde32dc322001871882a6fd8fc5aa05744f9bc50005c"
    end
  end

  on_linux do
    url "https://github.com/docpler/docpler-cli/releases/download/cli-v1.0.0/docpler-x86_64-unknown-linux-gnu"
    sha256 "9da0ca8fe8b9bb7f81547c90326631ee168b3ad6de06e4ceb5e69c8397bb935e"
  end

  def install
    bin.install Dir.glob("docpler*").first => "docpler"
  end

  test do
    assert_match "docpler", shell_output("#{bin}/docpler --version")
  end
end
