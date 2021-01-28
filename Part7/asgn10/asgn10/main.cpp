
// reading a text file
#include <iostream>
#include <fstream>
#include <string>
#include<cstdlib>
using namespace std;
#include "CParser.h"

int main()
{
	// Part 7
	system("ppcrossx64 -al firstCode.pas");
	ifstream assembleCode;
	assembleCode.open("firstCode.s");
	string line = "";
	if (assembleCode.is_open())
	{
		while (getline(assembleCode, line))
		{
			cout << line << '\n';
		}
		assembleCode.close();
	}
	system("ppcrossx64 -al secondCode.pas");
	assembleCode.open("secondCode.s");
	if (assembleCode.is_open())
	{
		while (getline(assembleCode, line))
		{
			cout << line << '\n';
		}
		assembleCode.close();
	}
	system("ppcrossx64 -al thirdCode.pas");
	assembleCode.open("thirdCode.s");
	if (assembleCode.is_open())
	{
		while (getline(assembleCode, line))
		{
			cout << line << '\n';
		}
		assembleCode.close();
	}
	system("ppcrossx64 -al forthCode.pas");
	assembleCode.open("forthCode.s");
	if (assembleCode.is_open())
	{
		while (getline(assembleCode, line))
		{
			cout << line << '\n';
		}
		assembleCode.close();
	}
	system("ppcrossx64 -al fifthCode.pas");
	assembleCode.open("fifthCode.s");
	if (assembleCode.is_open())
	{
		while (getline(assembleCode, line))
		{
			cout << line << '\n';
		}
		assembleCode.close();
	}
};

