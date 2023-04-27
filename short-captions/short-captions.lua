PANDOC_VERSION:must_be_at_least '3.1'

if FORMAT:match "latex" then
  function Figure(f)
    local short = f.content[1].content[1].attributes['short-caption']
    if short and not f.caption.short then
      f.caption.short = pandoc.Inlines(short)
    end
    return f
  end
end
