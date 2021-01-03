module Jekyll
  module PDF
    class Generator < Jekyll::Generator
      safe true
      priority :lowest

      def generate(site)
        [site.pages.clone, site.documents].flatten.each do |item|
          if item.data['pdf']
            Jekyll.logger.info "Jekyll-PDF:", "Generating pdf for #{item.data['title']}"
            site.pages << Document.new(site, site.source, item) #if item.data['pdf']
          end
        end
      end
    end
  end
end
