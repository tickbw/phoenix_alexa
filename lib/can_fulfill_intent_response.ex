defmodule PhoenixAlexa.CanFulfillIntentResponse do
  alias PhoenixAlexa.{CanFulfillIntentResponse}
  alias PhoenixAlexa.{CanFulfillIntent}

  defstruct version: "1.0",
    response: %{}

  def set_can_fulfill_intent(response, %CanFulfillIntent{} = canfulfill) do
    %CanFulfillIntentResponse{response | response: (response.response |> Map.put(:canFulfillIntent, canfulfill))}
  end

end
