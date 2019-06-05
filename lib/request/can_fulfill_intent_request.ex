defmodule PhoenixAlexa.CanFulfillIntentRequest do
  alias PhoenixAlexa.CanFulfillIntent

  defstruct type: "CanFulfillIntentRequest",
    requestId: "",
    timestamp: "",
    intent: %Intent{}
end
