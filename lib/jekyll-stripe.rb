module Jekyll
  class StripeTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @key = text.strip
    end

    def render(context)
      File.read(File.expand_path "./jekyll-stripe/template.html", File.dirname(__FILE__)).sub! '%APIKEY%', @key
    end
  end

  class StripeButtonTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @id = text.strip
    end

    def render(context)
      style = "background-color:#6772E5;color:#FFF;padding:8px 12px;border:0;border-radius:4px;font-size:1em"

      "<button style=\"#{style}\" type=\"button\" role=\"link\" data-buybutton-id=\"#{@id}\">Buy now</button> " +
      "<span class=\"buybutton-error\"></span>"
    end
  end
end

Liquid::Template.register_tag('stripe', Jekyll::StripeTag)
Liquid::Template.register_tag('stripe_button', Jekyll::StripeButtonTag)
