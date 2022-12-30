module Blending
  def self.included(base)
     base.after_create :make_juice if base==Apple
  end

  private
  def make_juice
    p "=================="
    p "After create checked inside Blending module --- make_juice method"
    #Add code
  end
end