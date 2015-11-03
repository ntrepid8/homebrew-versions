class Elixir10 < Formula
  desc "Functional/dynamic language built on Erlang VM"
  homepage "http://elixir-lang.org/"
  url "https://github.com/elixir-lang/elixir/archive/v1.0.5.tar.gz"
  sha256 "5ce5c226b3d11d751b41ad79b915b86f13f8a1b89ef3e733321d3f46ff4d81b8"

  depends_on "erlang"

  keg_only "Conflicts with elixir in main repository"

  def install
    system "make"
    bin.install Dir["bin/*"] - Dir["bin/*.{bat,ps1}"]

    Dir.glob("lib/*/ebin") do |path|
      app = File.basename(File.dirname(path))
      (lib/app).install path
    end
  end

  test do
    system "#{bin}/elixir", "-v"
  end
end
