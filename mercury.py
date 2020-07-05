import re
from wordcloud import WordCloud 

# import matplotlib.pyplot as plt 

# for i in range(1, 10):
#     for j in range(1, i+1):
#         print(f'{i}x{j}={i*j}', end=' ')
        # print()

with open('trump.txt') as f:
    artic = f.read().lower()
    # print(artic)
    newString = re.sub(r'\n|\,|\.|\'|\"|\t|\:', ' ', artic)
    newString = re.sub(r'\s+', ' ', newString)
    # print(newString)
    cloud = WordCloud(background_color="white", width=800, height=600, margin=2).generate(newString)
    cloud.to_file('trump.png')
