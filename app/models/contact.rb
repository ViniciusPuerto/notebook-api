class Contact < ApplicationRecord
    belongs_to :kind
    has_many :phones
    accepts_nested_attributes_for :phones, allow_destroy: true
    has_one :address
    accepts_nested_attributes_for :address, update_only: true

    def as_json(options={})
      h = super( options )
      h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
      h
    end
    
=begin
    def kind_description
        self.kind.description
    end
    

    def as_json(options={})
     super(root: true,
            methods: [:kind_description],
            #include: {kind: { only: :description}}
            )
    end
=end
end
