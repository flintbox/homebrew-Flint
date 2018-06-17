class Flint < Formula
    desc "Generate projects and files from template."
    homepage "https://github.com/flintbox/Flint"
    url "https://github.com/flintbox/Flint/archive/0.1.4.tar.gz"
    sha256 "9430393fbd04b85cbb02701c9c90c73472a2859879959d16792ec1ee06b7426d"

    def install
        # fixes an issue an issue in homebrew when both Xcode 9.3+ and command line tools are installed
        # see more details here https://github.com/Homebrew/brew/pull/4147
        # remove this once homebrew is patched
        ENV["CC"] = Utils.popen_read("xcrun -find clang").chomp
        system "make", "release"
        bin.install ".build/release/flint"
    end
end
