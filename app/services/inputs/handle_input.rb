module Inputs
  class HandleInput
    attr_reader :response

    def self.call(mail)
      this = new(mail)
      this.call
      this
    end

    def initialize(mail)
      @mail = mail
    end

    def call
      @response = extract_data
    end

    private

      def extract_data
        data = Nokogiri::HTML(@mail.decoded)
        find_table(data)
      end

      def find_table(data)
        table = data.search('table')
        extract_cells(table)
      end

      def extract_cells(table)
        link  = table.search('a').first.attributes.first[1].value
        cells = Hash.new
        table.search('b').each do |b|
          key = b.text.strip.downcase.gsub(':', '').gsub(" ", "_")
          if key == 'mensagem'
            value = b.next_sibling.next_sibling.to_s.strip
          else
            value = b.next_sibling.to_s.strip
          end
          hash = { :"#{key}" => value }
          cells.merge!(hash)
        end
        cells[:link_do_veículo] = link
        cells[:telefone_do_interessado].slice!(15, cells[:telefone_do_interessado].length)
        cells
      end
  end
end