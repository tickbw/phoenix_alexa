defmodule Alexa.Request do
  
  alias Alexa.{Session, GenericRequest, Request}

  defstruct version: "",
            session: %Session{},
            request: %GenericRequest{}

  # def validate(request) do
    
  # end
end