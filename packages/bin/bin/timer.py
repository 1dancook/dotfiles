#!/usr/bin/env python3

import click
import time
import os

@click.command()
@click.argument('length', )
def timer(length):
  """Use the format of [N]m or [N]s where [N] is a number, m is minutes, and s is seconds"""
  if length.endswith('s'): #seconds
    length_num = length.replace('s', '').strip()
    seconds = int(length_num)
  elif length.endswith('m'):
    length_num = length.replace('m', '').strip()
    seconds = int(length_num) * 60
  else:
    click.echo('Read the help:\ntimer --help')
  click.echo(f'Setting a timer for {length}')
  time.sleep(seconds)
  os.system('osascript -e \'display notification \"Time Up\" with title \"Timer:\"\'')


if __name__ == "__main__":
  timer()
