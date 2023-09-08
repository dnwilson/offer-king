class OfferSerializer < Blueprinter::Base
  identifier :id

  fields :description, :image

  field :claimed do
    offer.claimed == 1
  end

  view :user_offer do
    field :claimed do |record, options|
      options[:user_offer].present?
    end
  end
end