defmodule PhoenixAlexa.CanFulfillIntentRequest do
  alias PhoenixAlexa.Intent

  defstruct type: "CanFulfillIntentRequest",
    requestId: "",
    timestamp: "",
    intent: %Intent{}
end
