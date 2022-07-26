require 'net/http'

class SearchWordsController < ApplicationController

    def index
        @word = SearchWord.where("word like ?", "%#{params[:word]}%")[0]
        
        if @word == nil
            url = URI.parse("https://www.dictionaryapi.com/api/v3/references/collegiate/json/#{params[:word]}?key=cab72891-f003-43ef-a983-253666d45082")
            req = Net::HTTP::Get.new(url.to_s)
            res = Net::HTTP.start(url.host, url.port, use_ssl: true) {|http| http.request(req)}
            
            jsonWord = JSON.parse(res.body)
            if jsonWord == [] || jsonWord[0]['shortdef'] == nil
                render json: {:valid => false}
                return
            end
            
            definition = jsonWord[0]['shortdef'][0]
            
            @word = SearchWord.create(word: params[:word], definition: definition)
            
        end
        
        render json: {:definition => @word.definition, :valid => true}
    end

end
