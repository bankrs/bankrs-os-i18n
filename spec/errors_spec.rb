# frozen_string_literal: true

require File.expand_path '../spec_helper.rb', __FILE__

describe 'errors.json' do
  before do
    @files = Dir[File.expand_path('../../locales/*', __FILE__)]
    @keys = File.read(File.expand_path('../../src/errorcodes.txt', __FILE__)).strip.split("\n")
  end

  context 'keys' do
    it 'only needed keys in the same order' do
      @files.each do |f|
        content = YAML.load_file(f)
        expect(content).to be_kind_of(Hash)
        expect(content['errors']).to be_kind_of(Hash)
        # The next two two are redundant, but they help to see errors
        expect(content['errors'].keys - @keys).to eq([])
        expect(@keys - content['errors'].keys).to eq([])
        # The main check
        expect(content['errors'].keys).to eq(@keys)
      end
    end
  end
end
