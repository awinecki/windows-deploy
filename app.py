import time
import datetime
import sys
import os

#sys.stdout = open('c:/code/test/stdout.log', 'a')
#sys.stderr = open('c:/code/test/stderr.log', 'a')

while True:
    now = datetime.datetime.now()
    time_now = now.strftime("%Y-%m-%d %H:%M:%S")
    print('stdout: ' + time_now)
    # Open a file with access mode 'a'
    file_object = open('c:/code/test/log.txt', 'a')
    # Append 'hello' at the end of file
    file_object.write('File output: ' + time_now + '\n')
    # Close the file
    file_object.close()
    time.sleep(1)

