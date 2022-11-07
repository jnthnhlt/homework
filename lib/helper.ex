defmodule Test.Helper do
  # ...

  def url(env) when env == "dev",
    do: "https://www.google.com/"
  def url(env) when env == "test",
    do: "http://www.facebook.com/"
  def url(env) when env == "prod",
    do: "https://www.meta.com/"
end
