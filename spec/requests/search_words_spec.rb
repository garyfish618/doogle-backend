# require 'rails_helper'

# RSpec.describe 'Dictionary Word', type: :request do
#     describe 'GET /search_words' do
#         it 'returns definition of word provided' do
#             params = {"word"=>"test"}
#             get('/search_words')
#             json = JSON.parse(response.body)
#             expect(json['definition']).to eq('a means of testing: such as')
            
#             params = {:word=>"nonexistentwordhere"}
#             get('/search_words', params)
#             json = JSON.parse(response.body)
#             expect(json['valid']).to eq(false)

#         end
#     end
# end