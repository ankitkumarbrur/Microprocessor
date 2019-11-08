/*
 * Author : Naveen Rohilla
 * Objective : TYPING
*/
 
 
#include <iostream>
using namespace std;

void check(string * & str, int & index, string & s, float * & time, float & sum) {
	float t = 0;
	for (int i = 0; i < index; i++) {
		if (str[i] == s) {
			sum += time[i] / 2;
			return;
		}
	}
	int l = s.length();
	for (int i = 0; i < l; i++) {
		if (i) {
			if ((((s[i] == 'd') || (s[i] == 'f')) && ((s[i - 1] == 'j') || (s[i - 1] == 'k'))) || 
			(((s[i] == 'j') || (s[i] == 'k')) && ((s[i - 1] == 'd') || (s[i - 1] == 'f')))) {
				t += 0.2;
			}
			else {
				t += 0.4;
			}
		}
		else {
			t += 0.2;
		}
	}
	str[index] = s;
	time[index] = t;
	sum += t;
	index++;
}

int main() {
	int t, n, i, index;
	float * time, sum;
	string * str, s;
	cin >> t;
	while (t--) {
		index = sum = 0;
		cin >> n;
		str = new string[n];
		time = new float[n];
		for (i = 0; i < n; i++) {
			cin >> s;
			check(str, index, s, time, sum);
		}
		cout << sum * 10 << endl;
	}
	
	return 0;
}
