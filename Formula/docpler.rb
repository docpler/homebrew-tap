class Docpler < Formula
  desc "Convert HWP (Korean word processor) documents to Markdown"
  homepage "https://github.com/docpler/docpler-cli"
  version "1.0.1"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docpler/docpler-cli/releases/download/cli-v1.0.1/docpler-aarch64-apple-darwin"
      sha256 "afc7bed194a7a1ba8aef6680944a046ec883aaaac6ccc7a852f632b702819de1"
    else
      url "https://github.com/docpler/docpler-cli/releases/download/cli-v1.0.1/docpler-x86_64-apple-darwin"
      sha256 "edba24a00ca9f6f2b5cae7356f5e9fb5dcfced788fb13b69d715dcbb7f40fed1"
    end
  end

  on_linux do
    url "https://github.com/docpler/docpler-cli/releases/download/cli-v1.0.1/docpler-x86_64-unknown-linux-gnu"
    sha256 "a2c7df1327167b9c262c59390768d93937ee1d47847ae24e39953943bcc0a7f4"
  end

  def install
    bin.install Dir.glob("docpler*").first => "docpler"
  end

  test do
    assert_match "docpler", shell_output("#{bin}/docpler --version")
  end
end
