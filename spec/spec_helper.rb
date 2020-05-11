$: << File.join(File.dirname(__FILE__), "/../lib")
require 'meta_inspector'
require "webmock/rspec"
require "pry"

def fixture_file(filename)
  return '' if filename == ''
  file_path = File.expand_path(File.dirname(__FILE__) + '/fixtures/' + filename)
  File.read(file_path)
end

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.before(:each) do
    stub_request(:get, "http://alazan.com/websolution.asp").to_return(fixture_file("alazan_websolution.response"))
    stub_request(:get, "http://charset000.com").to_return(fixture_file("charset_000.response"))
    stub_request(:get, "http://charset001.com").to_return(fixture_file("charset_001.response"))
    stub_request(:get, "http://charset002.com").to_return(fixture_file("charset_002.response"))
    stub_request(:get, "http://example-rtl.com/").to_return(fixture_file("encoding.response"))
    stub_request(:get, "http://example.com").to_return(fixture_file("example.response"))
    stub_request(:get, "http://example.com/").to_return(fixture_file("example.response"))
    stub_request(:get, "http://example.com/100x100").to_return(fixture_file("100x100.jpg.response"))
    stub_request(:get, "http://example.com/10x10").to_return(fixture_file("10x10.jpg.response"))
    stub_request(:get, "http://example.com/broken_head_links").to_return(fixture_file("broken_head_links.response"))
    stub_request(:get, "http://example.com/desc_in_meta").to_return(fixture_file("desc_in_meta.response"))
    stub_request(:get, "http://example.com/desc_in_og").to_return(fixture_file("desc_in_og.response"))
    stub_request(:get, "http://example.com/desc_in_twitter").to_return(fixture_file("desc_in_twitter.response"))
    stub_request(:get, "http://example.com/empty").to_return(fixture_file("empty_page.response"))
    stub_request(:get, "http://example.com/head_links").to_return(fixture_file("head_links.response"))
    stub_request(:get, "http://example.com/headings").to_return(fixture_file("headings.response"))
    stub_request(:get, "http://example.com/invalid_byte_seq").to_return(fixture_file("invalid_byte_seq.response"))
    stub_request(:get, "http://example.com/invalid_utf8_byte_seq").to_return(fixture_file("invalid_utf8_byte_seq.response"))
    stub_request(:get, "http://example.com/invalid_href").to_return(fixture_file("invalid_href.response"))
    stub_request(:get, "http://example.com/largest_image_in_html").to_return(fixture_file("largest_image_in_html.response"))
    stub_request(:get, "http://example.com/largest_image_using_image_size").to_return(fixture_file("largest_image_using_image_size.response"))
    stub_request(:get, "http://example.com/malformed_href").to_return(fixture_file("malformed_href.response"))
    stub_request(:get, "http://example.com/malformed_image_in_html").to_return(fixture_file("malformed_image_in_html.response"))
    stub_request(:get, "http://example.com/meta-tags").to_return(fixture_file("meta_tags.response"))
    stub_request(:get, "http://example.com/no-content-type").to_return(fixture_file("no-content-type.response"))
    stub_request(:get, "http://example.com/nonhttp").to_return(fixture_file("nonhttp.response"))
    stub_request(:get, "http://example.com/title_best_choice").to_return(fixture_file("title_best_choice.response"))
    stub_request(:get, "http://example.com/title_in_body").to_return(fixture_file("title_in_body.response"))
    stub_request(:get, "http://example.com/title_in_h1").to_return(fixture_file("title_in_h1.response"))
    stub_request(:get, "http://example.com/title_in_head").to_return(fixture_file("title_in_head.response"))
    stub_request(:get, "http://example.com/title_in_head_with_whitespace").to_return(fixture_file("title_in_head_with_whitespace.response"))
    stub_request(:get, "http://example.com/title_not_present").to_return(fixture_file("title_not_present.response"))
    stub_request(:get, "http://example.com/h1_with_various_tags").to_return(fixture_file("h1_with_various_tags.response"))
    stub_request(:get, "http://example.com/author_in_meta").to_return(fixture_file("author_in_meta.response"))
    stub_request(:get, "http://example.com/author_in_body").to_return(fixture_file("author_in_body.response"))
    stub_request(:get, "http://example.com/author_in_link").to_return(fixture_file("author_in_link.response"))
    stub_request(:get, "http://example.com/author_in_twitter").to_return(fixture_file("author_in_twitter.response"))
    stub_request(:get, "http://example.com/~").to_return(fixture_file("example.response"))
    stub_request(:get, "http://facebook.com/").to_return(fixture_file("facebook.com.response"))
    stub_request(:get, "http://international.com").to_return(fixture_file("international.response"))
    stub_request(:get, "http://pagerankalert-shortcut-and-icon.com").to_return(fixture_file("pagerankalert-shortcut-and-icon.com.response"))
    stub_request(:get, "http://pagerankalert-shortcut.com").to_return(fixture_file("pagerankalert-shortcut.com.response"))
    stub_request(:get, "http://pagerankalert-touch-icon.com").to_return(fixture_file("pagerankalert-touch-icon.com.response"))
    stub_request(:get, "http://pagerankalert.com/").to_return(fixture_file("pagerankalert.com.response"))
    stub_request(:get, "http://pagerankalert.com/image.png").to_return(headers: {'Content-Type' => 'image/png'})
    stub_request(:get, "http://protocol-relative.com").to_return(fixture_file("protocol_relative.response"))
    stub_request(:get, "http://relative.com/").to_return(fixture_file("relative_links.response"))
    stub_request(:get, "http://relative.com/company").to_return(fixture_file("relative_links.response"))
    stub_request(:get, "http://relative.com/company/").to_return(fixture_file("relative_links.response"))
    stub_request(:get, "http://relativewithbase.com/").to_return(fixture_file("relative_links_with_base.response"))
    stub_request(:get, "http://relativewithbase.com/company/page2").to_return(fixture_file("relative_links_with_base.response"))
    stub_request(:get, "http://relativewithbase.com/company/page2/").to_return(fixture_file("relative_links_with_base.response"))
    stub_request(:get, "http://theonion-no-description.com").to_return(fixture_file("theonion-no-description.com.response"))
    stub_request(:get, "http://www.24-horas.mx/mexico-firma-acuerdo-bilateral-automotriz-con-argentina/").to_return(fixture_file("relative_og_image.response"))
    stub_request(:get, "http://www.alazan.com").to_return(fixture_file("alazan.com.response"))
    stub_request(:get, "http://www.guardian.co.uk/media/pda/2011/sep/15/techcrunch-arrington-startups").to_return(fixture_file("guardian.co.uk.response"))
    stub_request(:get, "http://www.theonion.com/articles/apple-claims-new-iphone-only-visible-to-most-loyal,2772/").to_return(fixture_file("theonion.com.response"))
    stub_request(:get, "http://www.youtube.com/watch?v=iaGSSrp49uc").to_return(fixture_file("youtube.response"))
    stub_request(:get, "http://www.youtube.com/watch?v=short_title").to_return(fixture_file("youtube_short_title.response"))
    stub_request(:get, "https://example.com/head_links").to_return(fixture_file("head_links.response"))
    stub_request(:get, "https://protocol-relative.com").to_return(fixture_file("protocol_relative.response"))
    stub_request(:get, "https://twitter.com/markupvalidator").to_return(fixture_file("twitter_markupvalidator.response"))
    stub_request(:get, "https://www.facebook.com/").to_return(fixture_file("https.facebook.com.response"))
    stub_request(:get, "http://example.com/meta_tags_empty").to_return(fixture_file("meta_tags_empty.response"))
    stub_request(:get, "http://feeds.example.com").to_return(fixture_file("feeds.response"))
  end
end
