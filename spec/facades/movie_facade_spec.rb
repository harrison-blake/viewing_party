require 'rails_helper'

RSpec.describe MoviesFacade do
  describe 'happy path' do
    it "called Facade top40 and gets data" do
      result = ''

      VCR.use_cassette('top_movie_data') do
        result = MoviesFacade.top40
      end

      expect(result).to be_an(Array)
      expect(result[0]).to be_an(Film)
      expect(result.length).to eq(40)
    end

    it "called Facade movie_search and gets data" do
      result = ''
      keyword = 'pulp fiction'

      VCR.use_cassette('searched_movie_specific_keyword') do
        result = MoviesFacade.movie_search(keyword)
      end

      expect(result).to be_an(Array)
      expect(result[0]).to be_an(Film)
      expect(result[0].title).to eq('Pulp Fiction')
    end
  end
end