import os, os.path

baseDir = os.path.dirname(os.path.realpath(__file__))
sFiles = os.listdir(".")

if not any(s.endswith('.s') for s in sFiles):
        print("no .s files found, program exit now")
else:
        for s in sFiles:
                if s.endswith('.s'):
                        os.symlink(s, os.path.splitext(s)[0]+'.t')
                        #print(os.path.splitext(s)[0])
                else:
                        exit
