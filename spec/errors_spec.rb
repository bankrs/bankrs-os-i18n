# frozen_string_literal: true

require File.expand_path '../spec_helper.rb', __FILE__

describe 'errors.json' do
  before do
    @files = Dir[File.expand_path('../../locales/*', __FILE__)]
    @src = JSON.parse(File.read(File.expand_path('../../src/errors.json', __FILE__)))
  end

  context 'keys' do
    it 'only needed keys in the same order' do
      keys = @src.map { |i| i['code'] }
      @files.each do |f|
        content = YAML.load_file(f)
        expect(content).to be_kind_of(Hash)
        expect(content['errors']).to be_kind_of(Hash)
        expect(content['errors'].keys).to eq(keys)
      end
    end
  end
end
