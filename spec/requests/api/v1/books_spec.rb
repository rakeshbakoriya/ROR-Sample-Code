require 'swagger_helper'

RSpec.describe 'api/v1/books', type: :request do

  path '/api/v1/books' do

    get('Users can search books') do
      tags 'Search Books'
      description 'Users can search books by (Book title and description and User name) or (Query)'

      parameter name: :"book[title]", in: :query, schema: { type: :string }
      parameter name: :"book[description]", in: :query, schema: { type: :string }
      parameter name: :"user[name]", in: :query, schema: { type: :string }
      parameter name: :query, in: :query, schema: { type: :string }

      response(200, 'Ok') do
        examples 'application/json' => [
          {
            id: 1,
            title: "Harry Potter",
            author: "J. K. Rowling",
            publisher: "Bloomsbury Publishing",
            genre: "Fantasy, drama, young adult fiction",
            description: "Harry Potter is a series of seven fantasy novels written by British author J. K. ... The novels chronicle the lives of a young wizard, Harry Potter, and his friends Hermione Granger and Ron Weasley, all of whom are students at Hogwarts School of Witchcraft and Wizardry.",
            created_at: "2021-07-25T04:59:30.051+09:00",
            updated_at: "2021-07-25T04:59:30.051+09:00"
          },
          {
            id: 2,
            title: "The Lord of the Rings",
            author: "Tolkien, Tolkien's",
            publisher: "Allen & Unwin",
            genre: "Novel, Heroic fantasy, Fantasy comedy",
            description: "The novel, set in the Third Age of Middle-earth, formed a sequel to Tolkien's The Hobbit (1937) and was succeeded by his posthumous The Silmarillion (1977). The Lord of the Rings is the saga of a group of sometimes reluctant heroes who set forth to save their world from consummate evil.",
            created_at: "2021-07-25T04:59:30.124+09:00",
            updated_at: "2021-07-25T04:59:30.124+09:00"
          }
        ]
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/user_books' do

    post('Users can register their own books') do
      tags 'Book Registration'
      description 'Users can register own multiple books'
      consumes 'application/json'
      parameter name: :user_book, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          book_id: { type: :integer }
        },
        required: [ 'user_id', 'book_id' ]
      }

      response(200, 'Ok') do
        examples 'application/json' => {
          "success": true,
          "errors": [],
          "user_book": {
            user: {
              id: 1,
              name: "String",
              email: "String",
              created_at: "2021-07-25 04:59:30 +0900",
              updated_at: "2021-07-25 04:59:30 +0900"
            },
            book: {
              id: 1,
              title: "String",
              author: "String",
              publisher: "String",
              genre: "String",
              description: "Text",
              created_at: "2021-07-25 04:59:30 +0900",
              updated_at: "2021-07-25 04:59:30 +0900"
            }
          }
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(404, 'Not Found') do
        examples 'application/json' => {
          errors: [{
            message: "Reocrd not Found"
          }]
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(400, ' Bad Request') do
        examples 'application/json' => {
          errors: [
            {
              message: " Bad Request"
            }
          ]
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(400, ' Unprocessable Entity') do
        examples 'application/json' => {
          success: false,
          errors: [
            {
              message: [
                "User has already been taken"
              ]
            }
          ]
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
