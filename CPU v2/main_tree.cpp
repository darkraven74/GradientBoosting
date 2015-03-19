#include <cstdlib>
#include <iostream>
#include <ctime>
#include <vector>
#include <cstdio>
#include "tree.h"

int main()
{
	clock_t sum = 0;
	int features_size = 100;
	int tests_size = 1000;
	data_set train_set("data2.txt", features_size, tests_size, true);
	//data_set test_set("Prototask.test", features_size, 1193, false);
	//data_set train_set("Prototask.train", features_size, tests_size, false);
	freopen("out.txt", "w", stdout);
	for (int i = -1; i < 0; i++)
	{
		clock_t time = clock();
		tree t(train_set, 1000000, 4);
		//float err = t.calculate_answer(train_set.tests[0]);
		//std::cout << "test err: " << err << std::endl;
		time = clock() - time;
		if (i >= 0)
		{
			sum += time;
		}
		printf("time: %f\n\n", (float)time / CLOCKS_PER_SEC);
	}
	sum /= 1;
	printf("avg time: %f\n\n", (float)sum / CLOCKS_PER_SEC);
	fclose(stdout);
	return 0;
}