    require 'open-uri'
    require 'nokogiri'
class Pony < ActiveRecord::Base
   
    def self.crawling
        url = 'https://www.youtube.com/channel/UCT-_4GqC-yLY1xtTHhwY0hA'
        doc = Nokogiri::HTML(open(url + '/videos'), nil, "UTF-8")

        title = doc.css("ul#channels-browse-content-grid .yt-lockup-title//a")
        # content = doc.css("ul#channels-browse-content-grid .yt-lockup-thumbnail//img")
        # content = doc.css("#https://i.ytimg.com/vi/6eYe4EXx-zQ/hqdefault.jpg?custom=true&w=336&h=188&stc=true&jpg444=true&jpgq=90&sp=68&sigh=f64vAYZee2nu-eof6f6AknvN_eQ img").text.strip unless doc.css("#https://i.ytimg.com/vi/6eYe4EXx-zQ/hqdefault.jpg?custom=true&w=336&h=188&stc=true&jpg444=true&jpgq=90&sp=68&sigh=f64vAYZee2nu-eof6f6AknvN_eQ img").nil?
        #.text.strip unless doc.css("ul#spf-link  ux-thumb-wrap contains-addto img").nil?
        # content = doc.css('#yt-uix-sessionlink img').attr('https://i.ytimg.com/vi/6eYe4EXx-zQ/hqdefault.jpg?custom=true&w=336&h=188&stc=true&jpg444=true&jpgq=90&sp=68&sigh=f64vAYZee2nu-eof6f6AknvN_eQ')
        content = doc.css("#;window.__ytRIL && __ytRIL(this) img").text.strip unless doc.at_css("#;window.__ytRIL && __ytRIL(this) img").nil?
        
        title.each_with_index do |c, i|
   
             # puts "#{i+1}"
             Pony.create(title: c.attr('title'))
        end
             
        content.each_with_index do |c, i|
             Pony.create(content: c.attr('content'))
             
        end
        
    end
end
