defmodule Alexa.LinkAccountCard do
  alias Alexa.LinkAccountCard

  defstruct type: "LinkAccount",
            title: nil,
            content: nil

  def set_title(card, title) do
    %LinkAccountCard{card | title: title}
  end
  def set_content(card, content) do
    %LinkAccountCard{card | content: content} 
  end
end