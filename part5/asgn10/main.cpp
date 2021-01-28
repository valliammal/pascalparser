
// reading a text file
#include <iostream>
#include <fstream>
#include <string>
using namespace std;
#include "CParser.h"

int main()
{
// Part 8

	system("ppcrossx64 -al sixthCode.pas");
	ifstream assemblyFile;
	assemblyFile.open("sixthCode.s");
	string line = "";
	if (assemblyFile.is_open())
	{
		while (getline(assemblyFile, line))
		{
			cout << line << '\n';
		}
		assemblyFile.close();
	}

};

