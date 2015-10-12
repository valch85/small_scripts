require 'open-uri'
url = "http://www.google.com/search?q=ruby"
open(url) {|page| page_content = page.read()
links = page_content.scan(/<a class=l.*?href=\"(.*?)\"/).flatten
links.each {|link| puts link}
}

url = "http://unixway.info/bugs/fastcgi-sent-in-stderr-php-parse-error-syntax-error-unexpected-end-in/"
open(url) {|page| page_content = page.read()
links = page_content.scan(/.*?href=\"(.*?)\"/).flatten
links.each {|link| puts link}
}