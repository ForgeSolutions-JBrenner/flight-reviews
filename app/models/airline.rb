class Airline < ApplicationRecord
    has_many :reviews
    before_create :slugify
    # add a couple things here so when we create a new airline we slugify it and then set that as the slug value prior to saving to the database
    def slugify
        self.slug = name.parameterize
    end
    def avg_score
        reviews.average(:score.round(2).to_f)
    end
end
