#include <stdio.h>
#include <math.h>
#include "xraylib.h"

int main(void) {
    XRayInit();

    double weight = AtomicWeight(26, NULL);
    printf("C: AtomicWeight(Fe) = %f\n", weight);
    if (fabs(weight - 55.850) > 1E-3) {
        fprintf(stderr, "C: unexpected AtomicWeight value\n");
        return 1;
    }

    return 0;
}
