import sys

count = 0
def isPalindrome(string):
    global count
    l = len(string)
    answer = True
    for i in range(l//2 + 1):
        if string[i] != string[l - i - 1]:
            answer = False
    count += 1
    if(count % 1000000 == 0):
        print("Count = ", count)
    return answer
def splitShortestPalindrom(string): #Returns a list of strings consisting of the fewest palindromes
    l = len(string)
    if (l == 1 or isPalindrome(string)): #base case
        return [string]
    minPartionSize = l + 1 #the size of the minimal partition is less than this
    for i in range(1, l): #for each division of the string
        partition1 = splitShortestPalindrom(string[0:i])
        partition2 = splitShortestPalindrom(string[i:l])
        partitionSize = len(partition1) + len(partition2)
        if (partitionSize < minPartionSize):
            minPartionSize = partitionSize
            minPartition = [partition1, partition2]
    return minPartition[0] + minPartition[1]

def main():
    str1 = sys.argv[1]
    print("String:", str1, "Is palindrome:", isPalindrome(str1))
    print("Partition:", splitShortestPalindrom(str1))
    print("Count = ", count)
main()

