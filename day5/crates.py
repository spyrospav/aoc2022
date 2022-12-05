import sys
import re
import copy

file = open(sys.argv[1], 'r')
lines = file.readlines()
  
crates9000 = []
crates9001 = []
first = True
crates9000Read = False
movesStart = False
# Strips the newline character
for line in lines:
    if not crates9000Read:
        if '1' in line:
            crates9000Read = True
            continue
        line = ''.join("" if i % 4 == 0 else char for i, char in enumerate(line, 1))
        words = [line[i:i+3] for i in range(0, len(line), 3)]
        
        if first:
            crates9000 = [[] for i in range(len(words))]
            first = False
        i = 0
        for word in words:
                if (word != '   '):
                    crates9000[i].append(word.strip('\n'))
                i += 1
    elif crates9000Read and not movesStart:
        movesStart = True
        crates9001 = copy.deepcopy(crates9000)
    else:
        n, src, trg = map(int, re.findall(r'\d+', line))
        # CrateMover 9000
        for i in range(int(n)):
            crates9000[int(trg) - 1].insert(0, crates9000[int(src) - 1].pop(0))
        # CrateMover 9001
        crates9001[int(trg) - 1][0:0] = crates9001[int(src) - 1][0:n]
        crates9001[int(src) - 1] = crates9001[int(src) - 1][n:]

message = ''
for crate in crates9000:
    message += crate[0].strip('[').strip(']')
print(message)

message = ''
for crate in crates9001:
    message += crate[0].strip('[').strip(']')
print(message)