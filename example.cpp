#include "example.h"
#include <iostream>

example::example() : count(0)
{
    std::cout << "constructor" << std::endl;
}

example::~example()
{
    std::cout << "deconstructor" << std::endl;
}

void example::doSomething() {
    count++;
    std::cout << "Did something :) -> Count is now " << count << std::endl; 
}
