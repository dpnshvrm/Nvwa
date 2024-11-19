import pickle, sys

file = sys.argv[1]
trials = pickle.load(open(file, "rb"))
alldicts = trials.trials
loss = trials.losses()

for i in range(len(loss)):
    print(str(10000 - int(alldicts[i]['misc']['vals']['pos'][0]))+'\t'+str(10000 + int(alldicts[i]['misc']['vals']['pos'][0]))+'\t'+str(loss[i]))
