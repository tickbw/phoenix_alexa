defmodule Alexa.IntentRequest do
  alias Alexa.Intent
  
  defstruct type: "IntentRequest",
            requestId: "",
            timestamp: "",
            intent: %Intent{}
end