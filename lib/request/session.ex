defmodule Alexa.Session do
  
  alias Alexa.{Application, User}

  defstruct new: false,
            sessionId: "",
            application: %Application{},
            attributes: nil,
            user: %User{}
end