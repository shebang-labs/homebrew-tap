class TerraformStateSplit < Formula
  desc "This ruby CLI tool helps you organise large terraform state files into smaller ones by moving chosen resources from a provided state file into another destination state file."
  homepage "https://github.com/shebang-labs/terraform-state-split"
  url "https://github.com/shebang-labs/terraform-state-split/releases/download/1.0.0/terraform-state-split.tar.gz"
  license "MIT"
  sha256 "58bf2fed14f2b8879f8e07f9a76658d14898b79ddd902bcfc133c36dfe1e97a9"

  uses_from_macos "ruby"

  def install
    ENV["GEM_HOME"] = lib
    system "gem", "install", "tty-prompt"
    inreplace "terraform-state-split", "require 'tty-prompt'", <<-EOS
#!/usr/bin/env ruby
ENV["GEM_HOME"]="#{lib}"
Gem.clear_paths
require 'tty-prompt'
    EOS
    bin.install "terraform-state-split"
  end

  test do
    system "#{bin}/terraform-state-split"
  end
end