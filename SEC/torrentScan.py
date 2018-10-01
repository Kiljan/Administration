from lxml import html
from bs4 import BeautifulSoup
import requests
import csv
from datetime import datetime


def find_between_r(s, first, last):
    try:
        start = s.rindex(first) + len(first)
        end = s.rindex(last, start)
        return s[start:end]
    except ValueError:
        return ""


rangeFrom = 1
rangeTo = 800

with open('index.csv', 'a') as csv_file:
    writer = csv.writer(csv_file)
    writer.writerow(["Strona numer", "Nazwa filmu", "Gatunek", "SEEDS", "LEECH", "URL", "Data"])

for x in range(rangeFrom, rangeTo):

    try:
        '''page definition and start with soup'''
        pageActionURL = 'https://www.torrentdownloads.me/category/419/Action?page=1&srt=added&order=desc&pp=100'.replace(
            "page=1", "page={0}".format(x))
        pageAction = requests.get(pageActionURL)
        gatunek = "Akcja"

        tree = html.fromstring(pageAction.content)
        wholeWeb = html.tostring(tree)
        soup = BeautifulSoup(wholeWeb, 'html.parser')

        grey_barBack_none = soup.find_all('div', attrs={'class': 'grey_bar3 back_none'})

        with open('index.csv', 'a') as csv_file:
            writer = csv.writer(csv_file)
            count = 1

            for node in grey_barBack_none:
                name = node.text.encode('utf-8').strip()
                seStart = str(node)
                LandS = find_between_r(seStart, "/></span><span>", "</span><span>")
                LandS = LandS.split("</span><span>")
                try:
                    seeds = int(LandS[1])
                    leech = int(LandS[0])
                except (RuntimeError, TypeError, NameError, IndexError):
                    continue

                if seeds >= 3:
                    print gatunek
                    print "Strona numer = {0}".format(x)
                    print "Nazwa filmu = {0}".format(name)
                    print "SEEDS = {0}".format(seeds)
                    print "LEECH = {0}".format(leech)
                    print pageActionURL
                    writer.writerow([x, name, gatunek, seeds, leech, pageActionURL, datetime.now()])
                    count = count + 1
    except ConnectionError as e:
        print e
        continue

for x in range(rangeFrom, rangeTo):

    try:
        '''page definition and start with soup'''
        pageActionURL = 'https://www.torrentdownloads.me/category/33/Comedy?page=1&srt=added&order=desc&pp=100'.replace(
            "page=1", "page={0}".format(x))
        pageAction = requests.get(pageActionURL)
        gatunek = "Komedia"

        tree = html.fromstring(pageAction.content)
        wholeWeb = html.tostring(tree)
        soup = BeautifulSoup(wholeWeb, 'html.parser')

        grey_barBack_none = soup.find_all('div', attrs={'class': 'grey_bar3 back_none'})

        with open('index.csv', 'a') as csv_file:
            writer = csv.writer(csv_file)

            count = 1

            for node in grey_barBack_none:
                name = node.text.encode('utf-8').strip()
                seStart = str(node)
                LandS = find_between_r(seStart, "/></span><span>", "</span><span>")
                LandS = LandS.split("</span><span>")
                try:
                    seeds = int(LandS[1])
                    leech = int(LandS[0])
                except (RuntimeError, TypeError, NameError, IndexError):
                    continue

                if seeds >= 3:
                    print gatunek
                    print "Strona numer = {0}".format(x)
                    print "Nazwa filmu = {0}".format(name)
                    print "SEEDS = {0}".format(seeds)
                    print "LEECH = {0}".format(leech)
                    print pageActionURL
                    writer.writerow([x, name, gatunek, seeds, leech, pageActionURL, datetime.now()])
                    count = count + 1
    except ConnectionError as e:
        print e
        continue


for x in range(rangeFrom, rangeTo):

    try:
        '''page definition and start with soup'''
        pageActionURL = 'https://www.torrentdownloads.me/category/29/Animation?page=1&srt=added&order=desc&pp=100'.replace(
            "page=1", "page={0}".format(x))
        pageAction = requests.get(pageActionURL)
        gatunek = "Animacja"

        tree = html.fromstring(pageAction.content)
        wholeWeb = html.tostring(tree)
        soup = BeautifulSoup(wholeWeb, 'html.parser')

        grey_barBack_none = soup.find_all('div', attrs={'class': 'grey_bar3 back_none'})

        with open('index.csv', 'a') as csv_file:
            writer = csv.writer(csv_file)

            count = 1

            for node in grey_barBack_none:
                name = node.text.encode('utf-8').strip()
                seStart = str(node)
                LandS = find_between_r(seStart, "/></span><span>", "</span><span>")
                LandS = LandS.split("</span><span>")
                try:
                    seeds = int(LandS[1])
                    leech = int(LandS[0])
                except (RuntimeError, TypeError, NameError, IndexError):
                    continue

                if seeds >= 3:
                    print gatunek
                    print "Strona numer = {0}".format(x)
                    print "Nazwa filmu = {0}".format(name)
                    print "SEEDS = {0}".format(seeds)
                    print "LEECH = {0}".format(leech)
                    print pageActionURL
                    writer.writerow([x, name, gatunek, seeds, leech, pageActionURL, datetime.now()])
                    count = count + 1
    except ConnectionError as e:
        print e
        continue
