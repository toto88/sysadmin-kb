###############################################
# This Python code is for parsing Apache Log to output the subnet occurence by month.
###############################################



import re
regex = '(^[(\d\.)]+) (.*) \[(.*?)\] (.*)'

#Exemple of a line that we are going to parse and apply regex on it
#192.168.235.1 192.168.235.1 - - [26/Oct/2015:14:10:08 +0100] "GET /hra-space/javascript/dojo-hr/dijit/DialogUnderlay.js HTTP/1.1" 200 1382

# access_log is our log file to parse
p = open('access_log\\access_log')
M = {}
k=0

# This code is define a dict M that hold the number of occurence of each subnet by month
# the key of dict M is the subnet
# and the values is another dict which it's key is the month and values is the number if occurence of this subnet is that month
for line in p:
    parse= re.match(regex, str(line))
    if parse is not None :
        #validiting each line by a regex so you access elements by index
        e = re.match(regex, str(line)).groups()
        month = e[2].split("/")[1]
        subnet= '.'.join(e[0].split(".")[:3])
        #print subnet
        if subnet in M:
            if month in M[subnet]:
                M[subnet][month] +=1
            else:
                M[subnet][month]=1
        else :
            M[subnet] = {month : 1}



months = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sept","Oct","Nov","Dec"]

#getting top subnet by month
for month in months :
    L={}
    #defining a new dict L ( that each time of loop), this dict hold the number of occurence of subnet in a specific month
    #the key is the subnet and value is number of occurence
    for key,values in M.iteritems():
        if month in values.keys(): L[key]= values[month]

    print "####"+month+"####"
    k = 1
    for key, value in sorted(L.iteritems(), key=lambda (k,v): (v,k), reverse=True ):
            if  k < 11 :
                print "%s* %s: %s" % (k,key, value)
                k+=1
            else:
                break
