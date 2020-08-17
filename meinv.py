import requests
import os
from lxml import etree

def get_page(url, headers):
	response = requests.get(url=url, headers=headers)
	# response.encoding = response.apparent_encoding
	response.encoding = 'gbk'
	return response.text

if __name__ == "__main__":
	if not os.path.exists('./4kmeinv'):
		os.mkdir('./4kmeinv')

	headers = {
		'User-Agent': 'Mozilla/5.0 Chrome/85.0.4183.59'
	}

	url_base = 'http://pic.netbian.com/4kmeinv/'
	url_list = [url_base]
	for page in range(10, 20):
		index_url = 'http://pic.netbian.com/4kmeinv/index_%d.html' % page
		url_list.append(index_url)

	for url in url_list:
		page_text = get_page(url, headers)
		tree = etree.HTML(page_text)

		li_list = tree.xpath('//div[@class="slist"]//li')
		for li in li_list:
			img_src = 'http://pic.netbian.com' + li.xpath('./a/img/@src')[0]
			img_name = li.xpath('./a/img/@alt')[0].split(' ')[0] + '.jpg'
			# img_name = img_name.encode('iso-8859-1').decode('gbk')
			
			img_data = requests.get(url=img_src, headers=headers).content
			img_path = './4kmeinv/' + img_name
			with open(img_path, 'wb') as fp:
				fp.write(img_data)
			print(img_name + " download finished !")
