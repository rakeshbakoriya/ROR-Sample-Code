class BookSerializer < BaseSerializer
  attributes :id, :title, :author, :publisher, :genre, :description, :created_at, :updated_at
end
