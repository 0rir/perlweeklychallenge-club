/*
TASK #1 > Ugly Numbers
Submitted by: Mohammad S Anwar
You are given an integer $n >= 1.

Write a script to find the $nth element of Ugly Numbers.

Ugly numbers are those number whose prime factors are 2, 3 or 5. For example,
the first 10 Ugly Numbers are 1, 2, 3, 4, 5, 6, 8, 9, 10, 12.

Example
Input: $n = 7
Output: 8

Input: $n = 10
Output: 12
*/

#include <iostream>
#include <deque>
#include <string>
#include <algorithm>

int min3(int a, int b, int c) {
    return std::min(a, std::min(b, c));
}

// hamming number generator
std::deque<int> q2, q3, q5;

int next_hamming() {
    // init three queues with 1
    if (q2.empty()) {
        q2.push_back(1);
        q3.push_back(1);
        q5.push_back(1);
    }

    // get the smallest of the queue heads
    int n = min3(q2.front(), q3.front(), q5.front());

    // shift used multiples
    if (n == q2.front()) q2.pop_front();
    if (n == q3.front()) q3.pop_front();
    if (n == q5.front()) q5.pop_front();

    // push next multiples
    q2.push_back(2*n);
    q3.push_back(3*n);
    q5.push_back(5*n);

    return n;
}

int main(int argc, char* argv[]) {
    if (argc == 2) {
        for (int i = 0; i < atoi(argv[1]); i++)
            std::cout << next_hamming() << std::endl;
    }
}
