class Flint < Formula
    desc "Generate projects and files from template."
    homepage "https://github.com/flintbox/Flint"
    url "https://github.com/flintbox/Flint/archive/0.1.6.tar.gz"
    sha256 "7796e597f145b00efe527ed07c71ca2738e6388f117915e25c2ccfc4b00010e6"

    def install
        # fixes an issue an issue in homebrew when both Xcode 9.3+ and command line tools are installed
        # see more details here https://github.com/Homebrew/brew/pull/4147
        # remove this once homebrew is patched
        ENV["CC"] = Utils.popen_read("xcrun -find clang").chomp
        system "make", "release"
        bin.install ".build/release/flint"
    end
end
