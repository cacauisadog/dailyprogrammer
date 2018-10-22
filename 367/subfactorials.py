# https://www.reddit.com/r/dailyprogrammer/comments/9cvo0f/20180904_challenge_367_easy_subfactorials_another/

def subfactorial(n):
    if n == 0:
        return 1
    if n == 1:
        return 0
    return (n-1) * (subfactorial(n - 1) + subfactorial(n - 2))

n = int(input('Enter your number: '))
print(subfactorial(n))
