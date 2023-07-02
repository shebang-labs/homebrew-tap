class TerraformStateSplit < Formula
  desc "This ruby CLI tool helps you organise large terraform state files into smaller ones by moving chosen resources from a provided state file into another destination state file."
  homepage "https://github.com/shebang-labs/terraform-state-split"
  url "https://github.com/shebang-labs/terraform-state-split/releases/download/1.0.0/terraform-state-split.tar.gz"
  sha256 "010905a4d444dd4ffb4dc8ded7e239d52d678cd0d33873d468622cdbc3d71c69"
  license "MIT"

  uses_from_macos "ruby"

  def install
    system "gem", "install", "tty-prompt", "--install-dir #{lib}"
    bin.install "terraform-state-split"
  end

  test do
    system "#{bin}/terraform-state-split"
  end
end
