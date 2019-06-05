defmodule PhoenixAlexa.CanFulfillIntent do
  alias PhoenixAlexa.CanFulfillIntent

  defstruct type: "CanFulfillIntent",
    can_fulfill: "",
    slots: %{}

  def set_can_fulfill(card, can_fulfill) do
    %CanFulfillIntent{card | can_fulfill: can_fulfill }
  end
  def set_content(card, slots) do
    %CanFulfillIntent{card | slots: slots}
  end
end
