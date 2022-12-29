module Blending
  def self.included(base)
     base.after_create :make_juice if base==Apple
  end

  private
  def make_juice
    #Add code
  end
end