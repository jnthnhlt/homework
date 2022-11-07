defmodule HomeworkTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start hound session and destroy when tests are run
  hound_session()

  setup context do
    _test_env = context[:test_env]

    :ok
  end

  @tag test_env: "dev"
  @tag test_env: "test"
  describe "when a user navigates to landing page" do
    setup [:navigate]
    test "", context do
      assert Hound.Helpers.Navigation.current_url() == Test.Helper.url(context[:test_env])
      Hound.Helpers.Screenshot.take_screenshot()
    end
  end

  @tag test_env: "dev"
  @tag test_env: "test"
  describe "when a user clicks on the Create New Account button" do
    setup [:navigate]
    test "", context do
      Hound.Helpers.Element.click(Hound.Helpers.Page.find_element(:id, "signup-button"))
      assert Hound.Helpers.Page.page_title() == "Join Facebook"
      Hound.Helpers.Screenshot.take_screenshot()
    end
  end


  defp navigate(context) do
    Test.Helper.url(context[:test_env])|> navigate_to()

    :ok
  end
end
