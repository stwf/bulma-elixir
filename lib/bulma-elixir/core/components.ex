defmodule Bulma.Core.Components do
  use Phoenix.Component

  import Bulma.Core.Elements

  alias Phoenix.LiveView.JS
  slot :tabs, required: false

  def tabs(assigns) do
    ~H"""
    <div class="tabs is-centered">
      <ul>
        {render_slot(@tabs)}
      </ul>
    </div>
    """
  end

  attr :icon, :string, required: false
  slot :inner_block, required: false

  def tab(assigns) do
    ~H"""
    <li class="is-active">
      <a>
        <span class="icon is-small"><i class="fas fa-image" aria-hidden="true"></i></span>
        <span>Pictures</span>
      </a>
    </li>
    """
  end
end
