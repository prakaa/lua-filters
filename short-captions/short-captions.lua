if FORMAT:match "latex" then
  function figure_image (elem)
    local fig_content = elem.content and elem.content[1]
    if fig_content.t == "Plain" then
      local image = fig_content.content and fig_content.content[1].t == "Image"
        and fig_content.content[1]
      return image
    else
      return nil
    end
  end

  function Figure (fig)
    local img = figure_image(fig)
    local img_attrs = img.attr.attributes
    if not img or not img.caption or not img_attrs['short-caption'] then
      return nil
    end
    local short_caption = pandoc.Span(
      pandoc.read(img_attrs['short-caption']).blocks[1].c
    )
    fig.caption.short = short_caption
    return fig
  end
end
