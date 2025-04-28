module StaticPagesHelper
  def sort_this(arr)
    arr.sort!
  end
  def is_blank?(name)
    if name.blank?
      "it's blank"
    else
      name
    end
  end
end
