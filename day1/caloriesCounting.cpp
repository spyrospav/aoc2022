#include <iostream>
#include <string>
#include <queue>

using namespace std;

int main() {
	
	int currentCalories = 0;
	string line;
	priority_queue<int> maxCalories;

	while (getline(cin, line)) {		
		if (line.empty()) {
			maxCalories.push(currentCalories);
			currentCalories = 0;
		}
		else {
			currentCalories += stoi(line);
		}
	}

	maxCalories.push(currentCalories);

	int elf1 = maxCalories.top();
	maxCalories.pop();
	int elf2 = maxCalories.top();
	maxCalories.pop();
	int elf3 = maxCalories.top();
	int total = elf1 + elf2 + elf3;

	cout << "1: " << elf1 << endl;
	cout << "2: " << elf2 << endl;
	cout << "3: " << elf3 << endl;
	cout << "Total: " << total << endl;

	return 0;

}
