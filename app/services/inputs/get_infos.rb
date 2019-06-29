module Inputs
  class GetInfos
    attr_reader :response

    def self.call(cells)
      this = new(cells)
      this.call
      this
    end

    def initialize(cells)
      @cells = cells
    end

    def call
      @response = get_data
    end

    private

      def get_data
        driver  = Mechanize.new
        page    = driver.get(@cells[:link_do_veículo])
        page    = page.links.first.click
        page.form.busca     = @cells[:veículo]
        page.form.valorde   = 0
        page.form.valorate  = 999999999
        result  = page.form.submit
        nil if result.search('.item-vehicle-list').blank?
      end
  end
end
