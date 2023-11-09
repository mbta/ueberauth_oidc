defmodule UeberauthOIDC.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ueberauth_oidc,
      name: "Ueberauth OIDC",
      version: "0.2.0",
      elixir: "~> 1.13",
      description: """
      An Ueberauth strategy for generic OpenID Connect authentication.
      """,
      package: package(),
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      test_coverage: [
        ignore_modules: [FakeOpenIDConnect]
      ]
    ]
  end

  defp elixirc_paths(:test), do: ["test/support" | elixirc_paths(:dev)]
  defp elixirc_paths(_), do: ["lib"]

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      maintainers: ["Rick Littel - @Kuret"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/DefactoSoftware/ueberauth_oidc"}
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.5", only: [:dev, :test]},
      {:ex_doc, "~> 0.24", only: [:dev, :test]},
      {:jose, "~> 1.11"},
      {:openid_connect,
       github: "firezone/openid_connect", ref: "13320ed8b0d347330d07e1375a9661f3089b9c03"},
      {:plug, "~> 1.11"},
      {:ueberauth, "~> 0.10.5"}
    ]
  end
end
