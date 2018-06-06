class Flint < Formula
    desc "Generate projects and files from template."
    homepage "https://github.com/flintbox/Flint"
    url "https://github.com/flintbox/Flint/archive/0.1.0.tar.gz"
    sha256 "858bfb9f18a67e3051f24d740b41341421a654c5ec15e40d23c4d7f178b93d85"

    def install
        # fixes an issue an issue in homebrew when both Xcode 9.3+ and command line tools are installed
        # see more details here https://github.com/Homebrew/brew/pull/4147
        # remove this once homebrew is patched
        ENV["CC"] = Utils.popen_read("xcrun -find clang").chomp
        system "make", "release"
        bin.install ".build/release/flint"
    end
end
