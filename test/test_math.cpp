#include "gtest/gtest.h"

#include "include/math/math.hpp"

TEST(TestMath, AddInts)
{
    EXPECT_EQ(add_ints(1, 2), 3);
}
