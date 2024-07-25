import os
from pprint import pprint
import requests
from tabulate import tabulate
from bs4 import BeautifulSoup

def data_parser_guap(webpath):
    # variables
    data, person_data, counter = [], {}, 0
    
    # init parser
    response = requests.get(webpath)
    soup = BeautifulSoup(response.content, 'html.parser')
    
    # collect data
    ids = ['Место', 'СНИЛС', 'Приоритет', 'Баллы', 'ege_scores', 'achievements', 'Оригинал', 'БВИ']
    for i in soup.find_all('td'):
        text = i.get_text()
        if len(text) == 0:
            text = '-'
        person_data[ids[counter]] = text
        counter += 1
        if counter == 8:
            del person_data['ege_scores'], person_data['achievements']
            data.append(person_data)
            person_data = {}
            counter = 0
    data.sort(key=lambda x: x.get('Баллы'), reverse=True)
    
    for i in data:
        i['Место'] = data.index(i) + 1
        
    # get name of the specialty
    title = soup.find_all('h3')[2].get_text()
    data.append(title)
    
    return data

def data_parser_politex(id):
    cookies = {
    'session-cookie': '17e35f89fbb8664b2fc0babc04983c47f29d0a504474ae315c6bf1bfda781c7a77efcfdf69db5a1028dc471da2bb07aa',
    }

    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0',
        'Accept': '*/*',
        'Accept-Language': 'ru',
        # 'Accept-Encoding': 'gzip, deflate, br, zstd',
        'Referer': 'https://enroll.spbstu.ru/',
        'Connection': 'keep-alive',
        # 'Cookie': 'session-cookie=17e35f89fbb8664b2fc0babc04983c47f29d0a504474ae315c6bf1bfda781c7a77efcfdf69db5a1028dc471da2bb07aa',
        'Sec-Fetch-Dest': 'empty',
        'Sec-Fetch-Mode': 'cors',
        'Sec-Fetch-Site': 'same-origin',
        'Priority': 'u=1',
    }

    params = {
        'applicationEducationLevel': 'BACHELOR',
        'directionEducationFormId': '2',
        'directionId': f'{id}',
    }

    response = requests.get(
        'https://enroll.spbstu.ru/applications-manager/api/v1/admission-list/form-rating',
        params=params,
        cookies=cookies,
        headers=headers,
    )
    
    all_data = response.json()['list']
    data, person_data = [], {}
    for elem in all_data:
        person_data['Место'] = 0
        person_data['СНИЛС'] = elem["userSnils"]
        person_data['Приоритет'] = elem["priority"]
        person_data['Баллы'] = elem["fullScore"]
        if elem["hasOriginalDocuments"] is True:
            person_data['Оригинал'] = 'Да'
        else:
            person_data['Оригинал'] = 'Нет'
        if elem["withoutExam"] is True:
            person_data['БВИ'] = 'Да'
        else:
            person_data['БВИ'] = 'Нет'
        if elem["state"] == "FOR_ENROLLMENT":
            person_data['Статус'] = 'К зачислению'
        else:
            person_data['Статус'] = 'Участвует в конкурсе'
        data.append(person_data)
        person_data = {}
        
    for i in data:
        i['Место'] = data.index(i) + 1
    return data
        

def show_data_table(data):
    title = data.pop(-1)
    print(tabulate(data, headers='keys', tablefmt="grid", stralign='center'))
    
def show_data_txt(data):
    title = data.pop(-1)
    title = title.replace('\"', '')
    file = open(f'{title}.txt', 'w')
    file.write('\t'.join(data[0].keys()))
    file.write('\n')
    for i in data:
        file.write('\t'.join(str(x) for x in i.values()))
        file.write('\n')
    
main_list = {}
main_list['ГУАП'] = {}
main_list['ГУАП']['27.03.05'] = 'https://priem.guap.ru/bach/lists/list_1_123_1_1_1_f_1'
main_list['ГУАП']['09.03.04'] = 'https://priem.guap.ru/bach/lists/list_1_20_1_1_1_f_1'
main_list['ГУАП']['09.03.02'] = 'https://priem.guap.ru/bach/lists/list_1_18_1_1_1_f_1'
main_list['ГУАП']['27.03.04'] = 'https://priem.guap.ru/bach/lists/list_1_122_1_1_1_f_1'
main_list['ГУАП']['09.03.03'] = 'https://priem.guap.ru/bach/lists/list_1_500_1_1_1_f_1'
main_list['ГУАП']['01.03.02'] = 'https://priem.guap.ru/bach/lists/list_1_1_1_1_1_f_1'
main_list['ГУАП']['09.03.01a'] = 'https://priem.guap.ru/bach/lists/list_1_510_1_1_1_f_1'
main_list['ГУАП']['09.03.01b'] = 'https://priem.guap.ru/bach/lists/list_1_515_1_1_1_f_1'
main_list['ГУАП']['10.03.01'] = 'https://priem.guap.ru/bach/lists/list_1_32_1_1_1_f_1'
main_list['СПбПУ'] = {}
main_list['СПбПУ']['38.03.05'] = '2040'
main_list['СПбПУ']['27.03.05'] = '2094'
main_list['СПбПУ']['27.03.04'] = '2453'
main_list['СПбПУ']['15.03.04'] = '2018'
main_list['СПбПУ']['01.03.05'] = '2359'
main_list['СПбПУ']['10.05.01'] = '2161'
main_list['СПбПУ']['10.05.03'] = '2139'
main_list['СПбПУ']['10.05.04'] = '2144'


university = os.getenv('uni')
specialty = os.getenv('spec')
data = None

if university == 'ГУАП':
    data = data_parser_guap(main_list[university][specialty]) 
if university == 'СПбПУ':
    data = data_parser_politex(main_list[university][specialty]) 

show_data_table(data)