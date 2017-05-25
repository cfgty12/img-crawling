require 'open-uri'
require 'nokogiri'
# 두가지 잼을 쓰겠다

url = 'https://www.youtube.com/channel/UCT-_4GqC-yLY1xtTHhwY0hA'
# url 이라는 변수에 담음
doc = Nokogiri::HTML(open(url + '/videos'), nil, "UTF-8")

title = doc.css("ul#channels-browse-content-grid .yt-lockup-title//a")
content = doc.css("ul#spf-link  ux-thumb-wrap contains-addto img")
# css 아이디가 ul 인 애를 가지고 오고 싶음
title.each_with_index do |c, i|
   
    # puts "#{i+1}"
    puts c.attr('title')
    puts "/n"
end
    
# content.each_with_index do |c, i|
#     puts c.attr('content')
#     puts "/n"
# end