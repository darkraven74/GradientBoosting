#include <cstdlib>
#include <iostream>
#include <ctime>
#include <vector>
#include "tree.cuh"
#include "thrust\device_vector.h"

int main()
{
	clock_t sum = 0;
	int features_size = 21;
	int tests_size = 1500;
	data_set train_set("Prototask.train", features_size, tests_size, false);
	for (int i = -1; i < 10; i++)
	{
		clock_t time = clock();
		tree t(train_set, 1000000, 6);
		//float err = t.calculate_answer(train_set.tests[0]);
		//std::cout << "test err: " << err << std::endl;
		time = clock() - time;
		if (i >= 0)
		{
			sum += time;
		}
		printf("time: %f\n\n", (float)time / CLOCKS_PER_SEC);
	}
	sum /= 10.0;
	printf("avg time: %f\n\n", (float)sum / CLOCKS_PER_SEC);
	
	/*int features_size = 21;
	int tests_size = 1500;
	clock_t time = clock();
	data_set train_set("Prototask.train", features_size, tests_size, false);
	tree t(train_set, 1000000);
	time = clock() - time;
	printf("time: %f\n\n", (float)time / CLOCKS_PER_SEC);
	*/
	cudaDeviceReset();
	return 0;
}