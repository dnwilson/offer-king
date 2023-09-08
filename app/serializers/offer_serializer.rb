class OfferSerializer < Blueprinter::Base
  identifier :id

  fields :description, :image
end