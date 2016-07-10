defmodule Alexa.GenericRequest do
  alias Alexa.Intent

  defstruct type: nil,
            requestId: nil,
            timestamp: nil,
            reason: nil,
            intent: %Intent{}
end