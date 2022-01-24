class Monimage < ApplicationRecord
    belongs_to :imageable, :polymorphic => true
    has_one_attached :image

    before_save :setTitre

    def setTitre
        self.titre = self.image.filename.base
    end
end
