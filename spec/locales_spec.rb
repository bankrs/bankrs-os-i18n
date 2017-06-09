# frozen_string_literal: true

require File.expand_path '../spec_helper.rb', __FILE__

describe 'locales files' do
  before do
    @files = Dir[File.expand_path '../../locales/*', __FILE__]
  end

  context 'naming' do
    it 'reflects valid locales' do
      @files.each do |f|
        expect(LOCALES).to include(File.basename(f, '.yml'))
      end
    end

    it 'has .yml file extension' do
      @files.each do |f|
        expect(File.extname(f)).to eq('.yml')
      end
    end
  end

  context 'content' do
    it 'has only needed keys in the same order' do
      @files.each do |f|
        content = YAML.load_file(f)
        expect(content).to be_kind_of(Hash)
        expect(content.keys).to eq(LOCALE_SECTIONS)
      end
    end
  end
end
