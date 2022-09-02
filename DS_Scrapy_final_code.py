#Isabelle spider code for DS project 
# video will be shared going though it
# not my cleanest work but I learned a lot! 

from io import BufferedRandom
from typing import ItemsView
import scrapy
from scrapy import item
from ..items import NaturehillSpiderItem

from scrapy.selector import Selector       
from scrapy.http import HtmlResponse

class NaturehillSpider(scrapy.Spider):       #name and define what type of spider 
    name = "naturehill"
    def start_requests(self):                #urls to call from, put in their own spider and make csv.
        urls = [
            'https://www.naturehills.com/zz-plant',
            'https://www.naturehills.com/splash-select-white-polka-dot-plant',
            'https://www.naturehills.com/snake-plant',
            'https://www.naturehills.com/scarlet-star-bromeliad',
            'https://www.naturehills.com/neanthe-bella-palm',
            'https://www.naturehills.com/marble-queen-pothos',
            'https://www.naturehills.com/maidenhair-fern',
            'https://www.naturehills.com/golden-pothos',
            'https://www.naturehills.com/garden-croton',
            'https://www.naturehills.com/echeveria-truffles',
            'https://www.naturehills.com/echeveria-elegans',
            'https://www.naturehills.com/dieffenbachia',
            'https://www.naturehills.com/boston-fern',
            'https://www.naturehills.com/anthurium',
            'https://www.naturehills.com/fragrant-tea-olive',
            'https://www.naturehills.com/ivy-english',
            'https://www.naturehills.com/mediterranean-fan-palm-tree',
            'https://www.naturehills.com/dracaena-compacta',
            'https://www.naturehills.com/money-tree',
            'https://www.naturehills.com/spider-plant',
            'https://www.naturehills.com/swiss-cheese-plant',
            'https://www.naturehills.com/fiddle-leaf-fig',
            'https://www.naturehills.com/nerve-plant',
            'https://www.naturehills.com/ghost-chili-pepper-grow-kit',
            'https://www.naturehills.com/carolina-reaper-chili-pepper-grow-kit',
            'https://www.naturehills.com/scorpion-chili-pepper-grow-kit',
        ]
        for url in urls:      #URLS in a loop to call (goal:I want to do this for just a single link on the page one day)
            yield scrapy.Request(url=url, callback=self.parse)


    def parse(self, response):           #take the page and store it
        page = response.url.split("/") [-1]    #format called HTML to make it look nicer
        filename = f'{page}'                    
        with open(filename, 'wb') as f:
            f.write(response.body)
        self.log(f'Saved file {filename}')      #save file with nice name to folder 

        items = NaturehillSpiderItem()      #the spiders task
#        name = response.css(".base::text").getall() # all of the text in the plant highlight table per page [UNSTRUCTURED, (stored as an entity?)]
        all = response.css(".col::text").getall()    # List of table attributes
        items['all'] = all
        #items['name'] = nam

        yield items

 #take the items about the plants, supper messy b/c there was no confluedity and alot of redundancy in the data 
 #can scrapy be used as a tool to audit data management?




##         all_div_highlight = response.css('div.additional-attributes-wrapper table-wrapper')
##       title = all_div_highlight.css('table.text::text').extract()

# response.css('product-attribute-specs-table .data::text').extract()
 
#export test
# look for the "Sun Exposure" text as a key word
# tr:nth-child(3) .data


# response.xpath("//table//td[last()]/text()").extract_first()
# response.xpath("//table//td/text()").extract()[-1]
# response.css(".col::text").extract()   #####I DID IT

### 0. Make sure you are in the correct DIRECTORY 
# desktop> project 11> naturehill_spider> spiders> "scrapy crawl naturehill"



## 1. start crawl per C&P line of url: scrapy crawl naturehill
        # Scrappy shell notes: https://www.youtube.com/watch?v=FQv-whbCfKs
    # 1.1 scrapy shell 'https://www.naturehills.com/zz-plant'  note: can i make its on loop to do this?
    # 1.2 response.css('title')     note: returns what is inclued in that HTML 'frame'
        # [<Selector xpath='descendant-or-self::title' data='<title>ZZ Plant | Nature Hills Nurser...'>]
    #response.css('title::text').getall()   note: pulls the info wanted in title  
        #['ZZ Plant | Nature Hills Nursery']  

# Extract specifics informion from schell: 
# response.css('tr:nth-child(3) .data::text').extract()
            #   tr:nth-child(5) .data

    #['Full Sun, Partial Shade']
    # start to think of how to organize this in table form 




# All of the plant meta data == .nh-product-highlights-box
    # in term # response.css('.nh-product-highlights-box').extract()

# all of the plant meta data specifics == col data
# in term # response.css('col.data').extract()
                        # col data



######### note graveyard #######


#for link in response.xpath('//li//a/@href[contains(., "/shop-online/")]'):
   # yield response.follow(link.get())
# https://stackoverflow.com/questions/56351064/using-scrapy-to-loop-through-discovered-a-href-url-links-to-scrape-the-correspon



# response.xpath('//a[contains(@href, "Sun Exposure")]/text()').getall ()

# response.xpath('//a[contains(@href, "Sun Exposure")]/@href').get(default='')

#  response.xpath('//strong[contains(text(),'Sun Exposure')]').get.all()



# re(r'Name:\s*(.*)')


#### response.css("tr.col.label td.col.data")  note: video #10 @705
#response.css('tr:nth-child(3) .data::text').xpath('@class').extract()

#           response.css("td.Sun&#x20;Exposure").xpath("@class")

# response.ccs("tr td").xpath("@data-th").extract()
#



# https://www.youtube.com/watch?v=INm8yR4aYjk&list=PLhTjy8cBISEqkN-5Ku_kXG4QW33sxQo0t&index=10
# @3:27 
# response.xpath("//span[@class='tr:nth-child(3) .data']").extract()

#response.xpath("//span[@class='col data']").extract()


#//tr[(((count(preceding-sibling::) + 1) = 5) and parent::)]//[contains(concat( " ", @class, " " ), concat( " ", "data", " " ))]
#//tr[(((count(preceding-sibling::*) + 1) = 3) and parent::*)]//*[contains(concat( " ", @class, " " ), concat( " ", "data", " " ))]
#response.css('tr:nth-child(3) .data::text').extract()


#response.xpath("//span[(((count(preceding-sibling::) + 1) = 5) and parent::)]//[contains(concat( " ", @class, " " ), concat( " ", "data", " " ))].extract()


#### learning tools 
#https://www.naturehills.com/houseplants
#https://docs.scrapy.org/en/latest/intro/tutorial.html
# L&S You Tube: https://www.youtube.com/watch?v=INm8yR4aYjk&list=PLhTjy8cBISEqkN-5Ku_kXG4QW33sxQo0t&index=10 

