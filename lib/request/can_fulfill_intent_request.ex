defmodule PhoenixAlexa.CanFulfillIntentRequest do
  alias PhoenixAlexIntent

  defstruct type: "CanFulfillIntentRequest",
    requestId: "",
    timestamp: "",
    intent: %Intent{}
end
