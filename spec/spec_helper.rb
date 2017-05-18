# frozen_string_literal: true

require 'yaml'

# Could be get like that:
# `locale -a`.downcase.tr('_', '-').split("\n").select { |l| l =~ /^[a-z]{2}-[a-z]{2}$/ }
LOCALES = %w[af-za am-et be-by bg-bg ca-es cs-cz da-dk de-at de-ch de-de el-gr en-au en-ca en-gb en-ie en-nz
             en-us es-es et-ee eu-es fi-fi fr-be fr-ca fr-ch fr-fr he-il hr-hr hu-hu hy-am is-is it-ch it-it
             ja-jp kk-kz ko-kr lt-lt nl-be nl-nl no-no pl-pl pt-br pt-pt ro-ro ru-ru sk-sk sl-si sr-yu sv-se
             tr-tr uk-ua zh-cn zh-hk zh-tw].freeze
LOCALE_SECTIONS = %w[errors].freeze
