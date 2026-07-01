#include <cstdio>
#include <cmath>
#include <stdexcept>
#include "xraylib++.h"

using namespace std;

int main() {
    XRayInit();

    double weight = xrlpp::AtomicWeight(26);
    printf("C++: AtomicWeight(Fe) = %f\n", weight);
    if (fabs(weight - 55.850) > 1E-3) {
        fprintf(stderr, "C++: unexpected AtomicWeight value\n");
        return 1;
    }

    return 0;
}
