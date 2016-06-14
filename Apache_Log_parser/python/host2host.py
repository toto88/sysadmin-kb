###############################################
# This Python code is for parsing Apache Log in order to :
#        1. Output hosts that generated most connection
#        2. Output hosts that received most connection
#        3. Output a list of hosts that generated connection to a specific host in the last hour
#        4. Output a list of hosts that received connection from a specific host in the last hour
###############################################




from datetime import *

# testlog is our log File
p = open("testlog")


most_src_host={}
most_dst_host={}

# defining two dictionaires:
# most_src_host to hold all source hosts and their number of occurence
# most_dest_host to hold all dest hosts and their number of occurence

for line in p:
    src=line.split(" ")[1]
    dst=line.split(" ")[2].rstrip("\n")
    if src in most_src_host.keys():
        most_src_host[src]+=1
    else:
        most_src_host[src]=1

    if dst in most_dst_host.keys():
        most_dst_host[dst]+=1
    else:
        most_dst_host[dst]=1

#most host generated connection
print "hosts generated most connection:"
for key,values in sorted(most_src_host.iteritems(), key=lambda (k,v): (v,k), reverse=True ):
    print key,values

#most host revceived connection
print "hosts received most connection:"
for key,values in sorted(most_dst_host.iteritems(), key=lambda (k,v): (v,k), reverse=True ):
    print key,values

#getting last hour timestamp comparing to the last entry in the log
lastdate=datetime.strptime(line.split(" ")[0],"%d/%b/%Y:%H:%M:%S")
lasthour=lastdate - timedelta(hours=1)
print lasthour

#defining a dict lastlog that will hold the timestamp, source host and destination host
#the key the dict lastlog is k (interger) and value is a list with tuple ( timestamp,source host, destination host)
p.seek(0)
lastlog=dict()
k=0
#getting last hour entry from log

for line in p:
    timestamp=datetime.strptime(line.split(" ")[0],"%d/%b/%Y:%H:%M:%S")
    if ( timestamp >= lasthour and timestamp <= lastdate ) :
#        print line
        lastlog[k]=[line.split(" ")[0],line.split(" ")[1],line.split(" ")[2].rstrip("\n")]
        k+=1


#get list of hosts that generated connection to a specific host (192.168.253.1) last hour
list_src_host=[]
for k,v in lastlog.iteritems():
    if "192.168.235.1" in v[2] and v[1] not in list_src_host:
       list_src_host.append(v[1])
print "list hosts that generated connection",list_src_host;

#get list of hosts that received connection from a specific host (192.168.253.1) last hour
list_dst_host=[]
for k,v in lastlog.iteritems():
    if "192.168.235.1" in v[1] and v[2] not in list_dst_host:
       list_dst_host.append(v[2])
print "list hosts that received connection",list_dst_host;



# print len(lastlog.keys())
