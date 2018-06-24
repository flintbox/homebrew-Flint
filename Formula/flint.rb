class Flint < Formula
    desc "Generate projects and files from template."
    homepage "https://github.com/flintbox/Flint"
    url "https://github.com/flintbox/Flint/archive/0.1.7.tar.gz"
    sha256 "3e1de95ff896daef6e52fe06ec26366197d6f11dd207d0e26bc1d6959162c660"

    def install
        # fixes an issue an issue in homebrew when both Xcode 9.3+ and command line tools are installed
        # see more details here https://github.com/Homebrew/brew/pull/4147
        # remove this once homebrew is patched
        ENV["CC"] = Utils.popen_read("xcrun -find clang").chomp
        system "make", "release"
        bin.install ".build/release/flint"
    end
end
