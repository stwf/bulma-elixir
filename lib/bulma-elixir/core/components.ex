defmodule Bulma.Core.Components do
  use Phoenix.Component

  alias Phoenix.LiveView.JS

  attr :id, :string, required: true
  attr :show, :boolean, default: false
  attr :on_cancel, JS, default: %JS{}
  slot :inner_block, required: true

  def modal(assigns) do
    ~H"""
    <div class="modal is-active">
      <div class="modal-background"></div>
      <div class="modal-content has-background-white">
        <div id={"#{@id}-content"}>
          {render_slot(@inner_block)}
        </div>
      </div>
    </div>
    """
  end

  attr(:class, :string, default: nil)
  attr(:rest, :global)
  slot :inner_block, required: false

  def tabs(assigns) do
    ~H"""
    <div class={["tabs", @class]} {@rest}>
      <ul>
        {render_slot(@inner_block)}
      </ul>
    </div>
    """
  end

  attr :icon, :string, required: false
  slot :inner_block, required: false
  attr(:selected, :boolean, default: false)
  attr(:tab_id, :integer, default: nil)
  attr(:class, :string, default: nil)

  def tab(assigns) do
    ~H"""
    <li class={[@class, @selected && "is-active"]}>
      <a phx-click="select_tab" phx-value-tab_id={@tab_id}>
        {render_slot(@inner_block)}
      </a>
    </li>
    """
  end

  attr(:class, :string, default: nil)
  slot(:nav_brand, required: false)
  slot(:nav_start, required: false)
  slot(:nav_end, required: false)
  slot(:nav_dropdown, required: false)
  attr(:rest, :global)
  slot :inner_block, required: false

  def navbar(assigns) do
    ~H"""
    <nav class={["navbar", @class]} role="navigation" aria-label="main navigation">
      <div class="navbar-brand">
        <div class="navbar-item">
          {render_slot(@nav_brand)}
        </div>
        <a
          role="button"
          class="navbar-burger"
          aria-label="menu"
          aria-expanded="false"
          phx-click={JS.toggle_class("is-active", to: "#navbarBasicExample")}
        >
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
        </a>
      </div>
      <div id="navbar-dropdown-id" class="navbar-dropdown">
        {render_slot(@nav_dropdown)}
      </div>
      <div id="navbarBasicExample" class="navbar-menu">
        <div :if={@nav_start != []} class="navbar-start">
          <div :for={nav_start <- @nav_start} class="navbar-item">
            {render_slot(nav_start)}
          </div>
        </div>
        <div :if={@nav_end != []} class="navbar-end">
          <div :for={nav_end <- @nav_end} class="navbar-item">
            {render_slot(nav_end)}
          </div>
        </div>
      </div>
    </nav>
    """
  end

  attr(:title, :string, default: nil)
  attr(:class, :string, default: nil)
  slot :inner_block, required: false

  def navbar_item(%{href: _} = assigns) do
    ~H"""
    <a class={["navbar-item", @class]} href={@href}>
      {@title || render_slot(@inner_block)}
    </a>
    """
  end

  def navbar_item(assigns) do
    ~H"""
    <div class={["navbar-item", @class]}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr(:title, :string, default: nil)
  attr(:class, :string, default: nil)
  attr(:content_class, :string, default: nil)
  attr(:rest, :global)

  attr :header_image, :string, default: nil
  slot :image, required: false
  slot :inner_block, required: false
  slot :footer, required: false

  def card(assigns) do
    ~H"""
    <div class={["card", @class]} {@rest}>
      <header :if={@title || @header_image} class="card-header">
        <p :if={@title} class="card-header-title">
          {@title}
        </p>
        <button :if={@header_image} class="card-header-icon" aria-label="more options">
          {@header_image}
        </button>
      </header>

      <div :if={@image != []} class="card-image">
        {render_slot(@image)}
      </div>
      <div class={["card-content", @content_class]}>
        {render_slot(@inner_block)}
      </div>
      <footer :if={@footer != []} class="card-footer">
        <span :for={footer <- @footer} class="card-footer-item">
          {render_slot(footer)}
        </span>
      </footer>
    </div>
    """
  end
end
