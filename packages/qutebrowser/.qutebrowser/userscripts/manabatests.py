#!/usr/bin/env python3

from bs4 import BeautifulSoup
import os
import subprocess


def make_soup(html_path):
    with open(html_path, 'r') as f:
        html = f.read()

    return BeautifulSoup(html, "html5lib")


def std_table_row(tag):
    if tag.name == 'tr':
        for child in tag.children:
            if child.name == 'td':
                if child.has_attr('class') and 'name' in child['class']:
                    return True


def get_points(soup):
    tablerows = soup.find_all(std_table_row)

    points = []

    for row in tablerows:
        x = 0
        for child in row.children:
            if child.name == 'td':
                x += 1
                if x == 3:
                    n = str(child.contents[0].replace('points', '').strip())
                    if '-' in n:
                        n = '0'
                    points.append(n)
                    #points.append(child.contents[0].replace('points', '').strip())
                    break
    return points

def copy_to_clipboard(points):
    # send to clipboard
    joined_points = '\n'.join(points)
    cmd = f"echo '{joined_points}' | pbcopy"
    subprocess.run(cmd, shell=True)


def send_feedback(points):
    #text = f'Copied {len(points)} test scores to clipboard'
    text = f'jseval -q alert("Copied {len(points)} test scores to clipboard")\n'
    try:
        with open(os.getenv('QUTE_FIFO'), 'w') as f:
            f.write(text)
    except:
        pass

if __name__ == '__main__':

    html_path = os.getenv('QUTE_HTML')

    if not html_path:
        html_path = 'test.html'


    soup = make_soup(html_path)
    points = get_points(soup)
    copy_to_clipboard(points)
    send_feedback(points)
