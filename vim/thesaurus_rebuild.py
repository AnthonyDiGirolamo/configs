#!/usr/bin/python
line = "buffer"
fin = open("mthesaur.txt", 'r')
fout = open('mthesaur-vim.txt', 'w')

while line != "":
	line = fin.readline()
	line = line.replace('\n', '')
	words = line.split(',')
	for w in words[1:]:
		fout.write(words[0] + "," + w + "\n")

fin.close()
fout.close()
