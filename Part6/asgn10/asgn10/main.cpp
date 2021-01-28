
// reading a text file
#include <iostream>
#include <fstream>
#include <string>
#include<cstdlib>
using namespace std;
#include "CParser.h"

int main()
{
	// Part 6
	system("ppcrossx64 -al a.pas");
	ifstream assembleCode;
	assembleCode.open("a.s");
	string line = "";
	if (assembleCode.is_open())
	{
		while (getline(assembleCode, line))
		{
			cout << line << '\n';
		}
		assembleCode.close();
	}
}