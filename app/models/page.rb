class Page < ActiveRecord::Base
  
  

  def self.templates
    Template.all
  end
end
