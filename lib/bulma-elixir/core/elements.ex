defmodule Bulma.Core.Elements do
  use Phoenix.Component

  attr(:rest, :global)
  slot(:inner_block, required: true)

  def block(assigns) do
    ~H"""
    <div class="block" {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr(:rest, :global)
  slot(:inner_block, required: true)
  attr(:class, :string, default: nil)

  def box(assigns) do
    ~H"""
    <div class={["box", @class]} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr(:class, :string, default: "")
  attr(:kind, :atom, values: [:link, :button, :submit, :reset], default: :link)
  slot(:inner_block, required: false)
  attr(:rest, :global)

  def button(%{kind: :button} = assigns) do
    ~H"""
    <button class={["button", @class]} {@rest}>
      {render_slot(@inner_block)}
    </button>
    """
  end

  def button(%{kind: :submit} = assigns) do
    ~H"""
    <button type="submit" class={["button", @class]} {@rest}>
      {render_slot(@inner_block)}
    </button>
    """
  end

  def button(%{kind: :reset} = assigns) do
    ~H"""
    <button type="reset" class={["button", @class]} {@rest}>
      {render_slot(@inner_block)}
    </button>
    """
  end

  def button(%{kind: :link} = assigns) do
    ~H"""
    <a class={["button", @class]} {@rest}>
      {render_slot(@inner_block)}
    </a>
    """
  end

  attr(:class, :string, default: nil)
  slot(:inner_block, required: true)
  attr(:rest, :global)

  def content(assigns) do
    ~H"""
    <a class={["content", @class]} {@rest}>
      {render_slot(@inner_block)}
    </a>
    """
  end

  attr(:class, :string, default: nil)
  attr(:rest, :global)

  def delete(assigns) do
    ~H"""
    <button class={["delete", @class]} {@rest}></button>
    """
  end

  attr(:class, :string, default: nil)
  attr(:name, :string, required: true)
  attr(:text, :string, default: nil)
  attr(:rest, :global)

  def icon(%{text: nil} = assigns) do
    ~H"""
    <span class={["icon", @class]}>
      <i class={@name}></i>
    </span>
    """
  end

  def icon(assigns) do
    ~H"""
    <span class={["icon", @class]}>
      <i class={@name}></i>
    </span>
    <span>@text</span>
    """
  end

  attr(:rest, :global)
  attr(:value, :string, default: nil)
  slot(:inner_block, required: false)

  def tag(assigns) do
    ~H"""
    <span class="tag" {@rest}>
      {@value || render_slot(@inner_block)}
    </span>
    """
  end

  attr(:rest, :global)
  slot(:inner_block, required: true)

  def title(assigns) do
    ~H"""
    <div class="title" {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr(:value, :integer)
  attr(:max, :integer)
  attr(:rest, :global)

  def progress(assigns) do
    ~H"""
    <div class="progress" value={@value} max={@max} {@rest}>
      {{@value}}
    </div>
    """
  end

  attr(:rest, :global)
  slot(:inner_block, required: true)

  def subtitle(assigns) do
    ~H"""
    <div class="subtitle" {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end
end
