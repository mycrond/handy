import aiohttp
import asyncio
import os
from fake_useragent import UserAgent
from lxml import etree

async def get_data(url, headers):
	async with aiohttp.ClientSession() as session:
		async with await session.get(url) as response:
			page_text = await response.text(encoding='gbk')
			tree = etree.HTML(page_text)

			li_list = tree.xpath('//div[@class="slist"]//li')
			for li in li_list:
				img_src = 'http://pic.netbian.com' + li.xpath('./a/img/@src')[0]
				img_name = li.xpath('./a/img/@alt')[0].split(' ')[0] + '.jpg'
				# img_name = img_name.encode('iso-8859-1').decode('gbk')
				
				async with await session.get(url=img_src, headers=headers) as img:
					img_data = await img.read()
				img_path = './4kmeinv/' + img_name
				with open(img_path, 'wb') as fp:
					fp.write(img_data)
				print(img_name + " download finished !")

if __name__ == "__main__":
	if not os.path.exists('./4kmeinv'):
		os.mkdir('./4kmeinv')

	ua = UserAgent()
	headers = {
		'User-Agent': ua.chrome
	}

	url_base = 'http://pic.netbian.com/4kmeinv/'
	url_list = [url_base]
	for page in range(10, 20):
		index_url = 'http://pic.netbian.com/4kmeinv/index_%d.html' % page
		url_list.append(index_url)

	tasks = []

	for url in url_list:
		process = get_data(url, headers)
		task = asyncio.ensure_future(process)
		tasks.append(task)

	loop = asyncio.get_event_loop()
	loop.run_until_complete(asyncio.wait(tasks))

