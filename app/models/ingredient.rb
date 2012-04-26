class Ingredient < ActiveRecord::Base
	belongs_to :creator, :class_name => "User"
  has_many :logs, :dependent => :destroy
	has_many :consumers, :class_name => "User", :through => :logs

	has_many :recipe_ingredient_joins

	has_many :recipes,
		:through => :recipe_ingredient_joins

	has_many :nutritions

	validates :name,
		:presence => true

	def self.recently_added
		Ingredient.order("created_at DESC").limit(10)
	end

	def type
		Type.find(self.type_id) if self.type_id
	end

	def type=(ty)
		t = Type.find_by_name(ty)
	  if t.nil?
			t = Type.create({:name => ty})
			self.type_id = t.id
			save
		else
			self.type_id = t.id
			save
		end
	end

	def self.search(search)
      if search
        find(:all, :conditions => ['name LIKE ?', "%#{search}%"], :order => "name ASC")
      else
        find(:all)
      end
    end

end
