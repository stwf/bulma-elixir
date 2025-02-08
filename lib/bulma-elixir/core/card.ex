defmodule Bulma.Core.Card do
  @moduledoc """
  Provides core UI components.

  At first glance, this module may seem daunting, but its goal is to provide
  core building blocks for your application, such as modals, tables, and
  forms. The components consist mostly of markup and are well-documented
  with doc strings and declarative assigns. You may customize and style
  them in any way you want, based on your application growth and needs.

  The default components use Tailwind CSS, a utility-first CSS framework.
  See the [Tailwind CSS documentation](https://tailwindcss.com) to learn
  how to customize them or feel free to swap in another framework altogether.

  Icons are provided by [heroicons](https://heroicons.com). See `icon/1` for usage.
  """
  use Phoenix.Component

  attr(:title, :string, default: nil)
  attr(:icon, :string, default: nil)
  attr(:image, :string, default: nil)
  slot(:inner_block, required: true)
  slot(:header, required: false)

  slot(:footer, required: false) do
    attr(:rest, :string)
  end

  attr(:rest, :global, doc: "the arbitrary HTML attributes to add to the flash container")

  def card(assigns) do
    ~H"""
    <div class="card">
      <div class="card-header">
        <div :if={@title} class="card-header-title">
          {@title}
        </div>
        <div :if={@icon} class="card-header-icon">
          {@icon}
        </div>
      </div>
      <div :if={not Enum.empty?(@header)}>
        {render_slot(@header)}
      </div>

      <div :if={@image} class="card-image">
        {@image}
      </div>
      <div class="card-content">
        {render_slot(@inner_block)}
      </div>

      <div :if={not Enum.empty?(@footer)} class="card-footer">
        {render_slot(@footer)}
      </div>
    </div>
    """
  end
end
