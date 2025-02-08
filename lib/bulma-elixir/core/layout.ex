defmodule Bulma.Core.Layout do
  use Phoenix.Component

  attr(:class, :string, default: nil)
  attr(:rest, :global)
  slot(:inner_block, required: false)

  def container(assigns) do
    ~H"""
    <div class={["container", @class]} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr(:class, :string, default: nil)
  attr(:title, :string, default: nil)
  attr(:subtitle, :string, default: nil)
  attr(:centered, :boolean, default: false)
  attr(:rest, :global)
  slot(:inner_block, required: false)
  slot(:header, required: false)
  slot(:footer, required: false)

  def hero(assigns) do
    ~H"""
    <section class={["hero", @class]} {@rest}>
      <div :if={@header != []} class="hero-head">
        {render_slot(@header)}
      </div>
      <div class="hero-body">
        <div class={[@centered && "container has-text-centered"]}>
          <p :if={@title} class="title">{@title}</p>
          <p :if={@subtitle} class="subtitle">{@subtitle}</p>
        </div>
      </div>
      <div :if={@footer != []} class="hero-foot">
        {render_slot(@footer)}
      </div>
    </section>
    """
  end

  attr(:class, :string, default: nil)
  attr(:title, :string, default: nil)
  attr(:rest, :global)
  slot(:inner_block, required: false)
  slot(:subtitle, required: false)

  def section(assigns) do
    ~H"""
    <section class={["section", @class]} {@rest}>
      <h1 :if={@title} class="title">
        {@title}
      </h1>
      <h2 :if={@subtitle != []} class="subtitle">
        {render_slot(@subtitle)}
      </h2>
      {render_slot(@inner_block)}
    </section>
    """
  end

  attr(:class, :string, default: nil)
  attr(:rest, :global)
  slot(:left, required: false)
  slot(:right, required: false)
  slot(:inner_block, required: false)

  def level(assigns) do
    ~H"""
    <nav class={["level", @class]} {@rest}>
      <div :if={@left != []} class="level-left">
        <div :for={left <- @left} class="level-item">
          {render_slot(left)}
        </div>
      </div>
      <div class="level-item">
        {render_slot(@inner_block)}
      </div>

      <div :if={@right != []} class="level-right">
        <div :for={right <- @right} class="level-item">
          {render_slot(right)}
        </div>
      </div>
    </nav>
    """
  end
end
